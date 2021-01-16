package com.mystudy.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class StudentManager_Select {

	public static void main(String[] args) {
		/*
		  JDBC 이용한 DB 프로그래밍 방법
			0. JDBC 라이브러리 사용 개발환경 설정(jdbc.jar 빌드패스 등록)
			1. JDBC 드라이버 로딩
			2. DB 연결하고 Connection 객체 생성
			3. Statement 문 생성 및 실행(SQL문 - 쿼리문 실행)
			4. 결과물에 대한 처리
				- SELECT : 조회 데이터 결과값 처리 -- DB에서 가져오는 것
				- INSERT, UPDATE, DELETE : int 값(처리건수) 처리 -- DB에 반영되는 부분
			5. 클로징 처리에 의한 자원 반납
		*/
		
		//1. JDBC 드라이버 로딩
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("[예외] 드라이버 로딩 실패!");
			e.printStackTrace();
		}
		
		//2. DB 연결하고 Connection 객체 생성
		Connection conn = null; //연결된 객체가 담겨있음
		
		try {
			//연결된 객체를 넘겨준다고 생각하면 됨, 담아줄 객체가 필요하다.
			conn =  DriverManager.getConnection(
					//사용할 드라이브 		현재pc를의미 -- 연결된 url? 같은거라 생각하자
					"jdbc:oracle:thin:@localhost:1521:xe", 
					"mystudy", "mystudypw");
		} catch (SQLException e) {
			System.out.println("[예외] DB연결 실패(connection fail)");
			e.printStackTrace();
		}
		
		//3. Statement 문 생성 및 실행
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			String sql = "SELECT ID, NAME, KOR, ENG, MATH "
							+ "FROM STUDENT " 
							+ "ORDER BY ID";				//이런식으로 잘라서 사용할 때는 띄어쓰기를 잘 봐둬야 함
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
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//5. 클로징 처리에 의한 자원 반납
			//역순으로 close() 처리 해줘야 함
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
		
		System.out.println(">>> main() 끝");
	}

}
