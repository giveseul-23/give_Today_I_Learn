<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 세션에 설정된 속성 삭제하고 처음 페이지로 되돌아가기--%>
<% 
		//속성 자체를 자체(attr_age)
		session.removeAttribute("attr_age");
	
		//페이지 되돌아가기
		response.sendRedirect("ex01_session.jsp");
%>