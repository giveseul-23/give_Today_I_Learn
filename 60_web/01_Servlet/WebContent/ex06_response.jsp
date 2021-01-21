<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

		String name = request.getParameter("name");
		
		int korNumber = Integer.parseInt(request.getParameter("kor"));
		int engNumber = Integer.parseInt(request.getParameter("eng"));
		int mathNumber = Integer.parseInt(request.getParameter("math"));
		
		int result = (korNumber+engNumber+mathNumber);
		double avg = result*100/3/100.00;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리 결과(JSP)</title>
<style>
	table{
			border-collapse:  collapse;
	}
	
	th,td{
			width : 100px; border: 1px solid gray; padding:10px;
	}
	th{
			background-color: orange;
	}
</style>
</head>
<body>
	<h3>성적처리 결과(JSP)</h3>
	
	<table border>
			<tr>
				<th>이름</th>
				<td><%=name %></td>
			</tr>
			<tr>
				<th>국어</th>
				<td><%=korNumber %></td>
			</tr>
			<tr>
				<th>영어</th>
				<td><%=engNumber %></td>
			</tr>
			<tr>
				<th>수학</th>
				<td><%=mathNumber %></td>
			</tr>
			<tr>
				<th>총점</th>
				<td><%=result %></td>
			</tr>
			<tr>
				<th>평균</th>
				<td><%=avg %></td>
			</tr>
	</table>
	
</body>
</html>