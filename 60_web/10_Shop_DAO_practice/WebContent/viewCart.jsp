<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.ShopVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/> 
<%
	List<ShopVO> list = cart.getCartList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카트 목록</title>
<link href="common/menu.css" rel="stylesheet" type="text/css">
<link href="common/table.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file ="common/menu.jspf" %>
	<table>
		<caption style="text-align: left">::장바구니 내용</caption>
		<thead>
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
<%
		if(list == null || list.size() < 1){	%>
			<tr>
				<td colspan="6">장바구니가 비었습니다</td>
			</tr>	
<%			
		}else{
			for(ShopVO vo : list){%>
			<tr>
				<td><%=vo.getP_num() %></td>
				<td><%=vo.getP_name() %></td>
				<td>정가 : <%=vo.getP_price() %>원 <span class="red">세일가격:<%=vo.getP_saleprice() %>원</span></td>
				<td><input type="text-area" id="su" value="<%=vo.getQuant() %>" style="width : 100px; margin-right: 10px;">
				<input type="button" id="btn" value="수정" style="padding : 5px;" onclick="update_product('<%=vo.getP_num() %>')"></td>
				<td><%=vo.getTotalprice() %></td>
				<td><input type="button" value="삭제" style="padding : 5px;" onclick="delete_product('<%=vo.getP_num() %>')"></td>
			</tr>
				<%
			}
		}
%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6" style="font-size: 1.5em;">총 결제금액 : <%=cart.getTotal() %>원</td>
			</tr>
		</tfoot>
	</table>
	
	<script type="text/javascript">
		function update_product(p_num){
			
			var su = document.getElementById("su");
			var btn = document.getElementById("btn");
			
			btn.onclick = function(){
				//alert(su.value);
				location.href="update.jsp?p_num="+p_num+"&su="+su.value;
			}
		}
		
		function delete_product(p_num){
			alert(p_num);
			location.href="delete.jsp?p_num="+p_num;
		}
	</script>
</body>
</html>