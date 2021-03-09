package com.spring.biz.view.User;

import com.spring.biz.user.UserVO;
import com.spring.biz.user.impl.UserDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
//spring에서 제공하는 컨트롤러
import org.springframework.stereotype.Controller;

//@Controller : DispatcherServlet 에서 인식할 수 있는 컨트롤러 객체 생성
@Controller
public class LoginController{
	
	/*
	  	@RequestMapping : 요청과 처리(Controller) 연결(HandlerMapping 역할 대체)
	  	command 객체 사용 : 파라미터로 전달되는 값을 Command 객체에 설정
	  	스프링프레임워크에서 객체에 생성하고 파라미터 값을 설정해서 전달해줌
	  	1. UserVO 타입의 객체 생성
	  	2. UserVO 타입의 객체에 전달받은 파라미터 값을 설정(이름 일치하는 경우)
	  	3. UserVO 타입의 객체를 메소드의 파라미터(인수) 값으로 전달
	*/
	@RequestMapping("/login.do")
	public String login(UserVO vo, UserDAO userDAO) {
		System.out.println(">>> 로그인 처리 - login()");
		System.out.println("> 전달받은 vo : " + vo);
		
		UserVO user = userDAO.getUser(vo);
		if(user != null) {
			return "getBoardList.do";
		}else {
			return "login.jsp";
		}
		
	}
	
	//이제 사용되지 않는 코드임(참고용)
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
        System.out.println(">> 로그인 처리");

        //1. 사용자 입력 데이터 확인(추출)
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        //2. DB연동작업(id, password 유무 확인)
        UserVO vo = new UserVO();
        vo.setId(id);
        vo.setPassword(password);

        UserDAO userDAO = new UserDAO();
        UserVO user = userDAO.getUser(vo);

        //3. 화면 네비게이션(화면이동)
        //로그인 성공 : 게시글 보여주기 - getBoardList.jsp
        //로그인 실패 : 로그인화면으로 이동 - login.jsp
        ModelAndView mav = new ModelAndView();
        if (user != null) { //사용자 정보가 있는 경우
            System.out.println("> 로그인 성공!!!");
            //returnStr = "getBoardList.do";
            mav.setViewName("redirect:getBoardList.do");
        } else {
            System.out.println("> 로그인 실패!!!");
            //returnStr = "login";
            mav.setViewName("redirect:login.jsp"); //뷰리졸버 사용하지 않는 경우
        }
        
        
        return mav;
    }

}
