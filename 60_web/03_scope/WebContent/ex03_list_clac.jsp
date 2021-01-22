<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 품목 계산하기</title>

</head>
<body>
		<h2>계산</h2>
		<p>[<%=session.getAttribute("username") %>] 님 계산할 목록</p>
		<h2>계산할 품목</h2>
		<%-- ul, li 사용하여 장바구니 목록 출력
				장바구니가 없거나, 물건이 없으면 : <p>계산할 품목이 없습니다.</p>
				있으면 : ul, li 태그로 목록 화면 출력
		 --%>
		 <%
		 		ArrayList<String> list = (ArrayList<String>)session.getAttribute("product_list");
		 //System.out.println(list.get(0));
		 if(list == null || list.size()<0){
		 			out.println("<p>계산할 품목이 없습니다.</p>");
		 		}else{
		 			out.println("<ul>");
		 			for(int i=0; i<list.size(); i++){
		 				out.println("<li>"+list.get(i)+"</li>");
		 			}
		 			out.println("</ul>");
		 		}	
		 %>
		 <hr>
		 <p><a href="ex03_logout.jsp">로그아웃</a></p>
</body>
</html>