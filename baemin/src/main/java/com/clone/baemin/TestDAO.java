package com.clone.baemin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class TestDAO {

    @Autowired
    SqlSession sqlSession;

    public List selectUser() {
        String sqlId = "selectUser";
        return sqlSession.selectList(sqlId);
    }
}
