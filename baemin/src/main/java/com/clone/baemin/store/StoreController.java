package com.clone.baemin.store;

import com.clone.baemin.aop.UserLoginCheck;
import com.clone.baemin.review.ReviewService;
import com.clone.baemin.util.CommonUtil;
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
import java.util.UUID;

/*
 *
 * ResultCode
 * 1 : 성공
 * -10 : 리뷰 점수 유효성 에러
 * -20 : 파라미터 공백 에러
 * -30 : 파일 확장자 유효성 에러
 * */

@Controller
public class StoreController {

    @Autowired
    StoreService storeService;

    @Autowired
    ReviewService reviewService;

    @UserLoginCheck
    @RequestMapping(value = "/category", method = {RequestMethod.GET, RequestMethod.POST})
    public String category(Model model, HttpSession session) {
        model.addAttribute("userNickname", SessionUtil.getLoginMemberNickname(session));
        return "store/category";
    }

    @UserLoginCheck
    @RequestMapping(value = "/store/detail/{storeIdn}", method = {RequestMethod.GET, RequestMethod.POST})
    public String detail(@PathVariable("storeIdn") int storeIdn, Model model, HttpSession session) {

        model.addAttribute("storeIdn", storeIdn);
        model.addAttribute("storeInfo", storeService.selectTargetStoreInfo(storeIdn));
        model.addAttribute("menuLists", storeService.selectStoreMenuList(storeIdn));
        model.addAttribute("reviewScoreLists", reviewService.selectStoreReviewScoreList(storeIdn));
        model.addAttribute("reviewLists", reviewService.selectStoreReviewList(storeIdn));
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

    @RequestMapping(value = "/store/menu/{storeIdn}", method = {RequestMethod.GET, RequestMethod.POST})
    public String menu(@PathVariable("storeIdn") int storeIdn, Model model) {
        model.addAttribute("storeInfo", storeService.selectTargetStoreInfo(storeIdn));
        return "store/menu";
    }

    @RequestMapping(value = "/createMenu", method = RequestMethod.POST)
    @ResponseBody
    public String createMenu(@RequestParam("menuName") String menuName, @RequestParam("menuPrice") String menuPrice,
                              @RequestParam("imgFile") MultipartFile imgFile, @RequestParam("fileName") String fileName,
                              @RequestParam("storeIdn") String storeIdn, HttpServletRequest request) {
        JSONObject resultObj = new JSONObject();
        resultObj.put("resultCode", 1);

        if(!StringUtils.isNoneBlank(menuName, menuPrice, storeIdn, fileName)) {
            resultObj.put("resultCode", -20);
        }

        if(imgFile != null) {
            String extension = fileName.substring(fileName.lastIndexOf("."), fileName.length());
            if (!CommonUtil.isVaildExtension(extension)) {
                resultObj.put("resultCode", -30);
            }

            if(resultObj.get("resultCode").equals(1)) {
                UUID uuid = UUID.randomUUID();
                String newFileName = uuid.toString() + extension;
                ServletContext servletContext = request.getSession().getServletContext();
                String uploadPath = servletContext.getRealPath("/upload/") + newFileName;

                try {
                    imgFile.transferTo(new File(uploadPath));
                } catch (Exception e) {
                    e.printStackTrace();
                }

                storeService.insertMenu(menuName, Integer.valueOf(menuPrice), Integer.valueOf(storeIdn), newFileName);
            }
        }

        return resultObj.toString();
    }

    @RequestMapping(value = "/createStore", method = RequestMethod.POST)
    @ResponseBody
    public String createStore(@RequestParam("storeName") String storeName, @RequestParam("storeAddress") String storeAddress,
                              @RequestParam("storePhonenum") String storePhonenum, @RequestParam("storeIntro") String storeIntro,
                              @RequestParam("minDelevery") String minDelevery, @RequestParam("categoryNum") String categoryNum,
                              @RequestParam("deleveryTip") String deleveryTip, @RequestParam("deleveryTime") String deleveryTime,
                              @RequestParam("imgFile") MultipartFile imgFile, @RequestParam("fileName") String fileName,
                              HttpServletRequest request) {
        JSONObject resultObj = new JSONObject();
        resultObj.put("resultCode", 1);

        if(!StringUtils.isNoneBlank(storeName, storeAddress, storePhonenum, storeIntro, minDelevery, categoryNum, deleveryTip, deleveryTime, fileName)) {
            resultObj.put("resultCode", -20);
        }

        if(imgFile != null) {
            String extension = fileName.substring(fileName.lastIndexOf("."), fileName.length());
            if (!CommonUtil.isVaildExtension(extension)) {
                resultObj.put("resultCode", -30);
            }

            if(resultObj.get("resultCode").equals(1)) {
                UUID uuid = UUID.randomUUID();
                String newFileName = uuid.toString() + extension;
                ServletContext servletContext = request.getSession().getServletContext();
                String uploadPath = servletContext.getRealPath("/upload/") + newFileName;

                try {
                    imgFile.transferTo(new File(uploadPath));
                } catch (Exception e) {
                    e.printStackTrace();
                }

                storeService.insertStore(storeName, storeAddress, storeIntro, storePhonenum, Integer.valueOf(minDelevery), Integer.valueOf(deleveryTip), Integer.valueOf(deleveryTime), Integer.valueOf(categoryNum), newFileName);
            }
        }

        return resultObj.toString();
    }
}
