package com.clone.baemin.basket;

import com.clone.baemin.util.SessionUtil;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/*
 *
 * ResultCode
 * 1 : 성공
 * -10 : 파라미터 공백 에러
 * -20 :
 * -30 :
 * -40 :
 * -50 :
 * */

@Controller
public class BasketController {

    @Autowired
    BasketService basketService;

    @RequestMapping(value = "/basketList/{storeIdn}", method = {RequestMethod.GET, RequestMethod.POST})
    public String list(@PathVariable("storeIdn") int storeIdn, Model model) {
        model.addAttribute("storeIdn", storeIdn);
        return "basket/list";
    }

    @RequestMapping(value = "/insertBasket", method = RequestMethod.POST)
    @ResponseBody
    public String insertBasket(@RequestParam("menuName") String menuName, @RequestParam("menuPrice") int menuPrice, @RequestParam("storeIdn") int storeIdn, HttpSession session) {
        JSONObject resultObj = new JSONObject();
        resultObj.put("resultCode", 1);

        if(StringUtils.isBlank(menuName) || StringUtils.isBlank(Integer.toString(menuPrice)) || StringUtils.isBlank(Integer.toString(storeIdn))) {
            resultObj.put("resultCode", -10);
        }

        basketService.insertBasket(menuName, menuPrice, storeIdn, SessionUtil.getLoginMemberIdn(session));

        return resultObj.toString();
    }
}
