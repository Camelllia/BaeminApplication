package com.clone.baemin.user;

import com.clone.baemin.coupon.CouponService;
import com.clone.baemin.util.AES256;
import com.clone.baemin.util.CommonUtil;
import com.clone.baemin.util.PageNationUtil;
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
    PageNationUtil pageNationUtil;

    @Autowired
    AES256 aes256;

    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
    public String main(HttpSession session) {
        if(SessionUtil.getLoginMemberEmail(session) != null) {
            return "redirect:/category";
        }
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

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        SessionUtil.logout(session);
        return "redirect:/";
    }

    @RequestMapping(value = "/memberList/orderType={orderType}&pageNum={pageNum}", method = {RequestMethod.GET, RequestMethod.POST})
    public String list(@PathVariable("orderType") int orderType, @PathVariable("pageNum") int pageNum, Model model) {

        HashMap<String,Integer> pageNationParam = pageNationUtil.setPageNation(userService.selectMemberListTotalCount(), pageNum);

        model.addAttribute("curPageNum", pageNum);
        model.addAttribute("totalPageNum", pageNationParam.get("totalPageNum"));
        model.addAttribute("memberLists", userService.selectMemberList(orderType, pageNationParam.get("limit"), pageNationParam.get("offset")));
        return "/user/list";
    }

    @RequestMapping(value = "/createAccount", method = RequestMethod.POST)
    @ResponseBody
    public String createAccount(@RequestParam("userEmail") String userEmail, @RequestParam("userPw") String userPw,
                                       @RequestParam("userNickname") String userNickname, @RequestParam("userPwCheck") String userPwCheck,
                                       @RequestParam("userPhonenum") String userPhonenum) {
        JSONObject resultObj = new JSONObject();
        resultObj.put("resultCode", 1);

        if(!CommonUtil.isValidEmailAddress(userEmail)) {
            resultObj.put("resultCode", -10);
        }

        if(!CommonUtil.isValidPhoneNumber(userPhonenum)) {
            resultObj.put("resultCode", -40);
        }

        if(!StringUtils.equals(userPw, userPwCheck)) {
            resultObj.put("resultCode", -20);
        }

        if(userService.selectEmailCount(userEmail) > 0) {
            resultObj.put("resultCode", -30);
        }

        try {
            if(resultObj.get("resultCode").equals(1)) {
                userService.insertUserAccount(userEmail, aes256.encrypt(userPw), userNickname, userPhonenum);
            }
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
                SessionUtil.setLoginInfo(session, (String) userInfoMap.get("userNickname"), (int) userInfoMap.get("userIdn"), userEmail);
                userService.insertLoginLog(userEmail, SessionUtil.getIp());
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return resultObj.toString();
        }
    }
}
