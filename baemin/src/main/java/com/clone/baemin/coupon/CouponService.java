package com.clone.baemin.coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CouponService {

    @Autowired
    CouponDAO couponDAO;

    public List<HashMap> selectCouponList(int orderType, int stateCode, int userIdn, int limit, int offset) {
        return couponDAO.selectCouponList(orderType, stateCode, userIdn, limit, offset);
    }

    public List<HashMap> selectVaildCouponList(int userIdn) {
        return couponDAO.selectVaildCouponList(userIdn);
    }

    public int updateCouponUseYn(int couponIdn) {
        return couponDAO.updateCouponUseYn(couponIdn);
    }

    public int selectCouponTotalCount(int userIdn, int stateCode) {
        return couponDAO.selectCouponTotalCount(userIdn, stateCode);
    }

    public int insertCoupon(String couponName, int discountAmount, int userIdn) {
        return couponDAO.insertCoupon(couponName, discountAmount, userIdn);
    }
}
