package com.mystudy.jdbc_statement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class StudentManage_Select {

	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			//1. JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.OracleDriver");
			
			//2. DB 연결하고 Connection 객체 생성
			conn =  DriverManager.getConnection(
					//사용할 드라이브 		현재pc를의미 -- 연결된 url? 같은거라 생각하자
					"jdbc:oracle:thin:@localhost:1521:xe", 
					"mystudy", "mystudypw");
			//3. Statement 문 생성 및 실행(SQL문 - 쿼리문 실행)
			stmt = conn.createStatement();//SQL 실행을 위한 객체 생성
			
			String sql = "SELECT ID, NAME, KOR, ENG, MATH "
					+ "FROM STUDENT " 
					+ "ORDER BY ID";				//이런식으로 잘라서 사용할 때는 띄어쓰기를 잘 봐둬야 함
			//SQL문 전달하고 실행요청
			rs = stmt.executeQuery(sql); //SELECT에서는 executeQuery() 메서드를 사용함
			
			//4. 결과에 대한 처리
			while(rs.next()) {
				String str = "";
				str += rs.getString("ID") + "\t";
				str += rs.getString("NAME") + "\t";
				str += rs.getInt("KOR") + "\t";
				str += rs.getInt("ENG") + "\t";
				str += rs.getInt("MATH") + "\t";
				System.out.println(str);
			}
			
			
		} catch (ClassNotFoundException e) {
			System.out.println("[예외] 드라이버 로딩 실패!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("[예외] DB연결 실패(connection fail)");
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
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
