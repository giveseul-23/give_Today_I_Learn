package com.spring.biz.board.impl;

import com.spring.biz.board.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

//스프링 JDBC jdbcTemplate 주입받아서(DI) 처리
@Repository
public class BoardDAOSpring {
    @Autowired
    private JdbcTemplate jdbcTemplate; //BoardDAOSpring 이 jdbcTemplate 를 의존하고 있음

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
    
    private final String BOARD_LIST_T
    	= "SELECT * FROM BOARD WHERE TITLE LIKE '%'|| ? ||'%' ORDER BY SEQ DESC";
    
    private final String BOARD_LIST_C
    	= "SELECT * FROM BOARD WHERE CONTENT LIKE '%'|| ? ||'%' ORDER BY SEQ DESC";
    
    public BoardDAOSpring() {
        System.out.println(">> BoardDAOSpring() 객체 생성");
    }

    ///글 입력
    public void insertBoard(BoardVO vo) {
        System.out.println("===> Spring JDBC insertBoard() 실행");

        Object[] args = {vo.getTitle(), vo.getWriter(), vo.getContent()};

        jdbcTemplate.update(BOARD_INSERT, args);
    }

    //게시글 1개 조회
    public BoardVO getBoard(BoardVO vo) {
        System.out.println("===> JDBC getboBoardVO() 실행");
        BoardVO board = null;

        return board;
    }

    //글수정
    public void updateBoard(BoardVO vo) {
        System.out.println("===> JDBC updateBoard() 실행");
    }

    //글삭제
    public void deleteBoard(BoardVO vo) {
        System.out.println("===> JDBC deleteBoard() 실행");
    }

    //게시글 전체 조회
    public List<BoardVO> getBoardList(){
        System.out.println("===> JDBC getBoardList() 실행");

        return jdbcTemplate.query(BOARD_LIST, new BoardRowMapper());
    }

	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> JDBC(jdbcTemplate)로 getBoardList() 실행");
		
		//TODO
		//검색조건 값이 없을 때 기본값 설정
		if(vo.getSearchCondition() == null){
			vo.setSearchCondition("TITLE");
		}
		
		if(vo.getSearchKeyword() == null){
			vo.setSearchKeyword("");
		}
		
		String sql ="";
		if(vo.getSearchCondition().equals("TITLE")) {
			sql = BOARD_LIST_T;
		}else if(vo.getSearchKeyword().equals("CONTENT")) {
			sql = BOARD_LIST_C;
		}
		
		Object[] args = {vo.getSearchKeyword()};
 		
		return jdbcTemplate.query(sql, args, new BoardRowMapper());
	}

}
