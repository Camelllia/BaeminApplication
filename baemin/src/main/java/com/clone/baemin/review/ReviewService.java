package com.clone.baemin.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class ReviewService {

    @Autowired
    ReviewDAO reviewDAO;

    public int insertReview(String reviewTitle, String reviewContent, int reviewScore, String imgPath,
                            int storeIdn, int userIdn, String userNickname) {
        return reviewDAO.insertReview(reviewTitle, reviewContent, reviewScore, imgPath, storeIdn, userIdn, userNickname);
    }

    public List<HashMap> selectStoreReviewList(int storeIdn) {
        return reviewDAO.selectStoreReviewList(storeIdn);
    }

    public List<HashMap> selectUserReviewList(int userIdn) {
        return reviewDAO.selectUserReviewList(userIdn);
    }

    public int deleteTargetReview(int reviewIdn) {
        return reviewDAO.deleteTargetReview(reviewIdn);
    }
}
