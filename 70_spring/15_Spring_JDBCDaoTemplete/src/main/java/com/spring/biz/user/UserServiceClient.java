package com.spring.biz.user;

import java.util.List;

import org.springframework.context.support.GenericXmlApplicationContext;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;

public class UserServiceClient {

	public static void main(String[] args) {
		//1. 스프링 컨테이너 구동
		GenericXmlApplicationContext container = 
				new GenericXmlApplicationContext("applicationContext.xml");
		
		System.out.println("---- 컨테이너 구동 후 ----");
		//2. 스프링 컨테이너 사용
//		UserService userService = (UserService) container.getBean("userService");
		/*어노테이션 서비스 이름 설정 없이 아래처럼도 가능*/
		UserService userService = container.getBean(UserService.class);

		//데이터 조회
		UserVO vo = new UserVO();
		vo.setId("TEST");
		vo.setPassword("TEST");
		UserVO user = userService.getUser(vo);
		if(user != null) {
			System.out.println("user : " + user);
		}else {
			System.out.println("사용자가 존재하지 않습니다.");
		}
		
		//3, 스프링 컨테이너 종료
		container.close();
		
	}

}
