package com.clone.baemin.user;

import com.clone.baemin.util.AES256;
import com.clone.baemin.util.CommonUtil;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

// ResultCode
// 1 : 성공
// -10 : 이메일 유효성 에러
// -20 : 회원가입 비밀번호 비교 에러
// -30 : 이메일 중복 에러
// -40 : 전화번호 유효성 에러

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    AES256 aes256;

    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
    public String main() {
        return "user/login";
    }

    @RequestMapping(value = "/myPage", method = {RequestMethod.GET, RequestMethod.POST})
    public String myPage() {
        return "user/myPage";
    }

    @RequestMapping(value = "/join", method = {RequestMethod.GET, RequestMethod.POST})
    public String join() {
        return "user/join";
    }

    @RequestMapping(value = "/inserUserAccount", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject inserUserAccount(@RequestParam("userEmail") String userEmail, @RequestParam("userPw") String userPw,
                                       @RequestParam("userNickname") String userNickname, @RequestParam("userPwCheck") String userPwCheck,
                                       @RequestParam("userPhonenum") String userPhonenum) {

        JSONObject resultObj = new JSONObject();
        resultObj.put("resultCode", 1);

        if(!CommonUtil.isValidEmailAddress(userEmail)) {
            resultObj.put("resultCode", -10);
            return resultObj;
        }

        if(!CommonUtil.isValidPhoneNumber(userPhonenum)) {
            resultObj.put("resultCode", -40);
            return resultObj;
        }

        if(StringUtils.equals(userPw, userPwCheck)) {
            resultObj.put("resultCode", -20);
            return resultObj;
        }

        if(userService.selectEmailCount(userEmail) > 0) {
            resultObj.put("resultCode", -30);
            return resultObj;
        }

        try {
            userService.insertUserAccount(userEmail, aes256.encrypt(userPw), userNickname, userPhonenum);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultObj;
    }
}
