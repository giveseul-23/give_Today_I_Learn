<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 전달받은 파라미터를 사용해서 DB데이터 수정처리
		    수정할 데이터 : 성명, 날짜(sysdate), 금액 
		   정상처리 후 : list.jsp로 이동
		   예외발생시 : 현재페이지(오류메시지)보여주기
		   - 상세보기, 목록보기 링크 제공
   --%>
   <%
 		//1. 파라미터 값 추출
 		int sabun = Integer.parseInt(request.getParameter("sabun"));
 		String name = request.getParameter("name");
 		int pay = Integer.parseInt(request.getParameter("pay"));

 		int result = 0;
 		try{
 			//2. 파라미터 값이 정상이면 DB 입력처리
 			result = update(sabun, name, pay);
 		}catch(NumberFormatException e){
 			System.out.println(">> 급여항목에 잘못된 값이 입력되었습니다.");
 		}
 		
 		//3. 실행결과에 따른 페이지 이동처리(list.jsp)
 		if(result >0 ){
 			response.sendRedirect("list.jsp");
 		}
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 수정 실패</title>
</head>
<body>
	<h1>사원 수정 실패</h1>
	<p>수정처리를 하지 못했습니다.<br>
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

		private int update(int sabun, String name, int pay){
			int result = 0;

			Connection conn = null;
			PreparedStatement pstmt = null;
			
			
			String sql = "UPDATE GUEST SET NAME = ?, NALJA = SYSDATE, PAY = ? "
					+" WHERE SABUN = ?";

			
			try{
				//1. 드라이버 로딩
				Class.forName(DRIVER);
				//2. 데이터베이스 연결
				conn = DriverManager.getConnection(URL, USER, PASSWORD);
				//3. Statement 객체 생성
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setInt(2, pay);
				pstmt.setInt(3, sabun);
				//4. SQL 실행
				result = pstmt.executeUpdate();
				//5. SQL 실행결과에 대한 처리
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				//6. 사용자원 반납(close)
				try{
					if(pstmt != null) pstmt.close();
				}catch(SQLException e) {
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