package com.clone.baemin.basket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BasketService {

    @Autowired
    BasketDAO basketDAO;

    public int insertBasket(String menuName, int menuPrice, int storeIdn, int userIdn) {
        return basketDAO.insertBasket(menuName, menuPrice, storeIdn, userIdn);
    }

    public List<HashMap> selectUserBasketList(int userIdn, int storeIdn) {
        return basketDAO.selectUserBasketList(userIdn, storeIdn);
    }

    public int deleteBasket(int basketIdn) {
        return basketDAO.deleteTargetBasket(basketIdn);
    }

    public HashMap<String, String> selectBasketTotalPrice(int userIdn, int storeIdn) {
        return basketDAO.selectBasketTotalPrice(userIdn, storeIdn);
    }
}
