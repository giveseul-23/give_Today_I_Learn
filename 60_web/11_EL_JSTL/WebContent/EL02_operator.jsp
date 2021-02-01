<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 연산자</title>
</head>
<body>
	<h1>EL : 문자열연산자, 비교연산자, 논리연산자</h1>
	<h2>문자열 붙이기</h2>
	<p>"HELLO" + "WORLD!!!" --> "HELLO WORLD!!!"</p>
	<p>표현식  : "HELLO" + "WORLD!!!" -> <%="HELLO" + " WORLD!!!" %></p>
	<p>EL표현식  : "HELLO" + "WORLD!!!" -> <%="HELLO" + " WORLD!!!" %></p>
	<%-- <p>EL표현식  : "HELLO" + "WORLD!!!" -> ${"HELLO" + " WORLD!!!" }</p> --%> <!-- +은 산술연산만 가능 --> 
	
	<h2>EL로 문자열 붙이기(+=)</h2>
	<p>EL : "HELLO" += "WORLD!!!" -> ${"HELLO" += " WORLD!!!"}</p>
	<p>EL : "HELLO" += "WORLD!!!" -> ${"HELLO"} ${"WORLD!!!"}</p>
	
	<h2>EL 비교연산자</h2>
	<p>비교연산자(부호) : ==, !=, <, >, <=, >= 사용가능</p>
	<p>비교연산자(영문) : eq, ne, lt, gt, le, ge 추가 사용가능</p>
	<p>100 > 50 : ${100 > 50}</p>
	<p>100 > 50 : ${100 gt 50}</p>
	
	<p>100 >= 50 : ${100 >= 50}</p>
	<p>100 >= 50 : ${100 ge 50}</p>
	
	<p>100 == 50 : ${100 == 50}</p>
	<p>100 == 50 : ${100 eq 50}</p>
	
	<hr>
	
	<h2>EL 논리연산자 : &&, ||, and, or, not</h2>
	<p>논리연산자(부호) : &&, ||, ! 사용가능</p>
	<p>논리연산자(영문) : and, or, not 추가 사용가능</p>
	<p>100 > 50 && 200 > 100 : ${100 > 50 && 200 > 100}</p>
	<p>100 > 50 and 200 > 100 : ${100 > 50 and 200 > 100}</p>
	<p>100 > 50 and 200 > 100 : ${100 gt 50 and 200 gt 100}</p>
	
	<p>!(100 > 50 and 200 > 100) : ${!(100 > 50 and 200 > 100)}
	<p>not(100 > 50 and 200 > 100) : ${not(100 > 50 and 200 > 100)}
</body>
</html>