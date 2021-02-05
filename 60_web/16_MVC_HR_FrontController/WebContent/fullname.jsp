<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름 검색</title>
</head>
<body>
	<h2>이름으로 검색</h2>
	<form action="controller?type=fullnameList" method="post">
		이름 : <input type="text" name="fullname">
		<input type="submit" value="이름으로 검색">
	</form>
	<!-- get방식일 경우
	<form action="controller">
		이름 : <input type="text" name="fullname">
		<input type="submit" value="이름으로 검색">
		<input type="hidden" value="fullnameList" name="type">
	</form>
	
	 -->
</body>
</html>