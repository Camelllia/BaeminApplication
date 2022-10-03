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
}
