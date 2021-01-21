<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
		//선언부에 작성된 코드는 필드영역에 작성되는 코드
		//필드변수, 메소드 선언시 사용
		//필드변수는 로컬변수와 달리 위치와 관계없이 사용가능하다.
		//일반적인 인스턴스 변수와는 다르고 static처럼 공유하는 느낌임....
		int tot = 0; //필드변수 선언
		private int sum(int a, int b){ //메소드 선언
			return a+b;
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>declaration(선언부)</title>
</head>
<body>
		<h1>declaration(선언부)</h1>
		<h3>100 + 200  = 300</h3>
		
		<%
				//로컬변수는 사용하기 전에 반드시 작성해야 함
				int a = 100;
				int b = 200;
				int sum = a+b;
		%>
		
		<h3>100+200 = <%=sum %></h3>
		<hr>
		
		<h2>선언부의 메소드 사용</h2>
		<h3>sum(a,b) : 100 + 200 = <%= sum(a, b)%></h3>
		
		<%
				tot = sum(a,b);
		%>
		
		<h3>tot 출력 : 100+200 = <%= tot %></h3>
		
		
</body>
</html>