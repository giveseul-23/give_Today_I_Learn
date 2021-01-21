<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부 변수(전역변수, 필드변수)</title>
</head>
<body>
<%!
		//선언부(declaration) 는 필드영역에 작성되는 코드
		//선언부에 선언된 필드변수는 값이 하나(왜냐하면 생성된 객체가 1개니깐)
		int globalNum = 0;
%>

<%
		//스크립트릿 - service() 메소드 영역(로컬영역, 서비스 요청시 호출 실행, 매번 호출될 때 마다 사용되는 영역임)
		int localNum = 0;
		globalNum++;		//선언부에 선언된 필드변수는 계속 값이 증가함 (static처럼 값이 계속 남아있음, 왜냐하면 객체가 하나이기 때문!)
		localNum++;			//호출될 때 마다 항상 1임
		System.out.println("globalNum : "+ globalNum);
		System.out.println("localNum : "+ localNum);
		
%>

	<h2>globalNum : <%=globalNum %></h2>
	<h2>localNum : <%=localNum %></h2>
	
	
</body>
</html>