package com.spring.biz.board.impl;

import com.spring.biz.board.BoardVO;
import com.spring.biz.common.JDBCUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// spring-jdbc의 JdbcDaoSupport 상속확장 방식으로 구현
@Repository("boardDAOSpring")
public class BoardDAOSpring extends JdbcDaoSupport {

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

	public BoardDAOSpring() {
		System.out.println(">> BoardDAOSpring() 객체 생성");
	}

	//JdbcDaoSupport에 DataSource 객체(인스턴스) 전달
	@Autowired//파라미터 타입과 동일한 객체 주입하면서 메소드 실행
	public void setSuperDataSource(DataSource dataSource){
		System.out.println(">>>> BoardDAOSpring.setSuperDataSource() 실행");
		System.out.println(">>> DataSource : " + dataSource);
		super.setDataSource(dataSource);
	}

	//글 입력
	public void insertBoard(BoardVO vo) {
		System.out.println("===> Spring JDBC insertBoard() 실행");

		Object[] args = {vo.getTitle(), vo.getWriter(), vo.getContent()};

		super.getJdbcTemplate().update(BOARD_INSERT, args);
	}
	
	//게시글 1개 조회
	public BoardVO getboBoardVO(BoardVO vo) {
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

		return super.getJdbcTemplate().query(BOARD_LIST, new BoardRowMapper());
	}
}
