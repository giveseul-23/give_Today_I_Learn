<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    		String id = request.getParameter("id");
    		String pw = request.getParameter("pw");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포워딩 방식 처리</title>
</head>
<body>
		<h2>[ ex10_resp_forward.jsp ]</h2>
		<h3>ID : <%=id %></h3>
		<h3>PW : <%=pw %></h3>
<%
		//포워딩 처리(위임처리)
		RequestDispatcher rd = request.getRequestDispatcher("ex10_resp_forward2.jsp");
		rd.forward(request, response);
%>
</body>
</html>