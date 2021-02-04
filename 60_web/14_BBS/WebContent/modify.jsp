<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	        
	        if(frm[4].value.trim() != ${bvo.pwd}){
	           alert("비밀번호가 맞지 않습니다. 확인해 주세요.");
	            frm[4].focus();
	            return false;
	        }
	    }
	
		document.frm.action="modify_ok.jsp";
		document.frm.submit();
	}
</script>
</head>
<body>
	<form name="frm" method="get">
		<h2 style="text-align:center;">게시글 수정</h2>
		<table>
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="5" cols="50" name="content"></textarea></td>
				</tr>
				<tr>
					<th>파일</th>
					<td><input type="file" name="file_name"></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="password" name="pwd"></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td style="padding-top:10px;">
						<input type="button" value="저장" onclick="modify_ok()">
						<input type="reset" value="다시작성">
						<input type="button" value="목록" onclick="javascript:location.href='list.jsp'">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>