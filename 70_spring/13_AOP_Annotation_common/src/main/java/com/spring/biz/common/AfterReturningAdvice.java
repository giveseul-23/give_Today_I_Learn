package com.spring.biz.common;

import com.spring.biz.user.UserVO;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterReturningAdvice {

    @AfterReturning(pointcut = "PointcutCommon.getPointCut()", returning = "returnObj")
    public void afterReturnLog(JoinPoint jp, Object returnObj){
        String methodName = jp.getSignature().getName();
        //리턴받은 객체를 확인하고 필요한 작업처리
        if(returnObj instanceof UserVO){
            UserVO vo = (UserVO) returnObj;
            if("admin".equalsIgnoreCase(vo.getRole())){
                System.out.println(vo.getName() + " 로그인(Admin)");
            }else{
                System.out.println(vo.getName() + " 로그인");
            }
        }
        System.out.println("[사후처리]" + methodName +"() 메소드"
        + "리턴값 : " + returnObj);
    }

}
