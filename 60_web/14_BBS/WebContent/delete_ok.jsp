<%@page import="com.bc.mybatis.BBSVO"%>
<%@page import="com.bc.mybatis.CommVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
	삭제요청한 데이터를 DB에서 삭제처리
	삭제후 화면전환 : 목록페이지로 이동(list.jsp)
	삭제실패(댓글있는 경우) : 경고창, 이전 페이지
 --%>
<%
	String b_idx = ((BBSVO)session.getAttribute("bvo")).getB_idx();
	System.out.println(b_idx);
	List<CommVO> list = DAO.getCommList(b_idx);
	
	if(list == null || list.size() < 1){
		DAO.delete(b_idx);
		%>
		<script type="text/javascript">
			alert("삭제완료. 목록페이지로 되돌아갑니다.");
			location.href="list.jsp";
		</script>
		<%
	}else{%>
		<script type="text/javascript">
			alert("댓글이 존재합니다.\n상세보기로 되돌아갑니다.");
			location.href="view.jsp?b_idx=<%=b_idx %>&cPage=${cPage}";
		</script>
<%
	}
	
%>