package com.spring.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.board.BoardVO;

@Repository("boardDAOMybatis")
public class BoardDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public BoardDAOMybatis() {
		System.out.println(">> BoardDAOMybatis() 객체생성");
	}
	
	//SQL문
    private final String BOARD_INSERT
            = "INSERT INTO BOARD (SEQ, TITLE, WRITER, CONTENT)  " +
            "  VALUES((SELECT NVL(MAX(SEQ), 0) + 1 FROM BOARD), ?, ?, ?)";

    private final String BOARD_UPDATE
            = "UPDATE BOARD SET TITLE = ?, CONTENT = ? WHERE SEQ = ?";

    private final String BOARD_DELETE
            = "DELETE FROM BOARD WHERE SEQ = ?";

    private final String BOARD_GET
            = "SELECT * FROM BOARD WHERE SEQ = ?";

    private final String BOARD_LIST
            = "SELECT * FROM BOARD ORDER BY SEQ DESC";


    ///글 입력
    public void insertBoard(BoardVO vo) {
        System.out.println("===> Mybatis로 insertBoard() 실행");
        
        mybatis.insert("BoardDAO.insertBoard", vo);
    }


    //글수정
    public void updateBoard(BoardVO vo) {
        System.out.println("===> Mybatis로 updateBoard() 실행");
        mybatis.update("BoardDAO.updateBoard", vo);
    }

    //글삭제
    public void deleteBoard(BoardVO vo) {
        System.out.println("===> Mybatis로 deleteBoard() 실행");
        mybatis.delete("BoardDAO.deleteBoard", vo);
    }
    
    //게시글 1개 조회
    public BoardVO getBoard(BoardVO vo) {
    	System.out.println("===> Mybatis로 getboBoardVO() 실행");

        return mybatis.selectOne("BoardDAO.getBoard", vo);
	}
    
    //게시글 전체 조회
    public List<BoardVO> getBoardList(BoardVO vo){
        System.out.println("===> Mybatis로 getBoardList() 실행");
        
      //검색조건 값이 없을 때 기본값 설정
		if(vo.getSearchCondition() == null){
			vo.setSearchCondition("TITLE");
		}
		
		if(vo.getSearchKeyword() == null){
			vo.setSearchKeyword("");
		}
        
        return mybatis.selectList("BoardDAO.getBoardList", vo);
    }


	public List<BoardVO> getBoardList() {
		// TODO Auto-generated method stub
		return null;
	}


	
}
