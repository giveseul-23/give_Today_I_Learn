<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//실습 - 주문한 내역에 따라 계산하고 결과를 표시
		String coffee = request.getParameter("coffee");
		int money = 0;
		
		switch(coffee){
		case "1" :
			coffee = "아메리카노";
			money = 3000;
			break;
		case "2" :
			coffee = "카페모카";
			money = 3500;
			break;
		case "3" :
			coffee = "에스프레소";
			money = 2500;
			break;
		case "4" :
			coffee = "카페라떼";
			money = 4000;
			break;
}
		
		int count = Integer.parseInt(request.getParameter("su"));
		int inputMoney = Integer.parseInt(request.getParameter("inputmoney"));
%>
		<h2>주문 계산 결과</h2>
		<%-- 
				커피종류 : 아메리카노
				단가 : 3000원
				수량 : 3개
				구입금액 : 9000원(단가 * 수량)
				--------------------------------
				입금액 : 10000원
				잔액 : 1000원(입금액 - 구입금액)
		 --%>
		 
		 
		 <h3>커피종류 : <%=coffee %></h3>
		 <h3>단가 : <%=money %></h3>
		 <h3>수량 : <%=count %></h3>
		 <h3>구입금액 : <%=money * count %></h3>
		 <h3>----------------------------------</h3>
		 <h3>입금액 : <%= inputMoney %></h3>
		 <h3>잔액 : <%= inputMoney - (money * count )%></h3>
		 
		 
</body>
</html>