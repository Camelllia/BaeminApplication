package com.clone.baemin.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;

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

    public HashMap selectUserInfo(String userEmail, String userPw) {
        String sqlId = "selectUserInfo";
        HashMap<String, String> param = new HashMap<>();
        param.put("userEmail", userEmail);
        param.put("userPw", userPw);
        return sqlSession.selectOne(sqlId, param);
    }

    public int selectUserInfoCount(String userEmail, String userPw) {
        String sqlId = "selectUserInfoCount";
        HashMap<String, String> param = new HashMap<>();
        param.put("userEmail", userEmail);
        param.put("userPw", userPw);
        return sqlSession.selectOne(sqlId, param);
    }

    public int insertLoginLog(String userEmail, String regIp) {
        String sqlId = "insertLoginLog";
        HashMap<String, String> param = new HashMap<>();
        param.put("userEmail", userEmail);
        param.put("regIp", regIp);
        return sqlSession.insert(sqlId, param);
    }

    public List<HashMap> selectMemberList(int orderType) {
        String sqlId = "selectMemberList";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("orderType", orderType);
        return sqlSession.selectList(sqlId, param);
    }
}
