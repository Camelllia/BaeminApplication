package com.clone.baemin.point;

import com.clone.baemin.util.SessionUtil;
import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/*
 *
 * ResultCode
 * 1 : 성공
 * -10 : 파라미터 공백 에러
 * */

@Controller
public class PointController {

    @Autowired
    PointService pointService;

    @RequestMapping("/point")
    public String point(Model model, HttpSession session) {
        model.addAttribute("userIdn", SessionUtil.getLoginMemberIdn(session));
        return "point/charge";
    }

    @RequestMapping("/point/charge/{userIdn}")
    public String charge(@PathVariable("userIdn") int userIdn, @RequestParam("amount") int chargePoint) {
        JSONObject resultObj = new JSONObject();
        resultObj.put("resultCode", 1);

        if(StringUtils.isBlank(String.valueOf(chargePoint))) {
            resultObj.put("resultCode", -10);
        }

        if(resultObj.get("resultCode").equals(1)) {
            pointService.chargeUserPoint(chargePoint, userIdn);
        }

        return resultObj.toString();
    }
}
