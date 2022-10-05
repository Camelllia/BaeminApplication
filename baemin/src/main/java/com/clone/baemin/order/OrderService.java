package com.clone.baemin.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class OrderService {

    @Autowired
    OrderDAO orderDAO;

    public List<HashMap> selectUserOrderList(int userIdn, int orderType) {
        return orderDAO.selectUserOrderList(userIdn, orderType);
    }

    public int insertOrder(String orderAddress, int orderPrice, int paymentType, int storeIdn, int userIdn) {
        return orderDAO.insertOrder(orderAddress, orderPrice, paymentType, storeIdn, userIdn);
    }
}
