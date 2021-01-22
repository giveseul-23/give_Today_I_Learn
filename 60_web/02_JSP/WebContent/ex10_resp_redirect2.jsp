<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%
			     //전달받은 파라미터 값 추출
			   	String id = request.getParameter("id");
			   	String pw = request.getParameter("pw");
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최종응답(리다이렉트)</title>
</head>
<body>
		<h1>["ex10_resp_redirect2.jsp"]</h1>
		<h2>id : <%=id %></h2>
		<h2>pw : <%=pw %></h2>
</body>
</html>