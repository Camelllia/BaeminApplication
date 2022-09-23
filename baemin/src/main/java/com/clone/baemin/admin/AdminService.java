package com.clone.baemin.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class AdminService {

    @Autowired
    AdminDAO adminDAO;

    public List<HashMap> selectMemberList(int orderType) {
        return adminDAO.selectMemberList(orderType);
    }
}
