<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script type="text/javascript">
	function list_go(){
		location.href = "list.jsp";
	}
	
	function sendData(){
		//alert(">> sendData() 시작");
		var firstForm = document.forms[0];
		for(var i=0; i<firstForm.elements.length; i++){
			console.log(firstForm.elements[i]);
			if(firstForm.elements[i].value.trim() == ""){
				if(i == 3) continue;	/* 파일은 해당 조건에서 제외 (파일은 옵션임) */
				alert(firstForm.elements[i].title + " 입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}
</script>
</head>
<body>
	<div id="bbs">
		<form action="write_ok.jsp" method="post" enctype="multipart/form-data">
			<table>
				<caption>게시판 글쓰기</caption>
				<tbody>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="subject" size="45" title="제목">
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" name="writer" size="12" title="작성자">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="8" cols="50" name="content" title="내용"></textarea>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input type="file" name="file_name">
						</td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td>
							<input type="password" name="pwd" size="12" title="패스워드">
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="저장" onclick="sendData()">
							<input type="reset" value="다시작성">
							<input type="button" value="목록" onclick="list_go()">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>