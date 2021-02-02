<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL VO</title>
</head>
<body>
	<h1>JSTL Bean(VO 객체) 다루기</h1>
	<h2>객체에 값 설정(VO 객체)</h2>
	<jsp:useBean id="person" class="com.bc.vo.PersonVO"></jsp:useBean>
	<c:set target="${ person}" property="name" value="홍길동"/>
	<c:set target="${ person}" property="age" value="28"/>
	
	<%
		//로컬 person
		System.out.println("local person : " + person);
	
		//page객체 person
		System.out.println("page person : " + pageContext.getAttribute("person"));
	%>
	
	<p>person : ${person }</p>
	<p>person : <c:out value="${person }"></c:out></p>
	<hr>
	
	<p>person.name : ${person.name }</p>
	<p>person.getName() : ${person.getName() }</p>
	<!-- out에 기본값 설정한 경우  -->
	<p>person.name : 
		<c:out value="${person.name }" default="데이터 없음"/> 
	</p>

	<p>person.age : ${person.age }</p>
	<p>person.getAge() : ${person.getAge() }</p>
	
	<p>person.gender : 
		<c:out value="${person.gender }" default="데이터 없음"/> 
	</p>
	<hr>
	
	<p>person.toString() : ${person.toString() }</p>
	
</body>
</html>