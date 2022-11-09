package com.clone.baemin.aop;

import com.clone.baemin.util.SessionUtil;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;

@Aspect
@Component
@SuppressWarnings("unchecked")
public class AuthCheckAspect {

    @Before("@annotation(com.clone.baemin.aop.UserLoginCheck)")
    public void userLoginCheck(JoinPoint joinPoint) throws Throwable {
        HttpSession session = ((ServletRequestAttributes) (RequestContextHolder.currentRequestAttributes()))
                .getRequest().getSession();

        String userEmail = SessionUtil.getLoginMemberEmail(session);
        if(userEmail == null) {
            throw new HttpStatusCodeException(HttpStatus.UNAUTHORIZED) {};
        }
    }
}
