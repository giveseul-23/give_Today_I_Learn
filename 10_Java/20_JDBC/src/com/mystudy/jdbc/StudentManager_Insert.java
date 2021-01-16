package com.mystudy.jdbc;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class StudentManager_Insert {

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
			//과거방식 : Class.forName("oracle.jdbc.driber.OracleDriver");
			Class.forName("oracle.jdbc.OracleDriver"); //forName -> static형식임
		} catch (ClassNotFoundException e) {
			System.out.println("[예외] 드라이버 로딩 실패!");
			e.printStackTrace();
		}
		
		//2. DB 연결하고 Connection 객체 생성
		Connection conn = null; //연결된 객체가 담겨있음
									
		try {
			//연결된 객체를 넘겨준다고 생각하면 됨, 담아줄 객체가 필요하다.
			conn =  DriverManager.getConnection(
					//사용할 드라이브 		현재pc를의미
					"jdbc:oracle:thin:@localhost:1521:xe", 
					"mystudy", "mystudypw");
		} catch (SQLException e) {
			System.out.println("[예외] DB연결 실패(connection fail)");
			e.printStackTrace();
		}
		
		//3. Statement 문 생성 및 실행
		Statement stmt = null; //실행한 결과 statement문을 저장할 객체
		
		try {
			stmt = conn.createStatement();//연결된 db에다가 statement문을 생성
			/**/
			StringBuilder sql = new StringBuilder();
			sql.append(" INSERT INTO STUDENT (ID, NAME, KOR, ENG, MATH) "); //update, delete 부분은 다 동일한데 이 부분만 다르다
			sql.append(" VALUES ('2020001', '홍길동1', 100, 88, 77) "); //지금은 아예 통으로 넣었지만 나중에는 이 안에 변수들을 집어넣는다
			
			//- INSERT, UPDATE, DELETE : int 값(처리건수) 처리
			int cnt = stmt.executeUpdate(sql.toString());
			
			//4. 결과물에 대한 처리
			System.out.println(">> 입력건수 : "+ cnt);
			
			/*
			 String 으로 다 받는 것은 안좋은 방법
			String sql = "";
			sql += " INSERT INTO STUDENT (ID, NAME, KOR, ENG, MATH) ";
			sql += " VALUES ('2020001', '홍길동', 100, 90, 80) "; //지금은 아예 통으로 넣었지만 나중에는 이 안에 변수들을 집어넣는다
			stmt.executeUpdate(sql);
			*/
		} catch (SQLException e) {
			System.out.println();
			e.printStackTrace();
		} 
		
		//5. 클로징 처리에 의한 자원 반납
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
		
		System.out.println(">>> main() 끝"); //정상적으로 로딩이 된다면 뜨는 메세지
		
	}

}
