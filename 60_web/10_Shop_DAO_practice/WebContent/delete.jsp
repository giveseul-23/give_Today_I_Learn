<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/> 

<%
	String p_num = request.getParameter("p_num");
	
	String str = cart.remove(p_num);
	
	if(str.equals("")){
		response.sendRedirect("viewCart.jsp");
	}else{
		%>
		<script type="text/javascript">
		alert(<%=str %>);
		history.back();
		</script>
		<%
	}
	
%>