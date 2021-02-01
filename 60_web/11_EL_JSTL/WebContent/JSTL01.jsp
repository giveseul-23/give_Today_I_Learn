<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<%-- JSTL(JSP Standart Tag Library)
		0. 라이브러리 다운(인터넷에서)
			- 다운로드 : https://tomcat.apache.org/download-taglibs.cgi
			- 다운로드 : mvnrepositry > jstl 검색
		1. 라이브러리 등록
			WebContent > WEB-INF > lib > jstl-1.2.jar 등록
		2. JSTL 디렉티브(지시어) taglib 추가
			taglib prifix="c" uri="http://java.sun.com/jsp/jstl/core" -> 태그립 라이브러리 등록 예시
	--%>
	
	<h2>JSTL 사용</h2>
	<h3>속성설정 : set<br>(~콘솔에 출력중~)</h3>
	<%-- 
		set : 속성 선언 태그 setAttribute 역할을 함 
		<c:set var="속성명" vlue="속성값" scope="범위"></set>
		scope: page | request | session | application
	--%>
	<c:set var="test" value="hello JSTL!!! - page"/><!-- 디폴트값이 PAGE스코프임 -->
	<c:set var="test" value="hello JSTL!!! - request" scope="request"/>
	<c:set var="test" value="hello JSTL!!! - session" scope="session"/>
	
<%
	//System.out.println("test : " + test);
	System.out.println("page test : " + pageContext.getAttribute("test"));
	System.out.println("request test : " + request.getAttribute("test"));
	System.out.println("session test : " + session.getAttribute("test"));
%>

	<h2>속성값 출력 : out</h2>
	<p><c:out value="hello world"/></p>
	<p>page test(c:out) : <c:out value=" ${pageScope.test }"/></p>
	<p>page test(EL) : ${pageScope.test }</p>	<!-- 굳이 OUT태그 안쓰는 이유... 그냥 EL로 바로 표현가능 -->
	<p>session test(EL) : ${sessionScope.test }</p>
	
	<p>application test(EL) : ${applicationScope.test }</p> <!-- 데이터 설정 안했기때문에 값이 뜨지 않음 -->
	<%-- 값이 없어서 기본값으로 처리하기 위해서 out을 사용한다 --%>
	<p>application test(EL) : 
		<c:out value="${applicationScope.test }" default="데이터 없음"></c:out>
	</p>
	<hr>
	
	<p>EL : ${test }</p> <!-- 가장 우선순위가 높은  page 객체에 저장된 것으로 출력됨  -->
	<p>EL(page) : ${pageScope.test }</p>
	<p>EL(request) : ${requestScope.test }</p>
	<hr>
	
	<!-- 속성삭제 -->
	<h3>삭제 : remove</h3>
	<c:remove var="test" scope="page"/>
	
	<p>EL : ${test }</p> <!-- page 속성 삭제되었기때문에 request 객체에 저장된 것으로 출력됨  -->
	<p>EL(page) : ${pageScope.test }</p> <!-- 속성을 삭제했기때문에 이 지점에서는 데이터를 출력할 수 없다 -->
	
	<!-- ==================  -->
	
	<%-- 자바코드의 분기문 if문에 해당하는 태그(if) --%>
	<h2>if 태그의 test 속성</h2>
	<c:if test="true">
		<p>if의 test 속성값이 true 인 경우 실행문장</p>
	</c:if>
	<c:if test="false">
		<p>if의 test 속성값이 false 인 경우 실행안되는 문장</p>
	</c:if>
	<hr>
	
	<%-- JSTL 에는 else 문이 없음(제공x) 
		직접 else 역할을 할 if문 작성해서 처리
	--%>
	<c:if test="${20>10 }">
		<p>20 &gt; 10 결과는 true인 경우 실행문장</p>
	</c:if>
	
	<c:if test="${20<=10 }">
		<p>20 &le; 10 결과는 true인 경우 실행문장</p>
	</c:if>
</body>
</html>