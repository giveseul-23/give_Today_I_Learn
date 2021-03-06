package com.spring.biz.common;

public class AfterReturningAdvice {
    public void afterReturnLog(){
        System.out.println("[후처리-AfterReturningAdvice.afterReturnLog()]"
        + " 비즈니스 로직 실행후 실시(정상수행후)");
    }
}
