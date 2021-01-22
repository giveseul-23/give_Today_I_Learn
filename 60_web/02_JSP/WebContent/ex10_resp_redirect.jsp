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
<title>리다이렉트(응답)</title>
</head>
<body>
		<h1>[ex10_resp_redirect.jsp]</h1>
		<h2>ID : </h2>
		<h2>id : <%=id %></h2>=ㅑㅇ
		<h2>pw : <%=pw %></h2>
		<%
				//재요청 처리(리다이렉트)
				//response.sendRedirect("ex10_resp_redirect2.jsp");
		
				//전달받은 파라미터 값 전달하면서 처리
				response.sendRedirect("ex10_resp_redirect2.jsp?id=" + id + "&pw=" + pw);
		%>
</body>
</html>