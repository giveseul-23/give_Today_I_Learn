<%@page import="com.bc.vo.PersonVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL forEach</title>
</head>
<body>
	<h1>JSTL forEach : Array, List, Set, Map<k,v> </h1>
	<h2>배열(Array) 출력</h2>
	<p>출력대상 : {"a", "ab", "abc", "abcd"}</p>
<%
	String[] strs = {"a", "ab", "abc", "abcd"};
	pageContext.setAttribute("arr", strs);
%>
	<c:forEach var="str" items="${arr }">
		<p>${str }</p>
	</c:forEach>
	
	<h3>배열에 일부데이터만 사용(예 - 2,3번째 : 1,2번 인덱스)</h3>
	
	<c:forEach var="str" items="${arr }" begin="1" end="2">
		<p>${str }</p>
	</c:forEach>
	
	<!-- ============ LIST ===============  -->
	<h2>LIST 출력</h2>
<%
	List<Integer> list = new ArrayList<>();
	list.add(123);
	list.add(45);
	list.add(678);
	list.add(90);
	pageContext.setAttribute("alist", list);
%>
	<ul>
		<c:forEach var="listItem" items="${alist }">
			<li>${listItem }</li>
		</c:forEach>
	</ul>	
	<hr><hr>
	
	<%-- =========== Set 출력 ============ --%>
	<h2>Set 출력</h2>
<%
	Set<String> set = new HashSet<>();
	set.add("홍길동");
	set.add("김유신");
	set.add("강감찬");
	set.add("을지문덕");
	set.add("을지문덕");/* 중복데이터라 하나만 넣을 수 있음(set의 특징) */
	pageContext.setAttribute("hset", set);
	/* set */
	System.out.println("set.size() : "+set.size());
	System.out.println("set.contains(\"홍길동\") : "+set.contains("홍길동"));
%>
	<!-- hset -->
	<p>hset size() : ${hset.size()}</p>
	<p>hset contains("홍길동") : ${hset.contains("홍길동")}</p>
	
	<ul>
		<c:forEach var="name" items="${hset }">
			<li>${name }</li>
		</c:forEach>
	</ul>
	
	<%-- ======= Map key-value 데이터 사용 ======= --%>
	<h1>Map key-value 데이터 출력</h1>
	
<%
	Map<String, String> map = new HashMap<>();
	map.put("k1", "a");
	map.put("k2", "ab");
	map.put("k3", "abc");
	map.put("k4", "abcd");
	pageContext.setAttribute("hmap", map);
%>

	<c:forEach var="mapData" items="${hmap }">
		<!-- map이름.key 는 키값, map이름.value 는 벨류값  -->
		<p>${mapData.key } - ${mapData.value }</p> 
	</c:forEach>
	<hr><hr>
	
	<%-- ====================================== --%>
	<h1>VO가 저장된 List 사용</h1>
	
<%
	List<PersonVO> listBean = new ArrayList<>();
	listBean.add(new PersonVO("홍길동", "27"));
	listBean.add(new PersonVO("김유신", "30"));
	listBean.add(new PersonVO("강감찬", "40"));
	listBean.add(new PersonVO("을지문덕", "50"));
	pageContext.setAttribute("persons", listBean);
	
	for(PersonVO vo : listBean){
		out.println(vo.getName() + "-" +vo.getAge() + " ");
	}
%>
	<hr>
	<%-- 실습 persons 에 있는 PersonVO 이름, 나이 화면출력 --%>
	<!-- 필드값 다이렉트 접근방법  -->
	<c:forEach var="person" items="${persons }">
		<p>이름 : ${person.name} &nbsp; 나이 : ${person.age}</p>
	</c:forEach>
	<hr>
	<!-- 메소드 접근방법  -->
	<c:forEach var="person" items="${persons }">
		<p>이름 : ${person.getName()} &nbsp; 나이 : ${person.getAge()}</p>
	</c:forEach>
	
	
</body>
</html>