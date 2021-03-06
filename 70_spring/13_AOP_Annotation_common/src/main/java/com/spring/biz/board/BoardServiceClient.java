package com.spring.biz.board;

import java.util.List;

import org.springframework.context.support.GenericXmlApplicationContext;

import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;

public class BoardServiceClient {
	public static void main(String[] args) {
		//1. 스프링 컨테이너 구동
		GenericXmlApplicationContext container = 
				new GenericXmlApplicationContext("applicationContext.xml");
		
		System.out.println("---- 컨테이너 구동 후 ----");
		//2. 스프링 컨테이너 사용
		BoardService boardService = (BoardService) container.getBean("boardService");
		
		//데이터 입력 
		BoardVO vo = new BoardVO();
		vo.setTitle("테스트");
		vo.setWriter("테스터");
		vo.setContent("테스트중");
		try {
			boardService.insertBoard(vo);
			/* 이쪽에서 예외발생 throw했기때문에 이 구문에서 try catch 해줘야 함 */
		}catch (Exception e){ }

		//전체 데이터 조회
		List<BoardVO> list = boardService.getboBoardList();
		for(BoardVO vo2 : list) {
			System.out.println(vo2.toString());
		}
		
		//3, 스프링 컨테이너 종료
		container.close();
	}
}
