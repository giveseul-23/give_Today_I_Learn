<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 화면에 표시 - 자바빈 VO사용--%>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="person" class="com.bc.vo.PersonVO"/>
	<jsp:setProperty property="*" name="person"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과보기 - 자바빈</title>
</head>
<body>
	<h2>결과보기(표현식으로 form 데이터 표시)</h2>
	<ul>
		<li>이름 : <%=person.getName() %></li>
		<li>나이 : <%=person.getAge() %></li>
		<li>성별 : <%=person.getGender() %></li>
		<li>취미 : <%=person.getHobby() %></li>
		<li>취미(반복문) : 
			<%
				for(String h : person.getHobby()){
					out.print(h+ " ");
				}
			%>
		</li>
	</ul>
	
	<hr>
	
	<h2>Bean 데이터 EL 사용 출력</h2>
	<!-- EL에서는 값이 없으면 null 값을 출력하지 않음  -->
	<ol>
		<li>이름 : ${person.getName() }</li> <!-- get 메소드 호출방식 -->
		<li>나이 : ${person.age }</li> <!-- 필드명으로 호출하는 방식 -->
		<li>성별 : ${person.getGender() }</li>
		<li>취미 : ${person.hobby }</li>
		<li>취미 : 
			- ${person.hobby[0] }
			${person.hobby[1] }
			${person.hobby[2] }
			${person.hobby[3] } -
		</li>
	</ol>
</body>
</html>