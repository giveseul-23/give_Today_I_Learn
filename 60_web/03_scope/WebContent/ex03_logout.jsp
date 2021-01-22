<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- [로그아웃] 세션 초기화(무효화) 후 로그인 화면으로 되돌아가기 --%>
<%
		session.invalidate();
		
%>
<script>
		alert("로그인 아웃!");
		location.href="ex03_login.jsp";
		//response.sendRedirect("ex03_login.jsp") java코드 내  해당 구문 작성해서 돌아가는 것도 가능한데 alert가 안써짐...ㅠ
</script>