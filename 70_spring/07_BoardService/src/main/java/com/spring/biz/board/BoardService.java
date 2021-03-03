package com.spring.biz.board;

import java.util.List;

public interface BoardService {
	//CRUD 기능 구현 메소드 정의
	void insertBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
	BoardVO getboBoardVO(BoardVO vo);
	List<BoardVO> getboBoardList();
}
