package com.spring.biz.common;

import org.aspectj.lang.JoinPoint;

import java.util.Arrays;

public class BeforeAdvice {
/*    public void beforeLog(){
        System.out.println("[사전처리-BeforeAdvice.beforeLog]"
            + " 비즈니스 로직 수행전 로그"
        );
    }*/

    void beforeLog(JoinPoint jp){
        String methodName = jp.getSignature().getName(); //실행된 메소드명
        Object[] args = jp.getArgs();
        System.out.println("args : " + Arrays.toString(args));

        System.out.println("[사전처리] " + methodName + "() 메소드"
        + ", args정보 : " + args[0] + " - 비즈니스 로직 수행전 로그");
    }
}