package com.clone.baemin.order;

import com.clone.baemin.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class OrderController {

    @Autowired
    OrderService orderService;

    @RequestMapping(value = "/order", method = {RequestMethod.GET, RequestMethod.POST})
    public String order() {
        return "/order/order";
    }

    @RequestMapping(value = "/orderList/orderType={orderType}", method = {RequestMethod.GET, RequestMethod.POST})
    public String list(@PathVariable("orderType") int orderType, Model model, HttpSession session) {
        model.addAttribute("orderLists", orderService.selectUserOrderList(SessionUtil.getLoginMemberIdn(session), orderType));
        return "order/list";
    }

}
