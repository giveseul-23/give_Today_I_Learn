<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax XML</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#getDataBtn").click(getXmlMembers);
	});
	function getXmlMembers(){
		alert("#getXmlMembers() 클릭!!");
		
		$.ajax("getXmlMembers", {
			type : "get",
			dateType : "xml", //응답되는 데이터 형식
			success : function(xmlData){
				console.log(xmlData);
				
				var output = "";
				//전달받은 XML 데이터 처리
				$(xmlData).find("member").each(function(){
					output += "<tr>";
					output += "<td>"+$(this).find("idx").text()+"</td>"; /* member객체의 idx태그의 텍스트값 */
					output += "<td>"+$(this).find("name").text()+"</td>";
					output += "<td>"+$(this).find("age").text()+"</td>";
					output += "<td>"+$(this).find("addr").text()+"</td>";
					output += "<td>"+$(this).find("regdate").text()+"</td>";
					output += "</tr>";
				});
				
				$("#tbody").html(output);
			},
			error : function(){
				alert(">> [예외발생] Ajax 처리실패");
			}
			
		});
	};
</script>
</head>
<body>
	<h1>Ajax XML 데이터 요청처리</h1>
	<button id="getDataBtn">XML 데이터 가져오기</button>
	<hr>
	<table border>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody id="tbody">
			<tr>
				<td>1</td>
				<td>홍길동1</td>
				<td>27</td>
				<td>서울</td>
				<td>2021-02-08</td>
			</tr>
			<tr>
				<td>2</td>
				<td>홍길동2</td>
				<td>37</td>
				<td>대전</td>
				<td>2021-02-08</td>
			</tr>
		</tbody>
	</table>
</body>
</html>