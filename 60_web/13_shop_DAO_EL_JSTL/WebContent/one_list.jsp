<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 전달받은 품목코드(category) 사용해서 DB데이터 조회하고 화면표시 --%>

	<%-- DAO객체를 session 에 저장해서 사용(세션이 유지되는 동안) --%>
	<jsp:useBean id="dao" class="com.bc.mybatis.ShopDAO" scope="session"/>
<%
	String category = request.getParameter("category");
	pageContext.setAttribute("plist", dao.list(category));	
%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품목록</title>
<link href="css/menu.css" rel="stylesheet" type="text/css">
<style>
	table {
		width: 600px;
		margin: 30px auto 0; /* 상 좌우 하 */
		border: 1px solid navy;
		border-collapse: collapse;
		font-size: 0.8em;
	}
	th, td { border: 1px solid navy; padding: 4px; }
	th { background-color: #ddd; }
	.red { color: red; }
</style>
</head>
<body>
	<%@ include file="common/menu.jspf" %>

	
	<%--제품목록 표시 영역 --%>
	<table>
		<thead>
			<tr>
				<th width="15%">제품번호</th>
				<th width="10%">이미지</th>
				<th width="20%">제품명</th>
				<th width="20%">판매가격</th>
				<th>비고</th>
			<tr>
		</thead>
		<tbody>
			
	<c:if test="${not empty plist }">
		<c:forEach var="product" items="${plist }">
			<tr>
				<td>${product.getP_num() }</td>
				<td>
					<img src="images/${product.getP_image_s() }" width="100px" height="95px">
				</td>
				<td>
					<a href="product_content.jsp?p_num=${product.getP_num() }">${product.getP_name() }</a>
				</td>
				<td>할인가:${product.getP_saleprice() }원<br>
				    <span class="red">(할인율:${product.getPercent()}%)</span>
				</td>
				<td>시중가격 : ${product.getP_price() }원</td>
			</tr>
		</c:forEach>
	</c:if>

	<c:if test="${empty plist }">
		<tr>
			<td colspan="5">현재 등록된 제품이 없습니다.</td>
		</tr>
	</c:if>
	
		</tbody>
	</table>


</body>
</html>






