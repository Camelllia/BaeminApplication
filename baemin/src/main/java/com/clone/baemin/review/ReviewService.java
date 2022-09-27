package com.clone.baemin.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {

    @Autowired
    ReviewDAO reviewDAO;

    public int insertReview(String reviewTitle, String reviewContent, int reviewScore, String imgPath,
                            int storeIdn, int userIdn, String userNickname) {
        return reviewDAO.insertReview(reviewTitle, reviewContent, reviewScore, imgPath, storeIdn, userIdn, userNickname);
    }
}
