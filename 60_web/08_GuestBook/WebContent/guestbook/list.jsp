<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- DB 에서 전체 데이터 조회 후 화면에 출력 --%>
<%
	//DB 에서 전체 데이터 조회 후 화면에 출력
	//1. SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession();
	
	//2. 매퍼의 SQL 실행
	List<GuestbookVO> list = ss.selectList("guestbook.all");
	ss.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
<link href="/08_GuestBook/css/guestbook.css" rel="stylesheet" type="text/css">
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
<%
	//3. SQL 실행결과 화면에 출력
	if(list.size()>0){
		for(GuestbookVO vo : list){ %>
			<tr>
				<td><%=vo.getIdx() %></td>
				<td><%=vo.getName() %></td>
				<td><a href="onelist.jsp?idx=<%=vo.getIdx() %>"><%=vo.getSubject()%></a></td>
				<td><%=vo.getRegdate() %></td>
			</tr>
<%		}
	}else{
		out.print("<tr>");
		out.print("<td colspan='4'>검색된 데이터가 없습니다.</td>");
		out.print("</tr>");
	}
%>
		</tbody>
	</table>
</div>
</body>
</html>