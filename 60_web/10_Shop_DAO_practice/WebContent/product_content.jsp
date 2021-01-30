<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="com.bc.mybatis.ShopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String p_num = request.getParameter("p_num");
	
	ShopDAO dao = new ShopDAO();
	ShopVO vo = dao.selOne(p_num);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세화면</title>
<link href="common/menu.css" rel="stylesheet" type="text/css">
<link href="common/table.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.btnst{
		padding : 10px;
		margin-right: 10px;
	}
</style>
</head>
<body>
	<%@ include file ="common/menu.jspf" %>
	
	<table>
	  	<tr>
	  		<th>제품Category</th>
	  		<td><%=vo.getCategory() %></td>
	  	</tr>
	  	<tr>
	  		<th>제품번호</th>
	  		<td><%=vo.getP_num() %></td>
	  	</tr>
	  	<tr>
	  		<th>제품이름</th>
	  		<td><%=vo.getP_name() %></td>
	  	</tr>
	  	<tr>
	  		<th>제품제조사</th>
	  		<td><%=vo.getP_company() %></td>
	  	</tr>
	  	<tr>
	  		<th>제품가격</th>
	  		<td><%=vo.getP_price() %></td>
	  	</tr>
	  	<tr>
	  		<th>제품설명</th>
	  		<td><%=vo.getP_content() %></td>
	  	</tr>
	  	<tr>
	  		<td colspan="2">
	  			<img src="images/<%=vo.getP_image_l() %>" alt="<%=vo.getP_name() %>">
	  		</td>
	  	</tr>
	  	<tr>
	  		<td colspan="2">
	  			<input type="button" value="장바구니 담기" class="btnst" onclick="addCart(this.form)">
	  			<input type="button" value="장바구니 보기" class="btnst" onclick="viewCart(this.form)">
	  			<input type="hidden" >
	  		</td>	  		
	  	</tr>
	</table>
	
</body>
<script type="text/javascript">
	function addCart(frm) {
		location.href="addCart.jsp?p_num=<%=vo.getP_num()%>"
		frm.submit();
	}
	
	function viewCart(frm) {
		location.href="viewCart.jsp"
		frm.submit();
		
	}
</script>
</html>