package com.mystudy.jdbc2_prepared;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class StudentManager_Insert {

	public static void main(String[] args) {
		/*
		  JDBC 이용한 DB 프로그래밍 방법
			0. JDBC 라이브러리 사용 개발환경 설정(jdbc.jar 빌드패스 등록)
			1. JDBC 드라이버 로딩
			2. DB 연결하고 Connection 객체 생성
			3. Statement 문 생성 및 실행(SQL문 - 쿼리문 실행) - insert, select, delete, update는 모든게 같지만 이 부분의 구문작성에서 달라짐
			4. 결과물에 대한 처리
				- SELECT : 조회 데이터 결과값 처리 -- DB에서 가져오는 것
				- INSERT, UPDATE, DELETE : int 값(처리건수) 처리 -- DB에 반영되는 부분
			5. 클로징 처리에 의한 자원 반납
		*/
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			//1. JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.OracleDriver");
			
			//2. DB 연결하고 Connection 객체 생성
			conn =  DriverManager.getConnection(
					//사용할 드라이브 		현재pc를의미 -- 연결된 url? 같은거라 생각하자
					"jdbc:oracle:thin:@localhost:1521:xe", 
					"mystudy", "mystudypw");
			//3. Statement 문 생성 및 실행(SQL문 - 쿼리문 실행)
			//변수
			String id = "2020114";
			String name = "홍길동114";
			int kor = 99;
			int eng = 80;
			int math = 70;
			
			StringBuilder sql = new StringBuilder();
			sql.append(" INSERT INTO STUDENT (ID, NAME, KOR, ENG, MATH) "); 
			sql.append(" VALUES (?, ?, ?, ?, ?)");
			System.out.println("sql : " + sql.toString());
			
			pstmt = conn.prepareStatement(sql.toString());
			//값 설정 : ?(바인드변수)에 값을 설정
							//setString(parameterIndex, 값)
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setInt(3, kor); // 데이터 타입에 맞게 set~해줌
			pstmt.setInt(4, eng);
			pstmt.setInt(5, math);
			
			/*
			 이러한 형태를 가지면 추가할때마다 parameterIndex를 계속 수정하지 않아도 된다.
				int i = 1;
				pstmt.setString(i++, id);	//1
				pstmt.setString(i++, name);	//2
				pstmt.setInt(i++, kor); 	//3
				pstmt.setInt(i++, eng);		//4
				pstmt.setInt(i++, math);	//5
			*/
			
			int cnt = pstmt.executeUpdate(); 
			
			//4. 결과물에 대한 처리
			System.out.println(">> 처리건수 : "+ cnt);
			
		} catch (ClassNotFoundException e) {
			System.out.println("[예외] 드라이버 로딩 실패!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("[예외] DB연결 실패(connection fail)");
			e.printStackTrace();
		} finally {
			try {
				//null이 아닐때 닫아주는게 더 좋은 방법 (조건문 달아서..)
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
