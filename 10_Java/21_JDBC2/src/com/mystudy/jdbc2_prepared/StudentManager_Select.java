package com.mystudy.jdbc2_prepared;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentManager_Select {

	public static void main(String[] args) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//01.드라이브 로딩
			Class.forName("oracle.jdbc.OracleDriver");
			
			//02. DB 연결하고 커넥션 객체 생성
			conn =  DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", 
					"mystudy", "mystudypw");
			
			//03. 프리페어드스테이트먼트문 생성
			//스테이트 방식 : conn.createStatement();
			String sql = "SELECT ID, NAME, KOR, ENG, MATH "
					+ "FROM STUDENT " 
					+ "WHERE ID = ? "
					+ "ORDER BY ID";
			// SQL 실행 준비 요청
			pstmt = conn.prepareStatement(sql); 
			//실행시킬 SQL에 값 매칭
			pstmt.setString(1, "2020112"); //"WHERE ID = ? " 이 구문이 없다면 필요없는 소스임, WHRER절이 없으면 그냥 전체 데이터를 조회하는 것
			//준비된 SQL 실행요청
			rs = pstmt.executeQuery(); // 여기서 sql을 다시 넣을필요는 없다 왜냐하면 위에서 이미 sql구문을 넣어 준비를 하고 있기 때문이다.
			
			if(rs.next()) {
				String str = "";
				str += rs.getString("ID") + "\t";
				str += rs.getString("NAME") + "\t";
				str += rs.getInt("KOR") + "\t";
				str += rs.getInt("ENG") + "\t";
				str += rs.getInt("MATH") + "\t";
				System.out.println(str);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
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
		
	}

}
