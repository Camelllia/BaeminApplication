package com.clone.baemin.basket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BasketService {

    @Autowired
    BasketDAO basketDAO;

    public int insertBasket(String menuName, int menuPrice, int storeIdn, int userIdn) {
        return basketDAO.insertBasket(menuName, menuPrice, storeIdn, userIdn);
    }
}
