<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forEach varStatus</title>
</head>
<body>
<%
	List<String> list = new ArrayList<>();
	list.add("홍길동-1");
	list.add("홍길동-2");
	list.add("홍길동-3");
	list.add("홍길동-4");
	pageContext.setAttribute("alist", list);
%>	
	<h2>forEachList 데이터 표시</h2>
	<c:forEach var="name" items="${alist }">
		${name }&nbsp;&nbsp;
	</c:forEach>
	<hr><hr>
	
	<h2>forEach varStatus : 상태값 저장 객체</h2>
	<ol>
		<c:forEach var="name" items="${alist }" varStatus="status"
		begin="0" end="${alist.size()-1 }" step="1">
			<li>
				var 값 : ${name }<br>
				current : ${status.current }<br><!-- 현재 처리중인 데이터 -->
				count : ${status.count }<br> <!-- 처리되는 데이터 건수 -->
				index : ${status.index }<br> <!-- 처리되는 데이터의 인덱스 번호 -->
				first : ${status.first }<br> <!-- 첫번째 데이터 여부 -->
				last : ${status.last }<br> <!-- 마지막번째 데이터 여부 -->
				
				begin : ${status.begin }<br> <!-- begin 설정값 -->
				end : ${status.end }<br> <!-- end 설정값 -->
				step : ${status.step }<br> <!-- step 설정값 -->
				
				status : ${status } <!-- 위에서 varStatus="status" 로 정의한 객체!? -->
			</li>
		</c:forEach>
	</ol>
	
	
	
	
	
	
	
	
	
	
</body>
</html>