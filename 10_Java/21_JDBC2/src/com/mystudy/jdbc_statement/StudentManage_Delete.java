package com.mystudy.jdbc_statement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class StudentManage_Delete {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		
		try {
			//1. JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.OracleDriver");
			
			//2. DB 연결하고 Connection 객체 생성
			conn =  DriverManager.getConnection(
					//사용할 드라이브 		현재pc를의미 -- 연결된 url? 같은거라 생각하자
					"jdbc:oracle:thin:@localhost:1521:xe", 
					"mystudy", "mystudypw");
			//3. Statement 문 생성 및 실행(SQL문 - 쿼리문 실행)
			stmt = conn.createStatement();
			
			String id = "2020111";
			StringBuilder sql = new StringBuilder();
			sql.append("DELETE FROM STUDENT WHERE ID = '" + id + "' ");
			
			int cnt = stmt.executeUpdate(sql.toString());
			
			System.out.println("처리건수 : "+cnt);
			
			
		} catch (ClassNotFoundException e) {
			System.out.println("[예외] 드라이버 로딩 실패!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("[예외] DB연결 실패(connection fail)");
			e.printStackTrace();
		} finally {
			
			try {
				//null이 아닐때 닫아주는게 더 좋은 방법 (조건문 달아서..)
				if(stmt != null) stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			try {
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
