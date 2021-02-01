<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%-- 전달받은 데이터를 화면 출력 - EL 사용 --%>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL param</title>
</head>
<body>
<%-- EL 사용시 파라미터 값은 스코프에 저장하지 않고 사용가능
	EL 제공 객체중 param, paramValues 사용
 --%>
 	<h2>EL 사용해서 form 데이터 표시(param, paramValues)</h2>
 	<p>이름\${param.name } : ${param.name }</p> <!-- ${param.name }를 단순 문구로 표현하고자 할때 맨 앞에 \를 사용하면 됨 -->
 	<p>나이 \${param.age } : ${param.age }</p>
 	<p>성별\${param.gender } : ${param.gender }</p>
 	<p>취미\${param.hobby } : ${param.hobby }</p> <!-- 단순 .hobby라고 적으면 맨 앞에 값 한개만 가져옴  -->
 	<p>취미\${paramValues.hobby } : ${paramValues.hobby }</p>
 	<p>취미 데이터(\${paramValues.hobby[0] }) : ${paramValues.hobby[0] }</p>
 	<p>취미 데이터(\${paramValues.hobby[1] }) : ${paramValues.hobby[1] }</p>
 	<p>취미 데이터(\${paramValues.hobby[2] }) : ${paramValues.hobby[2] }</p>
 	<p>취미 데이터(\${paramValues.hobby[3] }) : ${paramValues.hobby[3] }</p>
</body>
</html>