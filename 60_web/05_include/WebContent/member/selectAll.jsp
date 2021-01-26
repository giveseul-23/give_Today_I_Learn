<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    <%-- DB에서 전체 데이터 조회(검색)해서 화면출력 --%>
    <%
    	//DB연동 프로그램 작성
    	//JDBC 프로그램을 위한 변수 선언
   		final String DRIVER = "oracle.jdbc.OracleDriver";
   		final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
   		final String USER = "mystudy";
   		final String PASSWORD = "mystudypw";
   		
   		
   		Connection conn = null;
   		PreparedStatement pstmt = null;
   		ResultSet rs = null;
   		
   		try{
   			//1. 드라이버 로딩
			Class.forName(DRIVER);
			//2. 데이터베이스 연결
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			
			String sql = ""
					+ "SELECT IDX, ID, PWD, NAME, AGE, "
					+ "  NVL(ADDRESS, '주소없음') AS ADDRESS, REG, "
					+ " TO_CHAR(REG, 'YYYY/MM/DD') AS REG2 "
					+ " FROM MEMBER " 
					+ " ORDER BY IDX ";
			
			//3. Statement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//4. SQL 실행
			rs = pstmt.executeQuery();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표준화면</title>
<script src="includee/event.js" type="text/javascript"></script>
</head>
<body>
<%@ include file ="includee/menu.jspf" %>

<hr>
<h1>전체 데이터 검색</h1>
<table border>
	<thead>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>나이</th>
			<th>주소</th>
			<th>날짜</th>
		</tr>
	</thead>
	<tbody>
<%
	while(rs.next()){
%>
		<tr>
			<td><%=rs.getInt("IDX") %></td>
			<td><%=rs.getString("ID") %></td>
			<td><%=rs.getString("PWD") %></td>
			<td><%=rs.getString("NAME") %></td>
			<td><%=rs.getInt("AGE") %></td>
			<td><%=rs.getString("ADDRESS") %></td>
			<%-- <td><%=rs.getDate("REG") %></td> --%>
			<td><%=rs.getString("REG2") %></td>
		</tr>
<%
	}
%>
	</tbody>
</table>
</body>
</html>

<%
}catch(Exception e){
	e.printStackTrace();
}finally{
	//6. 사용자원 반납(close)
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
}
%>