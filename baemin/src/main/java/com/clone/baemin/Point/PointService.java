package com.clone.baemin.point;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointService {

    @Autowired
    PointDAO pointDAO;

    public int chargeUserPoint(int chargePoint, int userIdn) {
        return pointDAO.chargeUserPoint(chargePoint, userIdn);
    }
}
