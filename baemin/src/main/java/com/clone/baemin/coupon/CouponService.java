package com.clone.baemin.coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CouponService {

    @Autowired
    CouponDAO couponDAO;

    public List<HashMap> selectCouponList(int orderType, int stateCode, int userIdn) {
        return couponDAO.selectCouponList(orderType, stateCode, userIdn);
    }
}
