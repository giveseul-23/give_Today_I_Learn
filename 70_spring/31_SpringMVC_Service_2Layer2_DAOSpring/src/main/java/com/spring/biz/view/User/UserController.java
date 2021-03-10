package com.spring.biz.view.User;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;
import com.spring.biz.user.impl.UserDAO;

@Controller
//@Enable //4.3버전에서는 추가해야 @PostMapping, @GetMapping 이 정상작동 함
public class UserController {
	
	//UserService 타입 주입받아서 사용 형태로 변경
	@Autowired
	private UserService userService; // 이렇게 하면서 결합도를 낮춤
	//userDAO 를 상속한 UserService 인터페이스를 주입하면 userDao가 어떻게 바뀌든 여기서 오류가 발생하거나 코드를 수정하지 않아도 됨
	//현재는 JDBCUserDAO 를 사용하지만 만약 MybatisUserDAO 를 사용한 경우 applicationContext에 이름(id)은 동일하게 하여 
	//@Autowired 하고 applicationContext에서 클래스만 변경해서 주입하면 문제 없이 잘 바뀌게 된다.
	
	public UserController() {
		System.out.println(">> UserController() 생성");
	}
	
	//요청방식이 GET인지 POST인지 그 방식에 따라 다르게 처리해 줄 수 있음
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	//@PostMapping("/login.do")
	public String login(UserVO vo) {
		System.out.println(">>> 로그인 처리 - login()");
		System.out.println("> 전달받은 vo : " + vo);
		
		UserVO user = userService.getUser(vo);
		if(user != null) {
			return "getBoardList.do";
		}else {
			return "login.jsp";
		}
	
	}
	
	/*
	  	@ModelAttribute : 모델(Model) 속성값으로 저장(속성명 별도 지정)
	  	별도 지정 명칭 부여 안하면 <데이터타입>의 첫글자 소문자로 작성된 명칭 사용
	  	Command 객체가 기본 request 스코프에 저장 사용됨
	*/
	
	//단순 login.do 요청을 처리할 메소드
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	//public String loginView(UserVO vo) { //뷰에서 사용할 userVO 명칭으로 데이터 저장
	//@GetMapping("/login.do")
	public String loginView(@ModelAttribute("user") UserVO vo) { //뷰에서 사용할 user 명칭으로 데이터 저장
		System.out.println(">>> 로그인페이지 이동 - loginView()");
		vo.setId("USER1");
		vo.setPassword("USER1");
		return "login.jsp";
	
	}
	
	
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		System.out.println(">>> 로그인아웃 처리 - logout()");
		
		//1. 세션 초기화(세션 객체 종료)
        session.invalidate();

        //2. 화면 네비게이션(로그인페이지)
        return "login.jsp";
		
	}
}
