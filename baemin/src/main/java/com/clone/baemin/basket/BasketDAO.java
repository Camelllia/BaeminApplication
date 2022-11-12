package com.clone.baemin.basket;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;

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

    public List<HashMap> selectUserBasketList(int userIdn, int storeIdn) {
        String sqlId = "selectUserBasketList";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("userIdn", userIdn);
        param.put("storeIdn", storeIdn);
        return sqlSession.selectList(sqlId, param);
    }

    public int deleteTargetBasket(int basketIdn) {
        String sqlId = "deleteTargetBasket";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("basketIdn", basketIdn);
        return sqlSession.delete(sqlId, param);
    }

    public HashMap<String, String> selectBasketTotalPrice(int userIdn, int storeIdn) {
        String sqlId = "selectBasketInfo";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("userIdn", userIdn);
        param.put("storeIdn", storeIdn);
        return sqlSession.selectOne(sqlId, param);
    }

    public int deleteOrderedBasket(int userIdn, int storeIdn) {
        String sqlId = "deleteOrderedBasket";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("userIdn", userIdn);
        param.put("storeIdn", storeIdn);
        return sqlSession.delete(sqlId, param);
    }
}
