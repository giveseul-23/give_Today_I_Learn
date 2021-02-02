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
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> -> 태그립 라이브러리 등록 예시
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
	<hr>
	
	<h3>if 태그2 : var 속성은 test 결과 저장</h3>
	<c:set var="n1" value="10" />
	<c:set var="n2" value="20" />
	
	<c:if test="${n1 > n2 }" var="result">
		<p>if문 결과 n1이  n2보다 큽니다(result : ${result })</p> <!-- 절대 실행될수 없음 왜냐면 논리적으로 맞지 않는 문장이기 때문  -->
	</c:if>
	
	<p>n1 > n2 result : ${result }</p>
	
	<c:if test="${n1 < n2 }" var="result">
		<p>if문 결과 n1이  n2보다 작거나 같습니다(result : ${result })</p>
	</c:if>
	
	<hr><hr>
	
	<%-- ======= choose ~ when ~ otherwise ======= --%>
	<c:set var ="jumsu" value="80"/>
	<c:if test="${jumsu >= 60 }">
		<p>판정결과(점수 : ${jumsu} }) : <c:out value="합격"/> </p>
	</c:if>
	<c:if test="${jumsu < 60 }">
		<p>판정결과(점수 : ${jumsu} }) : <c:out value="불합격"/> </p>
	</c:if>
	<hr>
	
	<h2>choose ~ when ~ otherwise</h2>
	<p>choose ~ when ~ otherwise : if ~ else if ~ else if ~ else
	<c:choose>
		<c:when test="${jumsu>=90 }">
			<p>판정결과(${jumsu }) : A</p>
		</c:when>
		<c:when test="${jumsu>=80 }">
			<p>판정결과(${jumsu }) : B</p>
		</c:when>
		<c:when test="${jumsu>=70 }">
			<p>판정결과(${jumsu }) : C</p>
		</c:when>
		<c:otherwise>
			<p>판정결과(${jumsu }) : 노력필요</p>
		</c:otherwise>
	</c:choose>
	<hr><hr>
	
	<%-- ========= JSTL 반복문 forEach ========= --%>
	<h2>반복문 : forEach</h2>
	<h3>forEach문 : 자바의 기본 for문</h3>
	<p>1~10까지의 숫자 출력</p>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i }&nbsp;&nbsp;
	</c:forEach>
	
	<p>forEach문 종료 후 \${i } 값 출력 : ${i }</p> 
	
	<!-- *****************  -->
	<p>1~10까지 숫자 중 짝수 출력(step="1")사용</p>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:if test="${i%2 == 0}">
		${i }&nbsp;&nbsp;
		</c:if>
	</c:forEach>
	
	<hr>
	<p>1~10까지 숫자 중 짝수 출력(step="2")사용</p>
	<c:forEach var="i" begin="2" end="10" step="2">
		${i }&nbsp;&nbsp;
	</c:forEach>
	
	<%-- ================================== --%>
	<h2>forEach : 집합객체 처리</h2>
	<h3>배열값 출력(스크립트릿 사용)</h3>
	
<% 
	String[] arr = {"홍길동", "일지매", "임꺽정", "둘리"}; //arr은 로컬변수명
	for(String name : arr){
		out.print(name+" ");
	}
	//pageContext.setAttribute("attr_arr", arr); //해당 코드가 있어야 아래에 arr[0] = ${arr[0] }에서 출력이 가능하다.
%>
	<h3>EL에서 스크립트릿 변수 사용</h3>
	arr[0] = ${attr_arr[0] } ::스코프 상에 등록되지 않으면 EL에서 사용할 수 없음
	
	<h3>선언부, 스크립트릿 변수</h3>
	<c:set var="attr_arr" value="<%=arr %>"></c:set> <!-- attr_arr은 속성명 -->
	<c:forEach var="name" items="${attr_arr }">
		${name }
	</c:forEach>
	<hr><hr>
	
	<%--  ======= forTokens ======= --%>
	<c:set var="names" value="홍길동/김유신/일지매,임꺽정/둘리,고길동"/>
	<h3>names : ${names }</h3>
	<h3>forTokens 구분자 / 사용</h3>
	<!-- items="데이터명" delims="구분자" -->
	<c:forTokens var="name" items="${names}" delims="/">
		<p>${name }</p>
	</c:forTokens>
	<hr>
	
	<h3>forTokens 구분자 /와 , 함께 사용</h3>
	<c:forTokens var="name" items="${names}" delims="/,">
		<p>${name }</p>
	</c:forTokens>
	
</body>
</html>