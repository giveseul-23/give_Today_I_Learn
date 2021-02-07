<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서조회 검색</title>
</head>
<body>
	<h2>부서조회 검색</h2>
	<!-- post 방식에서는 action으로 타입값을 줬을 때 실행가능하지만 get 방식으로 하려면 hidden 타입의 인풋태그가 있어야 함 -->
	<form action="frontcontroller?type=deptList" method="post">
		부서번호 : <input type="text" name="deptno">
		<input type="submit" value="검색">
		<!-- <input type="hidden" value="deptList" name="type"> -->
	</form>
</body>
</html>