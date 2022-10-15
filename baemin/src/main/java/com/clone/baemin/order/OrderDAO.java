package com.clone.baemin.order;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;

@Component
public class OrderDAO {

    @Autowired
    SqlSession sqlSession;

    public List<HashMap> selectUserOrderList(int userIdn, int orderType, int limit, int offset) {
        String sqlId = "selectUserOrderList";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("userIdn", userIdn);
        param.put("orderType", orderType);
        param.put("limit", limit);
        param.put("offset", offset);
        return sqlSession.selectList(sqlId, param);
    }

    public int insertOrder(HashMap<String, Object> param) {
        String sqlId = "insertOrder";
        return sqlSession.insert(sqlId, param);
    }

    public HashMap selectTargetOrder(int orderIdn, int userIdn) {
        String sqlId = "selectTargetOrder";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("orderIdn", orderIdn);
        param.put("userIdn", userIdn);
        return sqlSession.selectOne(sqlId, param);
    }

    public int selectOrderTotalCount(int userIdn) {
        String sqlId = "selectOrderTotalCount";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("userIdn", userIdn);
        return sqlSession.selectOne(sqlId, param);
    }
}
