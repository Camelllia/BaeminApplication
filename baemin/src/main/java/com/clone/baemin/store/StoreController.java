package com.clone.baemin.store;

import com.clone.baemin.review.ReviewService;
import com.clone.baemin.util.SessionUtil;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/*
 *
 * ResultCode
 * 1 : 성공
 * -10 : 리뷰 점수 유효성 에러
 * */

@Controller
public class StoreController {

    @Autowired
    StoreService storeService;

    @Autowired
    ReviewService reviewService;

    @RequestMapping(value = "/category", method = {RequestMethod.GET, RequestMethod.POST})
    public String category(Model model, HttpSession session) {
        if(SessionUtil.getLoginMemberNickname(session) == null) {
            return "user/login";
        }
        model.addAttribute("userNickname", SessionUtil.getLoginMemberNickname(session));
        return "store/category";
    }

    @RequestMapping(value = "/store/detail/{storeIdn}", method = {RequestMethod.GET, RequestMethod.POST})
    public String detail(@PathVariable("storeIdn") int storeIdn, Model model, HttpSession session) {
        if(SessionUtil.getLoginMemberNickname(session) == null) {
            return "user/login";
        }

        model.addAttribute("storeIdn", storeIdn);
        model.addAttribute("storeInfo", storeService.selectTargetStoreInfo(storeIdn));
        model.addAttribute("menuLists", storeService.selectStoreMenuList(storeIdn));

        List<HashMap> reviewLists = reviewService.selectStoreReviewList(storeIdn);

        int totalScore = 0;
        int oneScore = 0;
        int twoScore = 0;
        int threeScore = 0;
        int fourScore = 0;
        int fiveScore = 0;

        for(int i = 0; i < reviewLists.size(); i++) {
            int curScore = (Integer) reviewLists.get(i).get("reviewScore");
            totalScore += curScore;
            switch (curScore) {
                case 1:
                    oneScore++;
                    break;
                case 2:
                    twoScore++;
                    break;
                case 3:
                    threeScore++;
                    break;
                case 4:
                    fourScore++;
                    break;
                case 5:
                    fiveScore++;
                    break;
            }
        }

        HashMap<String, Integer> scoreMap = new HashMap<>();
        if(reviewLists.size() == 0) {
            scoreMap.put("averageScore", 0);
        } else {
            scoreMap.put("averageScore", totalScore / reviewLists.size());
        }
        scoreMap.put("oneScore", oneScore);
        scoreMap.put("twoScore", twoScore);
        scoreMap.put("threeScore", threeScore);
        scoreMap.put("fourScore", fourScore);
        scoreMap.put("fiveScore", fiveScore);

        model.addAttribute("scoreMap", scoreMap);
        model.addAttribute("reviewLists", reviewLists);
        return "store/detail";
    }

    @RequestMapping(value = "/store/categoryNum={categoryNum}&orderType={orderType}", method = {RequestMethod.GET, RequestMethod.POST})
    public String store(@PathVariable("categoryNum") int categoryNum, @PathVariable("orderType") int orderType, Model model) {
        model.addAttribute("storeList", storeService.selectStoreList(categoryNum, orderType));
        model.addAttribute("categoryNum", categoryNum);
        model.addAttribute("orderType", orderType);
        return "store/store";
    }

    @RequestMapping(value = "/store/insert", method = {RequestMethod.GET, RequestMethod.POST})
    public String insert() {
        return "store/insert";
    }

    @RequestMapping(value = "/createStore", method = RequestMethod.POST)
    @ResponseBody
    public String createStore(@RequestParam("storeName") String storeName, @RequestParam("storeAddress") String storeAddress,
                              @RequestParam("storePhonenum") String storePhonenum, @RequestParam("storeIntro") String storeIntro,
                              @RequestParam("minDelevery") String minDelevery, @RequestParam("categoryNum") String categoryNum,
                              @RequestParam("deleveryTip") String deleveryTip, @RequestParam("deleveryTime") String deleveryTime,
                              @RequestParam("imgFile") MultipartFile imgFile, @RequestParam("fileName") String fileName) {
        JSONObject resultObj = new JSONObject();
        resultObj.put("resultCode", 1);

        return resultObj.toString();
    }
}
