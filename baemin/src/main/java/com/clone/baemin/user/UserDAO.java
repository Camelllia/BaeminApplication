package com.clone.baemin.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;

@Component
public class UserDAO {

    @Autowired
    SqlSession sqlSession;

    public int insertUserAccount(String userEmail, String userPw, String userNickname, String userPhonenum) {
        String sqlId = "inserUserAccountInfo";
        HashMap<String, String> param = new HashMap<>();
        param.put("userEmail", userEmail);
        param.put("userPw", userPw);
        param.put("userNickname", userNickname);
        param.put("userPhonenum", userPhonenum);

        return sqlSession.insert(sqlId, param);
    }

    public int selectEmailCount(String userEmail) {
        String sqlId = "selectEmailCount";
        HashMap<String, String> param = new HashMap<>();
        param.put("userEmail", userEmail);

        return sqlSession.selectOne(sqlId, param);
    }
}
