package com.clone.baemin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

    @Autowired
    TestDAO testDAO;

    @RequestMapping(value = "/")
    public String test() {
        System.out.println(testDAO.selectUser());
        return "test";
    }

    @RequestMapping(value = "/home")
    public String home() {
        return "home";
    }
}
