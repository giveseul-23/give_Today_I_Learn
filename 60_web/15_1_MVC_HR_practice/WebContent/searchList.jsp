<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String title = (String) request.getAttribute("title");
	pageContext.setAttribute("title", title);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title } 직원목록 조회</title>
</head>
<body>
	<h2>${title } 직원목록 조회</h2>
	<h5>사번, 이름, 업무번호, 매니저번호, 부서번호</h5>
	<ul>
		<c:forEach var="vo" items="${list }">
			<li> 
				${vo.employee_id }, ${vo.first_name }, ${vo.job_id },
				${vo.manager_id }, ${vo.department_id }
			</li>
		</c:forEach>
	</ul>
</body>
</html>