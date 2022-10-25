package com.clone.baemin.store;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;

@Component
public class StoreDAO {

    @Autowired
    SqlSession sqlSession;

    public List<HashMap> selectStoreList(int catagoryNum, int orderType) {
        String sqlId = "selectStoreList";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("categoryNum", catagoryNum);
        param.put("orderType", orderType);

        return sqlSession.selectList(sqlId, param);
    }

    public HashMap selectTargetStoreInfo(int storeIdn) {
        String sqlId = "selectTargetStoreInfo";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("storeIdn", storeIdn);

        return sqlSession.selectOne(sqlId, param);
    }

    public List<HashMap> selectStoreMenuList(int storeIdn) {
        String sqlId = "selectStoreMenuList";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("storeIdn", storeIdn);

        return sqlSession.selectList(sqlId, param);
    }

    public int insertStore(String storeName, String storeAddress, String storeIntro, String storePhonenum, int minDelevery, int deleveryTip, int deleveryTime, int categoryNum, String imgPath) {
        String sqlId = "insertStore";
        HashMap<String, Object> param = new HashMap<>();
        param.put("storeName", storeName);
        param.put("storeAddress", storeAddress);
        param.put("storeIntro", storeIntro);
        param.put("storePhonenum", storePhonenum);
        param.put("minDelevery", minDelevery);
        param.put("deleveryTip", deleveryTip);
        param.put("deleveryTime", deleveryTime);
        param.put("categoryNum", categoryNum);
        param.put("imgPath", imgPath);
        return sqlSession.insert(sqlId, param);
    }
}
