<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//한글처리를 위한 설정
	request.setCharacterEncoding("UTF-8");

	//파라미터 추출
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
%>

	<h1>[여기는 ex01_includee_param.jsp]</h1>
	<h2>이름 : <%=name %></h2>
	<h2>나이 : <%=age %></h2>