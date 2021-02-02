<%@page import="com.bc.mybatis.ShopVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 장바구니(cart)에 있는 제품목록을 화면에 표시  --%>

<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/>
<c:set var="list" value="${cart.getList() }"/>
<%
	//카트에서 목록 꺼내기
	List<ShopVO> list = cart.getList();
	pageContext.setAttribute("plist", list);
	
	/* 사실 지금 여기서는 별도로 page 객체에 저장할 필요없이 카트를 세션에 넣었기때문에
		아래에 내용을 cart.list 이렇게 해서 써도 된다.
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니(cart)</title>
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
	tfoot { text-align: center; height: 3em; font-size:1.5em; font-weight:bold;}
</style>
</head>
<body>
	<%@ include file="common/menu.jspf" %>
	
	<%-- 카트내용 표시 --%>
	<table>
		<thead>
			<tr>
				<td colspan="6">::장바구니 내용</td>
			</tr>
			<tr>
				<th>제품번호</th>
				<th>제품명</th>
				<th>단가</th>
				<th>수량</th>
				<th>금액</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${empty plist }">
			<tr>
				<td colspan="6">장바구니가 비었습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty plist }">
			<c:forEach var="product" items="${plist }">
				<tr>
					<td>${product.getP_num()}</td>
					<td>${product.getP_name()}</td>
					<td>정가 : ${product.getP_price()}원
						<span style="color:red">세일가격 : ${product.getP_saleprice() }원</span>
					</td>
					<td>
						<form action="editQuant.jsp">
							<input type="number" name="su" size="3"
								value="${product.getQuant() }">
							<input type="submit" value="수정">
							<!-- type hidden으로 파라미터 값 전달  -->
							<input type="hidden" name="p_num" value="${product.getP_num() }">
						</form>
					</td>
					<td>${product.getTotalprice() }</td>
					<td>
						<input type="button" value="삭제" onclick='delProduct("${product.getP_num() }")'>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6">총 결제금액 : ${cart.getTotal()}</td>
			</tr>
		</tfoot>
	</table>
	
	<script>
		function delProduct(pNum){
			location.href="delProduct.jsp?p_num="+pNum;
		}
	</script>
</body>
</html>