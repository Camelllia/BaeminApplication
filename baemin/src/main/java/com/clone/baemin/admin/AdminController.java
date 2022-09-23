package com.clone.baemin.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @Autowired
    AdminService adminService;

    @RequestMapping("/memberList/orderType={orderType}")
    public String admin(@PathVariable("orderType") int orderType, Model model) {
        model.addAttribute("memberLists", adminService.selectMemberList(orderType));
        return "/admin/list";
    }
}
