<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- DB 에서 전체 데이터 조회 후 화면에 출력 --%>
<%
	//DB 에서 전체 데이터 조회 후 화면에 출력
	//1. SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession();
	
	//2. 매퍼의 SQL 실행
	List<GuestbookVO> list = ss.selectList("guestbook.all");
	ss.close();
	
	//3. EL, JSTL 에서 list 데이터 사용을 위해 스코프에 등록
	pageContext.setAttribute("attr_list", list);
	
	//4. SQL 실행결과 화면에 출력
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
<link href="../css/guestbook.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="container">
	<h2>방명록</h2>
	<hr>
	<p><a href="write.jsp">[방명록 쓰기]</a></p>
	
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>

		<!-- 데이터가 있으면 화면 출력 -->
		<c:if test="${not empty attr_list }">
			<c:forEach var="vo" items="${attr_list }">
				<tr>
					<td class="center">${vo.getIdx() }</td>
					<td class="center">${vo.getName() }</td>
					<td class="center"><a href="onelist.jsp?idx=${vo.idx }">${vo.subject }</a></td>
					<td>${vo.regdate }</td>
				</tr>
			</c:forEach>
		</c:if>
		
		<!-- 데이터가 없으면 화면출력 -->
 		<c:if test="${empty attr_list }"> 
 			<tr>
 				<td colspan="4">검색된 데이터가 없습니다</td>
 			</tr>
 		</c:if>
 	
 	
		</tbody>
	</table>
</div>
</body>
</html>