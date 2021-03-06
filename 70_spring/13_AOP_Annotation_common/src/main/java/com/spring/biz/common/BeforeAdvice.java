package com.spring.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

import java.util.Arrays;

@Service //객체(인스턴스) 생성
@Aspect //포인트컷 + 어드바이스
public class BeforeAdvice {
    
    @Before("PointcutCommon.allPointCut()")
    void beforeLog(JoinPoint jp){
        String methodName = jp.getSignature().getName(); //실행된 메소드명
        Object[] args = jp.getArgs();
        System.out.println("args : " + Arrays.toString(args));
        if(args == null || args.length < 1){
            System.out.println("[사전처리] " + methodName + "() 메소드"
                    + ", args정보 없음 - 비즈니스 로직 수행전 로그");

        }else{
            System.out.println("[사전처리] " + methodName + "() 메소드"
                + ", args정보 : " + args[0] + " - 비즈니스 로직 수행전 로그");
        }
    }
}
