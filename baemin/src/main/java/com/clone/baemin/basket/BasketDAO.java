package com.clone.baemin.basket;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BasketDAO {

    @Autowired
    SqlSession session;
}