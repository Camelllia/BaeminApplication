package com.clone.baemin.Point;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PointDAO {

    @Autowired
    SqlSession sqlSession;
}
