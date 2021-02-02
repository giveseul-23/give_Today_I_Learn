<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL format</title>
</head>
<body>
	<h1>데이터 포맷 지정</h1>
	<h2>숫자 포맷 지정 태그 - formatNumber</h2>
	<fmt:formatNumber value="123" type="number"/><br>
	
	<!-- 
	minIntegerDigits : 정수부 최소 표시 자리수 지정(없으면 0 표시)
	maxIntegerDigits : 정수부 최대 표시 자리수 지정
	minFractionDigits : 소수부(소수점 이하) 최소 표시 자리수 지정(없으면 0 표시)
	maxFractionDigits : 소수부(소수점 이하) 최대 표시 자리수 지정(넘치면 버려짐, 6부터 올림처리)
	-->
	<fmt:formatNumber value="123" type="number" minIntegerDigits="10" /><br> 
	<fmt:formatNumber value="123.4" type="number" minFractionDigits="2" /><br>
	 
	<fmt:formatNumber value="123" type="number" maxIntegerDigits="2" /><br> 
	123.456 : <fmt:formatNumber value="123.456" type="number" maxFractionDigits="2" /><br> 
	123.455 : <fmt:formatNumber value="123.455" type="number" maxFractionDigits="2" /><br> 
	123.454 : <fmt:formatNumber value="123.454" type="number" maxFractionDigits="2" /><br>
	
	<h2>formatNumber : pattern 적용</h2>
	<!-- pattern=".000" 의 경우 없으면 해당 자리에 0이 채워짐 -->
	pattern=".000" : <fmt:formatNumber value="123456.78" pattern=".000"></fmt:formatNumber><br>
	<!-- pattern=".###" 의 경우 없으면 해당 자리가 비워짐 -->
	pattern=".###" : <fmt:formatNumber value="123456.78" pattern=".###"></fmt:formatNumber><br> 
	
	<!-- 넘치는 경우 마지막자리가 6이상이면 올림처리됨  -->
	pattern=".000" : <fmt:formatNumber value="123456.7889" pattern=".000"></fmt:formatNumber><br>
	pattern=".###" : <fmt:formatNumber value="123456.7889" pattern=".###"></fmt:formatNumber><br> 
	<p>소수점 이하 3자리만 표시할 경우 4번째 자리 숫자는 6부터 올림 5이하는 버림</p>
	<hr><hr>
	
	<h2>정수부 패턴적용(#,###.## / 0,000.00)</h2>
	<fmt:formatNumber value="91123456.678" pattern="#,###.##"/><br>
	<fmt:formatNumber value="91123456.678" pattern="0,000.00"/><br>
	
	<fmt:formatNumber value="1" pattern="#,###.##"/><br>
	<fmt:formatNumber value="1" pattern="0,000.00"/><br>

	<fmt:formatNumber value="0" pattern="#,###.##"/><br>
	<fmt:formatNumber value="0" pattern="0,000.00"/><br>
	<hr><hr>

	<%-- ============== 날짜 출력 ============== --%>
	<h2>formatDate : 날짜 출력</h2>
	<% Date now = new Date(); %>
	표현식 : <%=now %>
	<%pageContext.setAttribute("now", now); %>
	<p>날짜(now) : ${now }</p>
	
	<h3>formatDate사용 (날짜, 시간표시 - pattern)</h3>
	<fmt:formatDate value="${now }" pattern="yyyy-mm-dd"/><br>
	<fmt:formatDate value="${now }" pattern="yyyy-mm-dd HH:mm:ss"/><br>
	<fmt:formatDate value="${now }" pattern="yyyy/mm/dd HH:mm:ss"/><br>
	<fmt:formatDate value="${now }" pattern="yyyy.mm.dd HH:mm:ss"/><br>
	
	
	<h3>formatDate 사용(날짜표시)</h3>
	dateStyle 설정안함 : <fmt:formatDate value="${now }"/><br>
	dateStyle="short" : <fmt:formatDate value="${now }" dateStyle="short"/><br>
	dateStyle="medium" : <fmt:formatDate value="${now }" dateStyle="medium"/><br>
	dateStyle="long" : <fmt:formatDate value="${now }" dateStyle="long"/><br>
	dateStyle="full" : <fmt:formatDate value="${now }" dateStyle="full"/><br>
	
	<h3>formatDate 사용(시간표시)</h3>
	timeStyle 설정안함 : <fmt:formatDate type="time" value="${now }"/><br>
	timeStyle="short" : <fmt:formatDate type="time" value="${now }" timeStyle="short"/><br>
	timeStyle="medium" : <fmt:formatDate type="time"  value="${now }" timeStyle="medium"/><br>
	timeStyle="long" : <fmt:formatDate type="time"  value="${now }" timeStyle="long"/><br>
	timeStyle="full" : <fmt:formatDate type="time"  value="${now }" timeStyle="full"/><br>
	
	
	<h3>formatDate 사용(날짜, 시간표시)</h3>
	timeStyle 설정안함 : <fmt:formatDate type="both"  value="${now }"/><br>
	timeStyle="short" : <fmt:formatDate type="both" value="${now }" timeStyle="short"/><br>
	timeStyle="medium" : <fmt:formatDate type="both" value="${now }" timeStyle="medium"/><br>
	timeStyle="long" : <fmt:formatDate type="both" value="${now }" timeStyle="long"/><br>
	timeStyle="full" : <fmt:formatDate type="both" value="${now }" timeStyle="full"/><br>
	
	
	
	
	
</body>
</html>