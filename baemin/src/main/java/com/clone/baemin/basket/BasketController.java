package com.clone.baemin.basket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BasketController {

    @Autowired
    BasketService basketService;
}
