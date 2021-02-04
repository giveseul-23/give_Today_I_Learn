<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	전달받은 데이터를 사용해서 화면에 표시하고 수정 후 수정요청 처리
	암호가 일치하면 : 수정요청 처리(DB 연동작업) - modify_ok.jsp
	암호가 일치하지 않으면 : 암호확인 메세지 표시
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function modify_ok(){
		var frm = document.frm.elements;
	    
	    for(var i=0; i<frm.length; i++){
	        if(frm[i].value.trim() == ""){
	        	if(frm[3].value == "") continue; /* 파일은 비어있을시 허용 */
	            alert("내용을 모두 입력 해 주세요.");
	            frm[i].focus();
	            return false;
	        }
	        
	        /* 암호일치 여부 */
	        if(frm[4].value.trim() != '${bvo.pwd}'){
	           alert("비밀번호가 맞지 않습니다. 확인해 주세요.");
	            frm[4].focus();
	            return false;
	        }
	    }
	
		document.frm.action="modify_ok.jsp";
		document.frm.submit();
	}
	
	function list_go(){
		location.href="list.jsp?cPage=${cPage}"
	}
</script>
</head>
<body>
	<form name="frm" method="post" enctype="multipart/form-data">
		<h2 style="text-align:center;">게시글 수정</h2>
		<table>
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject" value="${bvo.subject }"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" value="${bvo.writer }"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="5" cols="50" name="content">${bvo.content }</textarea></td>
				</tr>
				<tr>
					<th>파일</th>
					<td><input type="file" name="file_name">${bvo.file_name }</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="password" name="pwd"></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td style="padding-top:10px;" colspan="2">
						<input type="button" value="저장" onclick="modify_ok()">
						<input type="reset" value="다시작성">
						<input type="button" value="목록" onclick="list_go()">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>