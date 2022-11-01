package com.clone.baemin.coupon;

import com.clone.baemin.util.PageNationUtil;
import com.clone.baemin.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

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
}
