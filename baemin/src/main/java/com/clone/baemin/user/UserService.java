package com.clone.baemin.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
