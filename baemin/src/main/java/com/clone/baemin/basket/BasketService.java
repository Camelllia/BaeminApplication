package com.clone.baemin.basket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BasketService {

    @Autowired
    BasketDAO basketDAO;
}
