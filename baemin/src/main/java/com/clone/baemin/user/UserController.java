package com.clone.baemin.user;

import com.clone.baemin.coupon.CouponService;
import com.clone.baemin.util.AES256;
import com.clone.baemin.util.CommonUtil;
import com.clone.baemin.util.SessionUtil;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

// ResultCode
// 1 : 성공
// -10 : 이메일 유효성 에러
// -20 : 회원가입 비밀번호 비교 에러
// -30 : 이메일 중복 에러
// -40 : 전화번호 유효성 에러
// -50 : 계정 미확인 에러

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    CouponService couponService;

    @Autowired
    AES256 aes256;

    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
    public String main() {
        return "user/login";
    }

    @RequestMapping(value = "/myPage", method = {RequestMethod.GET, RequestMethod.POST})
    public String myPage(Model model, HttpSession session) {
        model.addAttribute("userNickname", SessionUtil.getLoginMemberNickname(session));
        return "user/myPage";
    }

    @RequestMapping(value = "/join", method = {RequestMethod.GET, RequestMethod.POST})
    public String join() {
        return "user/join";
    }

    @RequestMapping(value = "/orderList", method = {RequestMethod.GET, RequestMethod.POST})
    public String orderList() {
        return "user/orderList";
    }

    @RequestMapping(value = "/likeList", method = {RequestMethod.GET, RequestMethod.POST})
    public String likeList() {
        return "user/likeList";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        SessionUtil.logout(session);
        return "redirect:/";
    }

    @RequestMapping(value = "/insertUserAccount", method = RequestMethod.POST)
    @ResponseBody
    public String insertUserAccount(@RequestParam("userEmail") String userEmail, @RequestParam("userPw") String userPw,
                                       @RequestParam("userNickname") String userNickname, @RequestParam("userPwCheck") String userPwCheck,
                                       @RequestParam("userPhonenum") String userPhonenum) {
        JSONObject resultObj = new JSONObject();
        resultObj.put("resultCode", 1);

        if(!CommonUtil.isValidEmailAddress(userEmail)) {
            resultObj.put("resultCode", -10);
            return resultObj.toString();
        }

        if(!CommonUtil.isValidPhoneNumber(userPhonenum)) {
            resultObj.put("resultCode", -40);
            return resultObj.toString();
        }

        if(!StringUtils.equals(userPw, userPwCheck)) {
            resultObj.put("resultCode", -20);
            return resultObj.toString();
        }

        if(userService.selectEmailCount(userEmail) > 0) {
            resultObj.put("resultCode", -30);
            return resultObj.toString();
        }

        try {
            userService.insertUserAccount(userEmail, aes256.encrypt(userPw), userNickname, userPhonenum);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultObj.toString();
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public String login(@RequestParam("userEmail") String userEmail, @RequestParam("userPw") String userPw, HttpSession session) {
        JSONObject resultObj = new JSONObject();
        resultObj.put("resultCode", 1);

        try {
            if(userService.selectUserInfoCount(userEmail, aes256.encrypt(userPw)) == 0) {
                resultObj.put("resultCode", -50);
            } else {
                HashMap userInfoMap = userService.selectUserInfo(userEmail, aes256.encrypt(userPw));
                SessionUtil.setLoginInfo(session, (String) userInfoMap.get("userNickname"), (int) userInfoMap.get("userIdn"));
                userService.insertLoginLog(userEmail, SessionUtil.getIp());
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return resultObj.toString();
        }
    }
}
