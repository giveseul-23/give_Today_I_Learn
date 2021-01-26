<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>서브페이지(sub)</h1>
	<a href="main.jsp">메인페이지로 이동</a>
	<h2>서브페이지 내용</h2>
	<p>................</p>
	<p>................</p>
	<p>................</p>
	<p>................</p>
	<p>................</p>
	<!-- 디렉티브(지시어, directive) include : copy & paste 적용됨 -->
	<%@ include file = "01_declaration.jspf" %>
	<%@ include file = "02_scriptlet.jspf" %>
	<%@ include file ="footer.jspf" %>
</body>
</html>