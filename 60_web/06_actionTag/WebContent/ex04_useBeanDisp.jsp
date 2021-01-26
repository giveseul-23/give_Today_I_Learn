<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="member" class="com.mystudy.MemberVO" scope="request"/>
	
	<!-- set  -->
	<jsp:setProperty property="*" name="member"/>
	
	<h2>파라미터 값 표현하기</h2>
	<p>이름 : <%=member.getName() %></p>
	<p>나이 : <%=member.getAge() %></p>
	<p>비밀번호 : <%=member.getPwd() %></p>
	<p>성별 : <%=member.getGender() %></p>
	<p>취미 :
	<%
		String[] arr = member.getHobby();
		for(String a:arr){
			%>
			 <%= a + " "%> 
			<% 
		}
	%>
	</p>
		
</body>
</html>