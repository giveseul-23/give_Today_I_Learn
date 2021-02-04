<%@page import="com.bc.mybatis.DAO"%>
<%@page import="com.bc.mybatis.CommVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");	
	
	/*  내가 한 풀이
	CommVO cvo = new CommVO(request.getParameter("writer"), request.getParameter("pwd"), 
			request.getParameter("content"), request.getRemoteAddr(), request.getParameter("b_idx"));
	*/
%>
	<!-- 선생님 풀이 -->
	<jsp:useBean id="cvo" class="com.bc.mybatis.CommVO"/>
	<jsp:setProperty property="*" name="cvo"/>
<% 	
	cvo.setIp(request.getRemoteAddr());

	int result = DAO.insertComment(cvo);
	
	if(result < 1){%>
		<script type="text/javascript">
			alert("문제가 발생하였습니다. 담당자에게 문의하세요.");
		</script>
	<%
	}else{
		response.sendRedirect("view.jsp?b_idx="+cvo.getB_idx()+"&cPage="+session.getAttribute("cPage"));
	}
%>