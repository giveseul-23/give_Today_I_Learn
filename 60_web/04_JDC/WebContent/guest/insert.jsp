<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 전달받은 데이터를 이용해서 DB에 입력처리
    		정상입력 : list.jsp 페이지로 이동
    		예외발생 : 현재페이지 보여주기
    --%>
    <%
    		//1. 파라미터 값 추출
    		int sabun = Integer.parseInt(request.getParameter("sabun"));
    		String name = request.getParameter("name");
    		int pay = 0;
    		int result = 0;
    		try{
    			pay = Integer.parseInt(request.getParameter("pay"));
    			//2. 파라미터 값이 정상이면 DB 입력처리
    			result = insert(sabun, name, pay);
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
<title>사원 등록 실패</title>
</head>
<body>
		<h1>사원 등록 실패</h1>
		<p>입력처리를 하지 못했습니다.<br>
		[입력페이지로 이동] 클릭해서 다시 작업하세요.
		담당자에게 연락하세요.
		</p>
		<a href="addForm.jsp">입력페이지로 이동</a>
		<a href="list.jsp">전체목록 보기</a>
</body>
</html>

<%!
			//선언부(declaration) : 클래스의 필드영역에 추가되는 코드
			//(실습)JDBC 프로그램을 사용해서 입력처리
			//JDBC 프로그램을 위한 변수 선언
			
			//필드로 선언함
			final String DRIVER = "oracle.jdbc.OracleDriver";
			final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
			final String USER = "mystudy";
			final String PASSWORD = "mystudypw";
				
				
			private int insert(int sabun, String name, int pay){
				int result = 0;
				
				Connection conn = null;
				Statement stmt = null;
				
				
				String sql = "INSERT INTO GUEST(SABUN, NAME, NALJA, PAY)  "+"  VALUES ("+sabun+", '"+name+"', SYSDATE, "+pay+")";
				/*
						PrepareStatment sql 문장
						String sql = "INSERT INTO GUEST(SABUN, NAME, NALJA, PAY)  "
											+"  VALUES (?, ?, SYSDATE, ?)";
				
						pstmt = conn.prepareStatment(sql);
						
						pstmt.setInt(1, sabun);
						pstmt.setString(2, name);
						pstmt.setInt(3, pay);
				*/
				
				
				try{
					//1. 드라이버 로딩
					Class.forName(DRIVER);
					//2. 데이터베이스 연결
					conn = DriverManager.getConnection(URL, USER, PASSWORD);
					//3. Statement 객체 생성
					stmt = conn.createStatement();
					//4. SQL 실행
					result = stmt.executeUpdate(sql);
					//5. SQL 실행결과에 대한 처리
					
				}catch(Exception e){
					System.out.println("입력오류!");
				}finally{
					//6. 사용자원 반납(close)
					try{
						if(stmt != null) stmt.close();
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