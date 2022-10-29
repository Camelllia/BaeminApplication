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

    public HashMap selectTargetStoreInfo(int storeIdn) {
        return storeDAO.selectTargetStoreInfo(storeIdn);
    }

    public List<HashMap> selectStoreMenuList(int storeIdn) {
        return storeDAO.selectStoreMenuList(storeIdn);
    }

    public int insertStore(String storeName, String storeAddress, String storeIntro, String storePhonenum, int minDelevery, int deleveryTip, int deleveryTime, int categoryNum, String imgPath) {
        return storeDAO.insertStore(storeName, storeAddress, storeIntro, storePhonenum, minDelevery, deleveryTip, deleveryTime, categoryNum, imgPath);
    }

    public int insertMenu(String menuName, int menuPrice, int storeIdn, String imgPath) {
        return storeDAO.insertMenu(menuName, menuPrice, storeIdn, imgPath);
    }
}
