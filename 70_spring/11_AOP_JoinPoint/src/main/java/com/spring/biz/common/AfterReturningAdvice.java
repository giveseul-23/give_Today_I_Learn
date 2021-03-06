package com.spring.biz.common;

import com.spring.biz.user.UserVO;
import org.aspectj.lang.JoinPoint;

public class AfterReturningAdvice {
    /*public void afterReturnLog(){
        System.out.println("[후처리-AfterReturningAdvice.afterReturnLog()]"
        + " 비즈니스 로직 실행후 실시(정상수행후)");
    }*/

    //returnObj : 추가 바인드 변수를 사용시에는 스프링 설정파일에 작성 추가
    //명시적으로 스프링 프레임워크에 매개변수 값을 받을 변수명 알림
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
