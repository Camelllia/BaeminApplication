package com.clone.baemin.store;

import com.clone.baemin.review.ReviewService;
import com.clone.baemin.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

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
        model.addAttribute("storeInfo", storeService.selectTargetStoreInfo(storeIdn));

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
        scoreMap.put("averageScore", totalScore / reviewLists.size());
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
}
