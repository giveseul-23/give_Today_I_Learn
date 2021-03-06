package com.spring.biz.common;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect//해당 부분 안 적으면 연결안됨
public class AfterAdvice {

    @After("PointcutCommon.allPointCut()")
    public void afterLog(){
        System.out.println("[후처리 - AfterAdvice.afterLog]"
        + " 비즈니스 로직 수행후 로그(언제나, 무조건)");
    }
}
