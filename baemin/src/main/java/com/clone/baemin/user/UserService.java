package com.clone.baemin.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class UserService {

    @Autowired
    UserDAO userDAO;

    public int insertUserAccount(String userEmail, String userPw, String userNickname, String userPhonenum) {
        return userDAO.insertUserAccount(userEmail, userPw, userNickname, userPhonenum);
    }

    public int selectEmailCount(String userEmail) {
        return userDAO.selectEmailCount(userEmail);
    }

    public HashMap selectUserInfo(String userEmail, String userPw) {
        return userDAO.selectUserInfo(userEmail, userPw);
    }

    public int selectUserInfoCount(String userEmail, String userPw) {
        return userDAO.selectUserInfoCount(userEmail, userPw);
    }

    public int insertLoginLog(String userEmail, String regIp) {
        return userDAO.insertLoginLog(userEmail, regIp);
    }

    public List<HashMap> selectMemberList(int orderType, int limit, int offset) {
        return userDAO.selectMemberList(orderType, limit, offset);
    }

    public int selectMemberListTotalCount() {
        return userDAO.selectMemberListTotalCount();
    }
}
