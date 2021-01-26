<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 값 처리</title>
</head>
<body>
<%
	//한글처리 설정
	request.setCharacterEncoding("UTF-8");
	//파라미터 값 추출
	
	//로컬변수임 
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
%>
	<h2>일반적인 파라미터 처리 방법</h2>
	이름 : <%=name %><br>
	나이 : <%=age %><br>
	
	<hr>
	
	<h2>속성(attribute)을 이용(request scope) - request객체에 저장하는 방식</h2>
<% 
	//별도의 속성값에 저장하는 방식임
	request.setAttribute("attr_name", name);
	request.setAttribute("attr_age", age);
%>
	<p>이름 : <%=request.getAttribute("attr_name") %></p>
	<p>나이 : <%=request.getAttribute("attr_age") %></p>
	
	<hr>
	
	<!-- =============================	 -->
	<%-- 
		액션태그 : <jsp:useBean></jsp:useBean>
		자바빈(Bean)을 이용해서 파라미터 값을 저장해서 사용
		자바빈(Bean)은 데이터를 저장할 목적으로 JSP에서 제공하는 저장소
		<useBean 액션태그의 역할 및 사용법>
		1. VO 객체(인스턴스) 생성(자바클래스) + scope 상에 저장
		2. 자바빈 생성(useBean 액션태그 사용)
			id : 사용할 변수명(속성명)
			class : 실제 사용할 클래스의 위치(패키지 + 클래스명)
			scope : page(default), request, session, application
	  --%>
	  
	  
	  <%--
	  		PersonVO person = request.getAttribute("person");
	  		if(person == null){ //request객체에 person명으로 된 것이 없다면 참
	  			//없다면 새로운 객체 생성
	  			person = new PersonVO();
	  			//request객체에 person명으로 PersonVO객체를 참조하는 person을 넣겠다는 의미
	  			request.getAttribute("person", person);
	  		}
	  		
	  		위의 소스를 아래에 액션태그로 나타냄
	   --%>
	  <!--  PersonVO "타입"의 객체로 생성되고 person이름의 id로 저장, 스코프 request 객체 저장 -->
	 <jsp:useBean id="person" class="com.mystudy.PersonVO" scope="request"/>
	 
	 
	 
	 <%-- name은 변수명, 즉, person에 저장되어있는 것을 쓰겠다는 의미 --%>
	 <%-- jsp:setProperty 객체의 setter호출 값 설정 --%>
	 <%-- property="name"은  PersonVO객체에 set메소드 중 name을 찾는다는 의미 --%>
	 <%-- 
	 <jsp:setProperty property="name" name="person"/>
	 <jsp:setProperty property="age" name="person"/>
	 --%>
	 
	 <%--위 구문 대체방식(대신 파라미터값과 setter의 이름이 동일해야 가능함) --%>
	 <jsp:setProperty property="*" name="person"/>
	 
	 <h2>표현식으로 값 표시(PersonVO)</h2>
	 <h2>이름(표현식) : <%=person.getName() %></h2>
	 <h2>나이(표현식) : <%=person.getAge() %></h2>
	 <hr>
	 
	 <!-- getProperty를 이용하여 데이터를 조회함 -->
	 <h2>데이터 읽기 : getProperty 액션태그</h2>
	 <h2>이름(액션태그) : <jsp:getProperty property="name" name="person"/> </h2>
	 <h2>나이(액션태그) : <jsp:getProperty property="age" name="person"/> </h2>
	 
<%
	//id person의 PersonVO
	System.out.println("person : " + person);
	
	//request 객체의 PersonVO
	//request객체에 PersonVO타입이 저장되어 있음 왜냐면 scope를 request로 해놓았기 때문이다.
	System.out.println("request person : " + request.getAttribute("person"));
	
	//둘이 같은 값을 가지고 있다면 같은 객체라는 말
%>
	 
 
</body>
</html>