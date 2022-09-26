package com.clone.baemin.store;

import com.clone.baemin.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class StoreController {

    @Autowired
    StoreService storeService;

    @RequestMapping(value = "/category", method = {RequestMethod.GET, RequestMethod.POST})
    public String category(Model model, HttpSession session) {
        if(SessionUtil.getLoginMemberNickname(session) == null) {
            return "user/login";
        }
        model.addAttribute("userNickname", SessionUtil.getLoginMemberNickname(session));
        return "store/category";
    }

    @RequestMapping(value = "/store/detail/{storeIdn}", method = {RequestMethod.GET, RequestMethod.POST})
    public String detail(@PathVariable("storeIdn") int storeIdn, Model model, HttpSession session) {
        if(SessionUtil.getLoginMemberNickname(session) == null) {
            return "user/login";
        }
        model.addAttribute("storeInfo", storeService.selectTargetStoreInfo(storeIdn));
        return "store/detail";
    }

    @RequestMapping(value = "/store/categoryNum={categoryNum}&orderType={orderType}", method = {RequestMethod.GET, RequestMethod.POST})
    public String store(@PathVariable("categoryNum") int categoryNum, @PathVariable("orderType") int orderType, Model model) {
        model.addAttribute("storeList", storeService.selectStoreList(categoryNum, orderType));
        model.addAttribute("categoryNum", categoryNum);
        model.addAttribute("orderType", orderType);
        return "store/store";
    }
}
