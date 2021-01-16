package com.mystudy.jdbc2_prepared;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentManager_Update {

	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			//드라이브 로딩
			Class.forName("oracle.jdbc.OracleDriver");
			
			//DB 연결하고 커넥션 객체 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"mystudy", "mystudypw");
			
			//프리페어드스테이트먼트문 생성
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE STUDENT ");
			sql.append("SET NAME = ?, KOR = ?, ENG = ?, MATH = ? ");
			sql.append("WHERE ID = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, "홍길동999");
			pstmt.setInt(2, 100);
			pstmt.setInt(3, 100);
			pstmt.setInt(4, 100);
			pstmt.setString(5, "2020114");
			
			int cnt = pstmt.executeUpdate();
			
			System.out.println(">>처리건수 : "+cnt);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			try {
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		System.out.println(">>> main() 끝");
		
	}

}
