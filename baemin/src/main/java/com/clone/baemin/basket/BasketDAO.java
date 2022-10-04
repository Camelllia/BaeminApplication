package com.clone.baemin.basket;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;

@Component
public class BasketDAO {

    @Autowired
    SqlSession sqlSession;

    public int insertBasket(String menuName, int menuPrice, int storeIdn, int userIdn) {
        String sqlId = "insertBasket";

        HashMap<String, Object> param = new HashMap<>();
        param.put("menuName", menuName);
        param.put("menuPrice", menuPrice);
        param.put("storeIdn", storeIdn);
        param.put("userIdn", userIdn);

        return sqlSession.insert(sqlId, param);
    }
}
