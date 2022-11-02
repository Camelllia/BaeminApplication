package com.clone.baemin.review;

import com.clone.baemin.util.CommonUtil;
import com.clone.baemin.util.PageNationUtil;
import com.clone.baemin.util.SessionUtil;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.UUID;

/*
*
* ResultCode
* 1 : 성공
* -10 : 리뷰 점수 유효성 에러
* -20 : 리뷰 제목 or 리뷰 내용 유효성 에러
* -30 : 매장 정보 미확인 에러
* -40 : 파일 확장자 유효성 에러
* -50 : 리뷰 정보 파라미터 유효성 에러
* */


@Controller
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @Autowired
    PageNationUtil pageNationUtil;

    @RequestMapping(value = "/review/form/{storeIdn}", method = {RequestMethod.GET, RequestMethod.POST})
    public String form(@PathVariable("storeIdn") int storeIdn, Model model, HttpSession session) {
        if(SessionUtil.getLoginMemberNickname(session) == null) {
            return "user/login";
        }
        model.addAttribute("storeIdn", storeIdn);
        return "review/form";
    }

    @RequestMapping(value = "/reviewList/pageNum={pageNum}", method = {RequestMethod.GET, RequestMethod.POST})
    public String list(@PathVariable("pageNum") int pageNum, Model model, HttpSession session) {

        HashMap<String, Integer> pageNationParam = pageNationUtil.setPageNation(reviewService.selectUserReviewListTotalCount(SessionUtil.getLoginMemberIdn(session)), pageNum);

        model.addAttribute("curPageNum", pageNum);
        model.addAttribute("totalPageNum", pageNationParam.get("totalPageNum"));
        model.addAttribute("reviewLists", reviewService.selectUserReviewList(SessionUtil.getLoginMemberIdn(session), pageNationParam.get("limit"), pageNationParam.get("offset")));
        return "review/list";
    }

    @RequestMapping(value = "/insertReview", method = RequestMethod.POST)
    @ResponseBody
    public String insertReview(@RequestParam("reviewTitle") String reviewTitle, @RequestParam("reviewContent") String reviewContent,
                               @RequestParam("reviewScore") String reviewScore, @RequestParam("storeIdn") String storeIdn,
                               @RequestParam(value = "imgFile", required = false) MultipartFile imgFile, @RequestParam(value = "fileName", required = false) String fileName,
                               HttpServletRequest request, HttpSession session) {
        JSONObject resultObj = new JSONObject();
        resultObj.put("resultCode", 1);

        if(Integer.valueOf(reviewScore) > 5 || Integer.valueOf(reviewScore) < 0) {
            resultObj.put("resultCode", -10);
            resultObj.toString();
        }
        if(StringUtils.isBlank(reviewTitle) || StringUtils.isBlank(reviewContent)) {
            resultObj.put("resultCode", -20);
            return resultObj.toString();
        }
        if(StringUtils.isBlank(storeIdn)) {
            resultObj.put("resultCode", -30);
            return resultObj.toString();
        }

        if(imgFile != null) {
            String extension = fileName.substring(fileName.lastIndexOf("."), fileName.length());
            if(!CommonUtil.isVaildExtension(extension)) {
                resultObj.put("resultCode", -40);
                return resultObj.toString();
            }

            UUID uuid = UUID.randomUUID();
            String newFileName = uuid.toString() + extension;
            ServletContext servletContext = request.getSession().getServletContext();
            String uploadPath = servletContext.getRealPath("/upload/") + newFileName;

            try {
                imgFile.transferTo(new File(uploadPath));
            } catch (Exception e) {
                e.printStackTrace();
            }

            reviewService.insertReview(reviewTitle, reviewContent, Integer.valueOf(reviewScore), newFileName, Integer.valueOf(storeIdn), SessionUtil.getLoginMemberIdn(session), SessionUtil.getLoginMemberNickname(session));
        } else {
            reviewService.insertReview(reviewTitle, reviewContent, Integer.valueOf(reviewScore), "", Integer.valueOf(storeIdn), SessionUtil.getLoginMemberIdn(session), SessionUtil.getLoginMemberNickname(session));
        }
        return resultObj.toString();
    }

    @RequestMapping(value = "/deleteReview", method = RequestMethod.POST)
    @ResponseBody
    public String deleteTargetReview(@RequestParam("reviewIdn") int reviewIdn) {
        JSONObject resultObj = new JSONObject();
        resultObj.put("resultCode", 1);

        if(Integer.valueOf(reviewIdn) == null) {
            resultObj.put("resultCode", -50);
            resultObj.toString();
        }

        reviewService.deleteTargetReview(reviewIdn);

        return resultObj.toString();
    }
}
