<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String c_idx = request.getParameter("c_idx");
	String b_idx = request.getParameter("b_idx");
	String pwd = request.getParameter("pwd");
	
	System.out.println(c_idx + " " + b_idx + " " + pwd);
	
	pageContext.setAttribute("checkpwd", pwd);
	pageContext.setAttribute("c_idx", c_idx);
	pageContext.setAttribute("b_idx", b_idx);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제화면</title>
</head>
<body>
	<h2>비밀번호 확인</h2>
 	<form action="ans_del_ok.jsp" method="post">
 		비밀번호 : <input type="password" name="pwd">
 		<input type="button" value="입력" name="btn">
 		<input type="hidden" value="${c_idx }" name="c_idx">
 		<input type="hidden" value="${b_idx }" name="b_idx">
 	</form>
</body>
<script type="text/javascript">
	document.forms[0].btn.onclick = function(){
		var form = document.forms[0];
		if(form.pwd.value != '${checkpwd}'){
			alert("비밀번호가 상이합니다. 확인 해주세요.");
			history.back();
		}
	}
</script>
</html>