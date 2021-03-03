package com.spring.biz.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.spring.biz.board.BoardVO;
import com.spring.biz.common.JDBCUtil;

public class BoardDAO {
	//JDBC 관련 변수(필드)
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
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
	
	public BoardDAO() {
		System.out.println(">> BoardDAO() 객체 생성");
	}
	
	//글 입력
	public void insertBoard(BoardVO vo) {
		System.out.println("===> JDBC insertBoard() 실행");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_INSERT);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getContent());
			
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt);
		}
	}
	
	//게시글 1개 조회
	public BoardVO getboBoardVO(BoardVO vo) {
		System.out.println("===> JDBC getboBoardVO() 실행");
		BoardVO board = null;
		
		conn = JDBCUtil.getConnection();
		if(conn == null) return null;
		
		try {
			stmt = conn.prepareStatement(BOARD_GET);
			stmt.setInt(1, vo.getSeq());
			rs = stmt.executeQuery();
			if(rs.next()) {
				board = new BoardVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegdate(rs.getDate("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, rs);
		}
		
		return board;
	}
	
}
