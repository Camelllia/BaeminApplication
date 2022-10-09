package com.clone.baemin.coupon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.plaf.ListUI;
import java.util.HashMap;
import java.util.List;

@Service
public class CouponService {

    @Autowired
    CouponDAO couponDAO;

    public List<HashMap> selectCouponList(int orderType, int stateCode, int userIdn) {
        return couponDAO.selectCouponList(orderType, stateCode, userIdn);
    }

    public List<HashMap> selectVaildCouponList(int userIdn) {
        return couponDAO.selectVaildCouponList(userIdn);
    }

    public int updateCouponUseYn(int couponIdn) {
        return couponDAO.updateCouponUseYn(couponIdn);
    }
}
