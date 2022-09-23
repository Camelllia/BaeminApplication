package com.clone.baemin.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class StoreService {

    @Autowired
    StoreDAO storeDAO;

    public List<HashMap> selectStoreList(int categoryNum, int orderType) {
        return storeDAO.selectStoreList(categoryNum, orderType);
    }
}
