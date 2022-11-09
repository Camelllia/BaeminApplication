package com.clone.baemin.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;

@Component
public class ReviewDAO {

    @Autowired
    SqlSession sqlSession;

    public int insertReview(String reviewTitle, String reviewContent, int reviewScore, String imgPath,
                            int storeIdn, int userIdn, String userNickname) {
        String sqlId = "insertReview";
        HashMap<String, Object> param = new HashMap<>();
        param.put("reviewTitle", reviewTitle);
        param.put("reviewContent", reviewContent);
        param.put("reviewScore", reviewScore);
        param.put("imgPath", imgPath);
        param.put("storeIdn", storeIdn);
        param.put("userIdn", userIdn);
        param.put("userNickname", userNickname);
        return sqlSession.insert(sqlId, param);
    }

    public List<HashMap> selectStoreReviewList(int storeIdn) {
        String sqlId= "selectStoreReviewList";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("storeIdn", storeIdn);
        return sqlSession.selectList(sqlId, param);
    }

    public List<HashMap> selectUserReviewList(int userIdn, int limit, int offset) {
        String sqlId = "selectUserReviewList";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("userIdn", userIdn);
        param.put("limit", limit);
        param.put("offset", offset);
        return sqlSession.selectList(sqlId, param);
    }

    public int selectUserReviewListTotalCount(int userIdn) {
        String sqlId = "selectUserReviewListTotalCount";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("userIdn", userIdn);
        return sqlSession.selectOne(sqlId, param);
    }

    public int deleteTargetReview(int reviewIdn) {
        String sqlId = "deleteTargetReview";
        HashMap<String, Integer> param = new HashMap<>();
        param.put("reviewIdn", reviewIdn);
        return sqlSession.delete(sqlId, param);
    }
}
