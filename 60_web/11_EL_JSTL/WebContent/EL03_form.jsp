<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form 데이터 처리</title>
</head>
<body>
	<h1>데이터 처리방식(표현식, 자바빈, EL)</h1>
	<form action="" method="get">
		<p>이름 : <input type="text" name="name"></p>
		<p>나이 : <input type="text" name="age"></p>
		<p>성별 : 
			<input type="radio" name="gender" value="M"> 남자
			<input type="radio" name="gender" value="F"> 여자
		</p>
		<p>취미 : 
			<input type="checkbox" name="hobby" value="sports">운동
			<input type="checkbox" name="hobby" value="music">음악
			<input type="checkbox" name="hobby" value="movie">영화
			<input type="checkbox" name="hobby" value="book">책
		</p>
		<p>
			<input type="submit" value="전달1(표현식)" onclick="send_go1(this.form)">
			<input type="submit" value="전달2(자바빈)" onclick="send_go2(this.form)">
			<input type="submit" value="전달3(EL param)" onclick="send_go3(this.form)">
		</p>
	</form>
<script type="text/javascript">
	function send_go1(frm){
		frm.action = "el03_result01_expression.jsp";
		frm.submit();
	}
	function send_go2(frm){
		frm.action = "el03_result02_bean.jsp";
		frm.submit();
	}
	function send_go3(frm){
		frm.action = "el03_result03_param.jsp";
		frm.submit();
	}
</script>
</body>
</html>