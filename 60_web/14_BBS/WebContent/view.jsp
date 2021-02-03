<%@page import="com.bc.mybatis.CommVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.BBSVO"%>
<%@page import="com.bc.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
	전달받은 파라미터 값 사용 DB데이터 조회후 화면 표시 
	1. 게시글 조회수 1증가
	2. 게시글(b_idx) 데이터 조회 후 화면 표시
	3. 게시글(b_idx)에 딸린 댓글이 있으면 화면표시
	
--%>
<%
	//파라미터 값 확인
	String b_idx = request.getParameter("b_idx");
	String cPage = request.getParameter("cPage");
	
	//1. 게시글 조회수 1증가(실습)
	
	//2. 게시글(b_idx) 데이터 조회 후 화면 표시
	BBSVO bvo = DAO.selectOne(b_idx);
	System.out.println(">> view bv : " + bvo);
	
	//3. 게시글(b_idx)에 딸린 댓글이 있으면 화면표시(검색, 찾기)
	List<CommVO> list = DAO.getCommList(b_idx);
	System.out.println("> view commList : " + list);
	
	//EL, JSTL 사용을 위한  scope 상에 속성 등록하고 화면표시
	session.setAttribute("bvo", bvo);
	session.setAttribute("cPage", cPage);
	pageContext.setAttribute("c_list", list); /* 여기서 list는 해당 게시물의 댓글들이라 페이지객체에만 저장하면 됨 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글상세</title>
<script type="text/javascript">
	function modify_go(){
		document.frm.action = "modify.jsp";
		document.frm.submit();
	}
	
	function delete_go(){
		document.frm.action = "delete.jsp";
		document.frm.submit();
	}
	
	function list_go(){
		document.frm.action = "list.jsp";
		document.frm.submit();
	}
</script>
<style type="text/css">
	#bbs table {
		width: 580px;
		margin-left : 10px;
		border-collapse: collapse;
		font-size: 14px;
	}
	#bbs table caption {
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	#bbs table th{
		text-align: center;
		border: 1px solid black;
		padding: 4px 10px;
		background-color: deepskyblue;
	}
	
	#bbs table td {
		text-align: center;
		border: 1px solid black;
		padding: 4px 10px;
	}
</style>
</head>
<body>
	<div id="bbs">
	<%-- 게시글 내용 표시 --%>
	<form method="post" name="frm">
		<table>
			<caption>상세보기</caption>
			<tbody>
				<tr>
					<th>제목</th>
					<td>${bvo.subject }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${bvo.writer }</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<c:if test="${empty bvo.file_name }">
							첨부파일 없음
						</c:if>
						
						<c:if test="${not empty bvo.file_name }">
							<a href="download.jsp?name=${bvo.file_name }">${bvo.file_name }</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${bvo.content }</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="수정" onclick="modify_go()">
						<input type="button" value="삭제" onclick="delete_go()">
						<input type="button" value="목록" onclick="list_go()">
						<input type="hidden" name="cPage" value="${cPage}">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	<hr>
	
<%-- 게시글에 대한 댓글 작성 영역 --%>
<form action="ans_write_ok.jsp" method="post">
	<p>이름 : <input type="text" name="writer">
		비밀번호 : <input type="password" name="pwd"></p>
	<p>내용 : <textarea name="content" rows="4" cols="55"></textarea>
		<% //TODO%>
		<input type="submit" value="댓글저장" style="margin:10px;"> <!-- 실습 -->
		<input type="hidden" name="b_idx" value="${bvo.b_idx }">
	</p>
</form>

<hr>
댓글들
<hr>
<%-- 게시글에 작성된 댓글 표시 영역 --%>
<c:forEach var="commVO" items="${c_list }">
	<div class="comment">
		<form action="ans_del.jsp" method="get">
			<p>이름 : ${commVO.writer }&nbsp; 날짜 : ${commVO.write_date }</p>
			<p>내용 : ${commVO.content }</p>
			<input type="submit" value="댓글삭제">
			<input type="hidden" name="c_idx" value="${commVO.c_idx }">
			<input type="hidden" name="pwd" value="${commVO.pwd}">
			<!-- 댓글 삭제 처리후 게시글 상세페이지 이동시  -->
			<input type="hidden" name="b_idx" value="${commVO.b_idx}">
		</form>
	</div>
	<hr>
</c:forEach>


	</div>
	
</body>
</html>