<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	선택된 데이터 삭제 처리(파라미터 pwd값과 session 데이터 사용)
	전달받은 파라미터 pwd와 session에 저장된 VO객체의 pwd 값을 비교
	- 일치하면 : 삭제 후 목록 페이지로 이동(list.jsp), 삭제 메시지 표시
	- 불일치하면 : 이전페이지로 이동(암호불일치 메시지 표시)
--%>
<% 
	GuestbookVO vo = (GuestbookVO)session.getAttribute("guestbookVO");

	String checkpwd = request.getParameter("pwd");
	String originpwd = vo.getPwd();
	
	SqlSession ss = DBService.getFactory().openSession();
	
	//암호 일치여부 확인
	if(!checkpwd.trim().equals(originpwd)){ //암호불일치
		%>
		<script type="text/javascript">
			alert("암호불일치, 이전페이지로 이동합니다.");
			history.back();
		</script>
		<%
		return; //뒤에문장이 더이상 실행될 필요 x
	}else{
		try{ //암호가 일치하는 경우 : 삭제처리
			ss.delete("guestbook.delete", vo.getIdx());
			ss.commit();
			%>
			<script type="text/javascript">
				alert("삭제성공. 상세페이지로 이동합니다.");
				location.href="list.jsp";
			</script>
			<%
		}catch(Exception e){
			%>
			<script type="text/javascript">
				alert("[예외발생] 관리자에게 문의하세요.");
				location.href="list.jsp";
			</script>
			<%
		}finally{
			ss.close();
		}
	}
%>