<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값(ID)을 사용하여 DB데이터 삭제하고 화면이동
	정상처리 : selectAll.jsp
	예외발생 : error.jsp
--%>
<%
	String id = request.getParameter("id");
	
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
	String sql = "DELETE FROM MEMBER WHERE ID = ?";
	
	try{
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. 데이터베이스 연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		//4. SQL 실행
		result = pstmt.executeUpdate();
		
	}catch(Exception e){
		result = -999;
		e.printStackTrace();
	}finally{
		//6. 사용자원 반납(close)
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
	
	if(result == 0){
	%>
	<script>
		alert("삭제할 대상이 없습니다. 메인페이지로 이동합니다.")
		location.href ="main.jsp";
	</script>
	<%
	}else if(result < 0){
	%>
	<script>
		location.href ="error.jsp";
	</script>
	<%
	}else if(result > 0){
	%>
	<script>
		alert("삭제완료. 메인페이지로 이동합니다.")
		location.href ="main.jsp";
	</script>
	<%
		
	}
%>