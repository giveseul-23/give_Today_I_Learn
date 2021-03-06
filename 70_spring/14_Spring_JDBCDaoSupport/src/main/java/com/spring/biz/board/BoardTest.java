package com.spring.biz.board;

import java.util.List;

import com.spring.biz.board.impl.BoardDAO;

public class BoardTest {

	public static void main(String[] args) {
		BoardVO vo = new BoardVO();
		//vo.setTitle("테스트");
		//vo.setWriter("테스터");
		//vo.setContent("테스트중");
		
		BoardDAO dao = new BoardDAO();
		/*insert*/
		//dao.insertBoard(vo);
		
		/*one select*/
		//vo.setSeq(2);
		//BoardVO board =  dao.getboBoardVO(vo);
		//System.out.println("board : " + board.toString());
		
		/*update*/
		//vo.setTitle("업데이트중");
		//vo.setContent("업데이트중");
		//vo.setSeq(2);
		//dao.updateBoard(vo);
		
		/*delete*/
		vo.setSeq(2);
		dao.deleteBoard(vo);
	
		
		/*all select*/
		List<BoardVO> list = dao.getBoardList();
		for(BoardVO vo2 : list) {
			System.out.println(vo2.toString());
		}
	}

}
