package com.clone.baemin.order;

import com.clone.baemin.basket.BasketService;
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
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    BasketService basketService;

    @RequestMapping(value = "/order/{storeIdn}", method = {RequestMethod.GET, RequestMethod.POST})
    public String order(@PathVariable("storeIdn") int storeIdn, Model model, HttpSession session) {

        HashMap<String, String> baksetInfoMap = basketService.selectBasketTotalPrice(SessionUtil.getLoginMemberIdn(session), storeIdn);
        if(baksetInfoMap != null) {
            baksetInfoMap.put("paymentPrice", String.valueOf(Integer.parseInt(String.valueOf(baksetInfoMap.get("totalPrice"))) + Integer.parseInt(String.valueOf(baksetInfoMap.get("deleveryTip")))));
        }

        model.addAttribute("basketInfo", baksetInfoMap);
        return "/order/order";
    }

    @RequestMapping(value = "/orderList/orderType={orderType}", method = {RequestMethod.GET, RequestMethod.POST})
    public String list(@PathVariable("orderType") int orderType, Model model, HttpSession session) {
        model.addAttribute("orderLists", orderService.selectUserOrderList(SessionUtil.getLoginMemberIdn(session), orderType));
        return "order/list";
    }

}
