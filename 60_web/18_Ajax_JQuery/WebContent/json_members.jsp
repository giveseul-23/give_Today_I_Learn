<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax json</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#getDataBtn").click(getJsonMembers);
	});
	function getJsonMembers(){
		alert("#getDataBtn 클릭!!");
		//$.ajax(url,{설정값들});  
		$.ajax("getJsonMembers", {
			//url : "getJsonMembers",
			type : "get",
			dateType : "json", //응답되는 데이터 형식
			success : function(data){
				console.log(data);
				alert("Ajax처리 성공!");
				var output = "";
				var alist = data.list; //JSON객체의 속성명 "list"의 값 추출(data.list는 배열임)
				$.each(alist, function(index, member){
					/* this는 현재 넘어온 alist의 객체 한개, 
						member는 그 this가 가리키는 객체
						지금여기서 this와 member는 같은 의미임
						그래서 this를 사용한다면 파라미터 member가 굳이 필요없음(index도 동일)
						- index를 사용하려면 alist[index].idx 이렇게 사용해야 함(따로 딱 인덱스값이 정해져서 데이터를 사용할때만 필요함)
					*/
					output += "<tr>";
					output += "<td>"+this.idx+"</td>";
					output += "<td>"+this.name+"</td>";
					output += "<td>"+this["age"]+"</td>";
					output += "<td>"+member["addr"]+"</td>";
					output += "<td>"+member.regdate+"</td>";
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
	<h1>Ajax JSON 데이터 요청처리</h1>
	<button id="getDataBtn">JSON 데이터 가져오기</button>
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