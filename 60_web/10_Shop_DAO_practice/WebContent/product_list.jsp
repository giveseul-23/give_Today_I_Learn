<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String category = request.getParameter("category");

	ShopDAO dao = new ShopDAO();
	List<ShopVO> list = dao.addList(category);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link href="common/menu.css" rel="stylesheet" type="text/css">
<link href="common/table.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file ="common/menu.jspf" %>
	<!-- 상품 목록 화면 -->
	<!-- 예시 
	<table>
		<thead>
			<tr>
				<th>제품번호</th>
				<th>이미지</th>
				<th>제품명</th>
				<th>제품가격</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>vc-13</td>
				<td><img alt="사니PDP-TV" src="images/pds4.jpg"></td>
				<td><a>사니PDP-TV</a></td>
				<td>할인가 : 4750원 <br><span class="red">(할인율 : 48%)</span></td>
				<td>시중가격 : 9200원</td>
			</tr>
		</tbody>
	</table>
	-->
	<table>
		<thead>
			<tr>
				<th>제품번호</th>
				<th>이미지</th>
				<th>제품명</th>
				<th>제품가격</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
		<%
		if(list.size() < 1){
			%>
			<tr>
				<td colspan="5">조회되는 목록이 없습니다.</td>
			</tr>
			<%
			return;
		}else{
			for(ShopVO vo : list){ 
				%>
				<tr>
					<td><%=vo.getP_num() %></td>
					<td><img alt="<%=vo.getP_name() %>" src="images/<%=vo.getP_image_s() %>"></td>
					<td><a href="product_content.jsp?p_num=<%=vo.getP_num() %>"><%=vo.getP_name() %></a></td>
					<td>할인가 : <%=vo.getP_saleprice() %>원 <br><span class="red">(할인율 : <%=vo.getPercent() %>%)</span></td>
					<td>시중가격 : <%=vo.getP_price() %>원</td>
				</tr>
				<% 	
				}
			}
		%>
		</tbody>
	</table>
</body>
</html>