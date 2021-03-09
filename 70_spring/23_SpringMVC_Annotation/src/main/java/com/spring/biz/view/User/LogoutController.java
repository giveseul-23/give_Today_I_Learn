package com.spring.biz.view.User;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.user.UserVO;
import com.spring.biz.user.impl.UserDAO;

import org.springframework.stereotype.Controller;

@Controller
public class LogoutController{
   
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		System.out.println(">>> 로그인아웃 처리 - logout()");
		
		//1. 세션 초기화(세션 객체 종료)
        session.invalidate();

        //2. 화면 네비게이션(로그인페이지)
        return "login.jsp";
		
	}
	
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
        //1. 세션 초기화(세션 객체 종료)
        request.getSession().invalidate();

        //2. 화면 네비게이션(로그인페이지)
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:login.jsp"); //뷰리졸버 사용안하는 상태
        
        return mav;
    }
}
