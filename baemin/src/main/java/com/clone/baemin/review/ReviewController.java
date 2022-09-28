package com.clone.baemin.review;

import com.clone.baemin.util.CommonUtil;
import com.clone.baemin.util.SessionUtil;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

/*
*
* ResultCode
* 1 : 성공
* -10 : 리뷰 점수 유효성 에러
* -20 : 리뷰 제목 or 리뷰 내용 유효성 에러
* */


@Controller
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @RequestMapping(value = "/review/form/{storeIdn}", method = {RequestMethod.GET, RequestMethod.POST})
    public String form(@PathVariable("storeIdn") int storeIdn, Model model, HttpSession session) {
        if(SessionUtil.getLoginMemberNickname(session) == null) {
            return "user/login";
        }
        model.addAttribute("storeIdn", storeIdn);
        return "review/form";
    }

    @RequestMapping(value = "/insertReview", method = RequestMethod.POST)
    @ResponseBody
    public String reviewForm(@RequestParam("reviewTitle") String reviewTitle, @RequestParam("reviewContent") String reviewContent,
                             @RequestParam("reviewScore") int reviewScore, @RequestParam(value = "imgFile", required = false) MultipartFile imgFile,
                             @RequestParam("storeIdn") int storeIdn, HttpSession session) {
        JSONObject resultObj = new JSONObject();
        resultObj.put("resultCode", 1);

        if(!CommonUtil.isVaildReviewScore(reviewScore)) {
            resultObj.put("resultCode", -10);
            return resultObj.toString();
        }

        if(reviewTitle.length() == 0 || reviewContent.length() == 0) {
            resultObj.put("resultCode", -20);
            return resultObj.toString();
        }

        System.out.println(reviewTitle);
        System.out.println(reviewContent);
        System.out.println(reviewScore);
        System.out.println(imgFile);
        System.out.println(storeIdn);

        //reviewService.insertReview(reviewTitle, reviewContent, reviewScore, "imgPath", storeIdn, SessionUtil.getLoginMemberIdn(session), SessionUtil.getLoginMemberNickname(session));

        return resultObj.toString();
    }
}
