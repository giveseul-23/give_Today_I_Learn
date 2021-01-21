<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>합계 구하기</title>
</head>
<body>
		<h2>1부터 10까지의 합계 구하기</h2>
		<h1>출력형태 : 1+2+3+......+9+10=55</h1>
		<h3>1+2+3+..+9+10 = 
		<%
			int sum = 0;
			for(int i=1; i<=10; i++){
				sum+=i;
			}
			out.print(sum); // 브라우저 화면 출력
		%>
		</h3>
		<hr>
		<%-- 
				스크립트릿, out객체를 사용하여 h3태그를 출력
				예시) 출력형태 : 1+2+3+......+9+10=55
		 --%>
		<%
				out.println("<h3>");
		
				String str = "";
				int sum2 = 0;
				
				for(int i=1; i<=10; i++){
					if(i==10){
						str +=  i+"=";
					}else{
						str +=  i+"+";
					}
					
					
					sum2 += i;
				}
				out.print(str+sum2);
				out.print("</h3>");
		%>
</body>
</html>