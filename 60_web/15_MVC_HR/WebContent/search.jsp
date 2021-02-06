<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동적검색</title>
</head>
<body>
	<h1>동적검색(search.jsp)</h1>
	<!-- index.jsp 에서 SearchController로 가는 액션명과 동일 -->
	<form action="search" method="get">
		<select name="idx">
			<option value="0">사번</option>
			<option value="1">이름</option>
			<option value="2">직종</option>
			<option value="3">부서</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="동적검색">
	</form>
</body>
</html>