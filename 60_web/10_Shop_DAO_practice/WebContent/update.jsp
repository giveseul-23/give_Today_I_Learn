<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/> 
<%
	String p_num = request.getParameter("p_num");
	int su = Integer.parseInt(request.getParameter("su"));
	
	String str = cart.editQuant(p_num, su);
	
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