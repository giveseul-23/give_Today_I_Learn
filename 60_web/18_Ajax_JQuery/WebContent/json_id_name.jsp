<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX jQuery</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		/*
			jQeury Ajax 사용
			$.ajax({url, type, data, dataType});
			url: 서버 url(jsp, php, asp);
			type : get, post
			data : 서버쪽으로 전송되는 데이터
			dataType : 응답결과의 데이터 형태(xml, html, json, text, script...)
			success : 성공한 경우 실행할 콜백함수 작성
			error : 실패한 경우
		*/
		$("#getDataBtn").click(function(){
			alert("#getDataBtn 버튼 클릭~");
			//아이디, 패스워드로 로그인 요청하고 성공하면 아이디, 이름 받기
			$.ajax("getIdName",{
				type : "get",
				data : "id=hong&pwd=1234",
				dataType : "json",
				success : function(result){
					alert(">> JSON 받기 성공");
					alert("전달받은 결과값 : " + result + "\n"
							+"문자열로 표시 : " + JSON.stringify(result));
					var output ="";
					
					output += "<h2>" + result.id + "</h2>";
					output += "<h2>" + result["name"] + "</h2>";
					
					//HTML 출력 영역에 표시
					$("#dataDisp").html(output);
				},
				error : function(){
					alert(">> [예외발생] Ajax 처리실패\n"
							+ "jqXHR.readyState : " + jqXHR.readyState
							+ "\n testStatus : " +  testStatus
							+"\n ");
				}
			});
		});
	})
</script>
</head>
<body>
	<h1>(jQuery) Ajax JSON 요청처리</h1>
	<button id="getDataBtn">JSON 데이터 가져오기(id, name)</button>
	<hr>
	<div id="dataDisp">가져온 데이터 출력될 영역</div>
	<hr>
	<div>위쪽영역에 Ajax 에 의해 가져온 데이터 표시</div>
</body>
</html>