package com.clone.baemin.coupon;

import com.clone.baemin.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class CouponController {

    @Autowired
    CouponService couponService;

    @RequestMapping(value = "/couponList/orderType={orderType}&stateCode={stateCode}", method = {RequestMethod.GET, RequestMethod.POST})
    public String couponList(@PathVariable("orderType") int orderType , @PathVariable("stateCode") int stateCode,
                             Model model, HttpSession session) {
        model.addAttribute("couponLists", couponService.selectCouponList(orderType, stateCode, SessionUtil.getLoginMemberIdn(session)));
        model.addAttribute("orderType", orderType);
        model.addAttribute("stateCode", stateCode);
        return "coupon/couponList";
    }
}
