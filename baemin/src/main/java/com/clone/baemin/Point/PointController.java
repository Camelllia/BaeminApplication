package com.clone.baemin.Point;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PointController {

    @RequestMapping("/point")
    public String point() {
        return "point/charge";
    }

    @RequestMapping("/point/charge")
    public String charge(@RequestParam("amount") int point) {
        JSONObject resultObj = new JSONObject();
        resultObj.put("resultCode", 1);

        if(StringUtils.isBlank(String.valueOf(point))) {
            resultObj.put("resultCode", -10);
            return resultObj.toString();
        }

        System.out.println(point);

        return resultObj.toString();
    }
}
