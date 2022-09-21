package com.clone.baemin.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StoreController {

    @RequestMapping(value = "/category", method = {RequestMethod.GET, RequestMethod.POST})
    public String category() {
        return "store/category";
    }

    @RequestMapping(value = "/store", method = {RequestMethod.GET, RequestMethod.POST})
    public String store() {
        return "store/store";
    }
}
