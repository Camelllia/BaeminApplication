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
}
