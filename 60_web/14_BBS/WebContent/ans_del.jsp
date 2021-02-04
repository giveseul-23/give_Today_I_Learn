<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String c_idx = request.getParameter("c_idx");
	String b_idx = request.getParameter("b_idx");
	String pwd = request.getParameter("pwd");
	
	//확인용
	//System.out.println(c_idx + " " + b_idx + " " + pwd);
	
	pageContext.setAttribute("checkpwd", pwd);
	pageContext.setAttribute("c_idx", c_idx);
	pageContext.setAttribute("b_idx", b_idx);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글삭제 화면(암호확인)</title>
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
		if(form.pwd.value != '${checkpwd}'){	//EL 사용시 '이 안에 작성해야' 문자열 처리가 됨
			alert("비밀번호가 상이합니다. 확인 해주세요.");
			form.pwd.value = ""; //내용을 비워주고
			form.pwd.focus(); // 그 칸에 포커스
			return false; //현재 action 취소
			
		}
		var isDelete = confirm("정말 삭제하시겠습니까?");
		if(isDelete){//사용자가 isDelete 물음에 확인 누른 경우
			form.submit();
		}else{
			history.back(); //삭제작업 취소 후 이전페이지로 이동
		}
	}
</script>
</html>