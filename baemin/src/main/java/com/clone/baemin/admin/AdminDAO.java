package com.clone.baemin.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;

@Component
public class AdminDAO {

    @Autowired
    SqlSession sqlSession;

    public List<HashMap> selectMemberList(int orderType) {
        String sqlId = "selectMemberList";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("orderType", orderType);
        return sqlSession.selectList(sqlId, param);
    }
}
