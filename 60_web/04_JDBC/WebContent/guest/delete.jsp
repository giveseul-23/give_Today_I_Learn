<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
    	전달받은 파라미터 값 사용 DB데이터 삭제 처리
    	정상적 처리 후 : list.jsp로 이동
    	예외발생시 : 현재 페이지(예외메시지) 보여주기
    			(링크추가 : 상세보기, 목록보기)
     --%>
     <%
   		//1. 파라미터 값 추출
		int sabun = Integer.parseInt(request.getParameter("idx"));

		int result = 0;
		try{
			//2. 파라미터 값이 정상이면 DB 입력처리
			result = delete(sabun);
		}catch(NumberFormatException e){
			System.out.println(">> 급여항목에 잘못된 값이 입력되었습니다.");
		}
		
		//3. 실행결과에 따른 페이지 이동처리(list.jsp)
		if(result == 0){ //SQL 정상실행 + 데이터가 삭제되지 않음(없는 번호를 삭제하는 경우)
			%>
			<script>
				alert("[삭제실패] 대상이 없어서 삭제하지 못했습니다."+"\n목록페이지로 이동합니다.")
				location.href="list.jsp";
			</script>
			<% 
		}else if(result > 0){ //SQL 정상실행 + 데이터가 삭제됨
			%>
			<script>
				alert("[삭제완료] 삭제처리 완료하였습니다."+"\n목록페이지로 이동합니다.")
				location.href="list.jsp";
			</script>
			<% 
		}
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 삭제 실패</title>
</head>
<body>
	<!-- 위에서 result가 0이거나 0보다 큰 경우를 제외한 나머지 경우 아래 페이지가 보이게 함 -->
	<h1>사원 삭제 실패</h1>
	<p>삭제처리를 하지 못했습니다.<br>
	[상세보기] 클릭해서 다시 작업하세요.
	담당자에게 연락하세요.
	</p>
	<a href="detail.jsp">상세보기</a>
	<a href="list.jsp">전체목록 보기</a>
</body>
</html>

<%! 
		final String DRIVER = "oracle.jdbc.OracleDriver";
		final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
		final String USER = "mystudy";
		final String PASSWORD = "mystudypw";

		private int delete(int sabun){
			int result = 0;

			Connection conn = null;
			PreparedStatement pstmt = null;
			
			
			String sql = "DELETE FROM GUEST WHERE SABUN = ?";

			
			try{
				//1. 드라이버 로딩
				Class.forName(DRIVER);
				//2. 데이터베이스 연결
				conn = DriverManager.getConnection(URL, USER, PASSWORD);
				//3. Statement 객체 생성
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, sabun);
				//4. SQL 실행
				result = pstmt.executeUpdate();
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				//6. 사용자원 반납(close)
				try{
					if(pstmt != null) pstmt.close();
				}catch(SQLException e) {
					result = -999; //오류인 경우
					e.printStackTrace();
				}try{
					if(conn != null) conn.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
			
			return result;
		}

%>