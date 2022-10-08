package com.clone.baemin.point;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;

@Component
public class PointDAO {

    @Autowired
    SqlSession sqlSession;

    public int chargeUserPoint(int chargePoint, int userIdn) {
        String sqlId = "chargeUserPoint";

        HashMap<String, Integer> param = new HashMap<>();
        param.put("chargePoint", chargePoint);
        param.put("userIdn", userIdn);

        return sqlSession.update(sqlId, param);
    }

    public int updateUserPoint(int paymentPrice, int userIdn) {
        String sqlId = "updateUserPoint";

        HashMap<String, Integer> param = new HashMap<>();
        param.put("paymentPrice", paymentPrice);
        param.put("userIdn", userIdn);

        return sqlSession.update(sqlId, param);
    }
}
