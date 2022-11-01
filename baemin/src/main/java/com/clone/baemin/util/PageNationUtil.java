package com.clone.baemin.util;

import org.springframework.stereotype.Component;

import java.util.HashMap;

@Component
public class PageNationUtil {

    public HashMap setPageNation(int totalCount, int pageNum) {

        HashMap<String, Integer> pageNationParam = new HashMap<>();
        final int displayCount = 15;

        pageNationParam.put("displayCount", displayCount);
        pageNationParam.put("totalPageNum", totalCount % displayCount != 0 ? (totalCount / displayCount) + 1 : (totalCount / displayCount));
        pageNationParam.put("limit", pageNum * displayCount);
        pageNationParam.put("offset", pageNum != 0 ? (pageNum * displayCount) - displayCount : 0);

        return pageNationParam;
    }
}
