<%@page import="com.bc.mybatis.ShopVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 전달받은 제품번호를 사용해서 DB데이터 조회 후 화면 표시 --%>
	<%-- 액션태그 useBean scope 상에 id명 속성값이 
		있으면 사용하고, 없으면 클래스 속성 타입의 객체 생성 + scope 등록--%>
	<jsp:useBean id="dao" class="com.bc.mybatis.ShopDAO" scope="session" />
<%
	//전달 받은 값 추출(파라미터 값)
	String p_num = request.getParameter("p_num");
	pageContext.setAttribute("product", dao.selectOne(p_num));
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품상세 정보</title>
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
	
	.title { width: 30%; }
	tfoot { text-align: center; height: 3em; }
</style>
</head>
<body>
	<%@ include file="common/menu.jspf" %>

	<table>
		<tbody>
			<tr>
				<th class="title">제품Category</th>
				<td>${product.getCategory() }</td>
			</tr>
			<tr>
				<th>제품번호</th>
				<td>${product.getP_num() }</td>
			</tr>
			<tr>
				<th>제품명</th>
				<td>${product.getP_name() }</td>
			</tr>
			<tr>
				<th>제조사</th>
				<td>${product.getP_company() }</td>
			</tr>
			<tr>
				<th>제품가격</th>
				<td>정가 : ${product.getP_price() }
					<span class="red">(할인가격 : ${product.getP_saleprice() })</span></td>
			</tr>
			<tr>
				<th>제품설명</th>
				<td>${product.getP_content() }</td>
			</tr>
			<tr>
				<td colspan="2">
					<img src="images/${product.getP_image_l() }" alt="제품이미지">
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" class="center">
					<input type="button" value="장바구니에 담기"
						onclick="add()">
					<input type="button" value="장바구니에 보기"
						onclick="javascript:location.href='cartList.jsp'">
				</td>
			</tr>
		</tfoot>
	</table>
<script>
	function add() {
		location.href = "addProduct.jsp?p_num=${product.getP_num() }";
	}
	function cart_go() {
		location.href = "cartList.jsp";
	}
</script>


<br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br>
</body>
</html>







