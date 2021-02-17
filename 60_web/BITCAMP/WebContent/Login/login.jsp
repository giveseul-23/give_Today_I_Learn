<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">
	function start(frm) {
		frm.action="loginController?type=login"
		frm.submit();
	}
	function join(frm) {
		frm.action="loginController?type=join"
		frm.submit();
	}
	function findId(frm) {
		frm.action="loginController?type=findId"
		frm.submit();
	}
	function findPwd(frm) {
		frm.action="loginController?type=findPwd"
		frm.submit();
	}
</script>
</head>
<body>
	<h2>로그인</h2>
		<form method="post">
			아이디 <input type="text" name="id"><br/>
			비밀번호 <input type="password" name="password">
			<input type="button" value="로그인" onclick="start(this.form)"><br/>
			<input type="button" value="회원가입" onclick="join(this.form)">
			<input type="button" value="아이디찾기" onclick="findId(this.form)">
			<input type="button" value="비밀번호찾기" onclick="findPwd(this.form)">
		</form>
</body>
</html>