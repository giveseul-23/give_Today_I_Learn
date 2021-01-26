<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값을 DB에 입력하고 화면이동
	정상처리 : selectAll.jsp
	예외발생 : error.jsp
--%>
<% 
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	int	age = Integer.parseInt(request.getParameter("age"));
	String address = request.getParameter("address");
	
	int result = 0;
	
	//JDBC 프로그램을 위한 변수 선언
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//사용할 SQL 쿼리 작성
	String sql = ""
						+ "INSERT INTO MEMBER "
				        +" (IDX, ID, PWD, NAME, AGE, ADDRESS, REG)"
				        +" VALUES (MEMBER_SEQ.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";
	
	try{
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. 데이터베이스 연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, address);
		
		//4. SQL 실행
		result = pstmt.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		//6. 사용자원 반납(close)
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
	
	if(result>0){
		%>
		<script>
		alert("입력완료. 메인페이지로 이동합니다.");
		location.href = "main.jsp";
		</script>
		<%
	}else {
%>
		<script>
		location.href = "error.jsp";
		</script>
<%		
	}
	
%>