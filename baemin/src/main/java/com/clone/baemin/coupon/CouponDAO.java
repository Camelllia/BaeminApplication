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

    public List<HashMap> selectCouponList(int orderType, int stateCode, int userIdn, int limit, int offset) {
        String sqlId = "selectCouponList";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("userIdn", userIdn);
        param.put("orderType", orderType);
        param.put("stateCode", stateCode);
        param.put("limit", limit);
        param.put("offset", offset);
        return sqlSession.selectList(sqlId, param);
    }

    public List<HashMap> selectVaildCouponList(int userIdn) {
        String sqlId = "selectVaildCouponList";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("userIdn", userIdn);
        return sqlSession.selectList(sqlId, param);
    }

    public int updateCouponUseYn(int couponIdn) {
        String sqlId = "updateCouponUseYn";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("couponIdn", couponIdn);
        return sqlSession.update(sqlId, param);
    }

    public int selectCouponTotalCount(int userIdn, int stateCode) {
        String sqlId = "selectCouponTotalCount";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("userIdn", userIdn);
        param.put("stateCode", stateCode);
        return sqlSession.selectOne(sqlId, param);
    }

    public int insertCoupon(String couponName, int discountAmount, int userIdn) {
        String sqlId = "insertCoupon";
        HashMap<String, Object> param = new HashMap<>();
        param.put("couponName", couponName);
        param.put("discountAmount", discountAmount);
        param.put("userIdn", userIdn);
        return sqlSession.insert(sqlId, param);
    }
}
