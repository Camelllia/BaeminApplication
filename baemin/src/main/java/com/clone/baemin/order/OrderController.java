package com.clone.baemin.order;

import com.clone.baemin.basket.BasketService;
import com.clone.baemin.coupon.CouponService;
import com.clone.baemin.point.PointService;
import com.clone.baemin.user.UserService;
import com.clone.baemin.util.SessionUtil;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

/*
 *
 * ResultCode
 * 1 : 성공
 * -10 : 파라미터 공백 에러
 * -20 : 결제 유효성 에러
 * */


@Controller
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    BasketService basketService;

    @Autowired
    PointService pointService;

    @Autowired
    CouponService couponService;

    @RequestMapping(value = "/order/{storeIdn}", method = {RequestMethod.GET, RequestMethod.POST})
    public String order(@PathVariable("storeIdn") int storeIdn, Model model, HttpSession session) {

        HashMap<String, String> baksetInfoMap = basketService.selectBasketTotalPrice(SessionUtil.getLoginMemberIdn(session), storeIdn);
        if(baksetInfoMap != null) {
            baksetInfoMap.put("paymentPrice", String.valueOf(Integer.parseInt(String.valueOf(baksetInfoMap.get("totalPrice"))) + Integer.parseInt(String.valueOf(baksetInfoMap.get("deleveryTip")))));
        }

        model.addAttribute("basketInfo", baksetInfoMap);
        model.addAttribute("couponLists", couponService.selectVaildCouponList(SessionUtil.getLoginMemberIdn(session)));
        model.addAttribute("storeIdn", storeIdn);
        return "/order/order";
    }

    @RequestMapping(value = "/orderList/orderType={orderType}", method = {RequestMethod.GET, RequestMethod.POST})
    public String list(@PathVariable("orderType") int orderType, Model model, HttpSession session) {
        model.addAttribute("orderLists", orderService.selectUserOrderList(SessionUtil.getLoginMemberIdn(session), orderType));
        return "order/list";
    }

    @RequestMapping(value = "/createOrder", method = RequestMethod.POST)
    @ResponseBody
    public String createOrder(@RequestParam("kakaoAddress") String kakaoAddress, @RequestParam(value = "detailAddress") String detailAddress,
                              @RequestParam("paymentType") int paymentType, @RequestParam("storeIdn") int storeIdn,
                              @RequestParam(value = "paymentPoint") int paymentPoint, @RequestParam("orderPrice") int orderPrice,
                              @RequestParam("discountAmount") int discountAmount, @RequestParam("couponIdn") int couponIdn,
                              HttpSession session) {
        JSONObject resultObj = new JSONObject();
        resultObj.put("resultCode", -10);

        if(StringUtils.isNoneBlank(kakaoAddress, detailAddress, String.valueOf(orderPrice),String.valueOf(paymentType), String.valueOf(paymentPoint), String.valueOf(storeIdn))) {
            if(paymentPoint > pointService.selectUserPoint(SessionUtil.getLoginMemberIdn(session))) {
                resultObj.put("resultCode", -20);
                return resultObj.toString();
            }
            if((paymentPoint - (orderPrice - discountAmount)) < 0) {
                resultObj.put("resultCode", -20);
                return resultObj.toString();
            }
            resultObj.put("resultCode", 1);
            int paymentPrice = (orderPrice - discountAmount) > 0 ? (orderPrice - discountAmount) : 0;
            if(paymentType == 1) {
                paymentPrice = 0;
            }
            couponService.updateCouponUseYn(couponIdn);
            pointService.updateUserPoint(paymentPrice, SessionUtil.getLoginMemberIdn(session));
            orderService.insertOrder(kakaoAddress + detailAddress, orderPrice, paymentType, storeIdn, SessionUtil.getLoginMemberIdn(session));
        }

        return resultObj.toString();
    }
}
