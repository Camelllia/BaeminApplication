package com.clone.baemin.coupon;

import com.clone.baemin.util.PageNationUtil;
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
 * */

@Controller
public class CouponController {

    @Autowired
    CouponService couponService;

    @Autowired
    PageNationUtil pageNationUtil;

    @RequestMapping(value = "/couponList/orderType={orderType}&stateCode={stateCode}&pageNum={pageNum}", method = {RequestMethod.GET, RequestMethod.POST})
    public String couponList(@PathVariable("orderType") int orderType , @PathVariable("stateCode") int stateCode, @PathVariable("pageNum") int pageNum,
                             Model model, HttpSession session) {


        HashMap<String, Integer> pageNationParam = pageNationUtil.setPageNation(couponService.selectCouponTotalCount(SessionUtil.getLoginMemberIdn(session), stateCode), pageNum);

        model.addAttribute("curPageNum", pageNum);
        model.addAttribute("totalPageNum", pageNationParam.get("totalPageNum"));
        model.addAttribute("couponLists", couponService.selectCouponList(orderType, stateCode, SessionUtil.getLoginMemberIdn(session), pageNationParam.get("limit"), pageNationParam.get("offset")));
        model.addAttribute("orderType", orderType);
        model.addAttribute("stateCode", stateCode);
        return "coupon/list";
    }

    @RequestMapping(value = "/coupon/insert", method = {RequestMethod.GET, RequestMethod.POST})
    public String insert() {
        return "coupon/insert";
    }

    @RequestMapping(value = "/createCoupon", method = {RequestMethod.POST})
    @ResponseBody
    public String createCoupon(@RequestParam("couponName") String couponName, @RequestParam("discountAmount") String discountAmount, HttpSession session) {
        JSONObject resultObj = new JSONObject();
        resultObj.put("resultCode", 1);

        if(!StringUtils.isNoneBlank(couponName, discountAmount)) {
            resultObj.put("resultCode", -10);
        }

        if(resultObj.get("resultCode").equals(1)) {
            couponService.insertCoupon(couponName, Integer.valueOf(discountAmount), SessionUtil.getLoginMemberIdn(session));
        }

        return resultObj.toString();
    }
}
