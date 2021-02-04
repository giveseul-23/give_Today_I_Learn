<%@page import="com.bc.mybatis.DAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String c_idx = request.getParameter("c_idx");
	String b_idx = request.getParameter("b_idx");
	
	Map<String, String> map = new HashMap<>();
	map.put("c_idx",c_idx);
	map.put("b_idx",b_idx);
	
	int result = DAO.deleteComment(map);
	
	if(result < 1){
		%>
		<script type="text/javascript">
			alert("문제가 발생하였습니다. 관리자에게 문의하세요");
			location.href="list.jsp";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
			alert("삭제완료되었습니다. 상세보기로 되돌아갑니다.");
			location.href="view.jsp?b_idx=<%=b_idx%>&cPage=${cPage}";
		</script>
		<%
	}
%>