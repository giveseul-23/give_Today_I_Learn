<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		//요청한 웹사이트로 "이동처리"
		String site = request.getParameter("site");

		switch(site){
		case "naver" : //네이버 웹페이지로 이동처리
				response.sendRedirect("http://www.naver.com");
				break;
		case "dum" : //다음 웹페이지로 이동처리
			response.sendRedirect("http://www.daum.net");
			break;
		case "google" : //구글 웹페이지로 이동처리
			response.sendRedirect("http://www.google.com");
			break;
		}
%>
<h1>ex09_resp_redirect.jsp</h1>