package com.clone.baemin.coupon;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;

@Component
public class CouponDAO {

    @Autowired
    SqlSession sqlSession;

    public List<HashMap> selectCouponList(int orderType, int stateCode, int userIdn) {
        String sqlId = "selectCouponList";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("userIdn", userIdn);
        param.put("orderType", orderType);
        param.put("stateCode", stateCode);
        return sqlSession.selectList(sqlId, param);
    }
}