<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인메뉴</title>
<script type="text/javascript">
	function all_go(){
		frm.action="frontcontroller?type=all";
		frm.submit();
	}
	function dept_go(){
		frm.action="frontcontroller?type=dept";
		frm.submit();
	}
	function name_go(){
		frm.action="frontcontroller?type=name";
		frm.submit();
	}
	function search_go(){
		frm.action="frontcontroller?type=search";
		frm.submit();
	}
</script>
</head>
<body>
	<form name="frm" method="post">
		<table>
			<caption style="font-size: 30px; text-align: left; font-weight: bold;">사원조회 메뉴</caption>
			<tr>
				<td><input type="button" name="all" value="전체조회" onclick="all_go()"></td>
				<td><input type="button" name="dept" value="부서조회" onclick="dept_go()"></td>
				<td><input type="button" name="name" value="이름조회" onclick="name_go()"></td>
				<td><input type="button" name="search" value="동적조회" onclick="search_go()"></td>
			</tr>
		</table>
	</form>
</body>
</html>