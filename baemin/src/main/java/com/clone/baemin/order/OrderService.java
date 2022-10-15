package com.clone.baemin.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class OrderService {

    @Autowired
    OrderDAO orderDAO;

    public List<HashMap> selectUserOrderList(int userIdn, int orderType, int limit, int offset) {
        return orderDAO.selectUserOrderList(userIdn, orderType, limit, offset);
    }

    public int insertOrder(HashMap<String, Object> param) {
        orderDAO.insertOrder(param);
        return (Integer) param.get("orderIdn");
    }

    public HashMap selectTargetOrder(int orderIdn, int userIdn) {
        return orderDAO.selectTargetOrder(orderIdn, userIdn);
    }

    public int selectOrderTotalCount(int userIdn) {
        return orderDAO.selectOrderTotalCount(userIdn);
    }
}
