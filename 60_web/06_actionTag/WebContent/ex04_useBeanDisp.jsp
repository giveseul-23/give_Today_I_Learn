<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- 전달받은 파라미터 값 vo저장하고 화면 출력
    	1. MemberVO타입의 객체 생성(memverVO)
    	2. 전달받은 파라미터 값을 memverVO객체(인스턴스)에 저장
    	3. memverVO 값을 화면에 출력
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
	1. MemberVO타입의 객체 생성(memverVO)
	MemberVO memverVO = new MemberVO();
	memverVO.setName(request.getParameter("name"));
	memverVO.setAge(request.getParameter("age"));
 --%>
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
	if(member.getHobby() != null){
		for(String str:member.getHobby()){
			out.println(str + " ");
		}
	}else {
		out.println("선택된 취미가 없습니다.");
	}
	%>
	</p>
		
</body>
</html>