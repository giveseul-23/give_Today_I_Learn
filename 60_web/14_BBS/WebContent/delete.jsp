<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println(session.getAttribute("bvo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제(암호확인)</title>
</head>
<body>
	<form action="delete_ok.jsp" method="post">
		<h2>비밀번호 확인</h2>
		비밀번호 : <input type="password" name="pwd">
		<input type="submit" name="btn" value="입력">
	</form>
</body>
<script type="text/javascript">
	document.forms[0].btn.onclick = function(){
		var form = document.forms[0];
		if(form.pwd.value != '${bvo.pwd}'){
			alert("비밀번호가 상이합니다. 확인 해주세요.");
			form.pwd.value="";
			form.pwd.focus();
			return false;
		}
	}
</script>
</html>