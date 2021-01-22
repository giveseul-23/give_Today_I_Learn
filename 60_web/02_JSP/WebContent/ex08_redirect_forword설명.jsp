<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
    		리다이렉트(redirect), 포워딩(forward)
    		1. 리다이렉트 : response.sendRedirect("이동위치")
    			단순한 페이지 전환(새로운 페이지 다시 요청하도록)
    			<특징>
    			- request, response 객체가 다시 생성됨
    			- 최초 요청시 요청 파라미터 값을 전달 할 수 없음
    			- 요청 URL 변경됨
    		2. 포워딩 : 전달(또는 위임)의 개념
    			<방법1>
    			- request.getRequsetDispatcher("이동위치").forward(request, response);
    			<방법2>
    			- RequsetDispatcher rd(객체) = request.getRequsetDispatcher("이동위치");
    			  rd.forward(request, response);
    			  <특징>
    			  - 최초요청시 생성된 request, response 객체 전달
    			  - 최초 요청시 전달된 파라미터 값 전달 가능(위임 받는 곳에서 사용가능)
    			  - 요청 URL 변경없음(최초 요청 주소 그대로 표시됨)
    			  
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>