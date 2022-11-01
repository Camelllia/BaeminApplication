package com.clone.baemin.util;

import java.util.HashMap;

public class PageNationUtil {

    public HashMap setPageNation(int totalCount, int pageNum) {

        HashMap<String, Integer> pageNationParam = new HashMap<>();
        final int displayCount = 15;

        int totalPageNum = totalCount % displayCount != 0 ? (totalCount / displayCount) + 1 : (totalCount / displayCount);
        int limit = pageNum * displayCount;
        int offset = pageNum != 0 ? limit - displayCount : 0;

        return pageNationParam;
    }
}
