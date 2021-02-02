<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습) 전달받은 데이터를 사용해서 DB데이터 수정하고 페이지 전환
	정상수정처리 : onelist.jsp
	예외발생처리 : 예외메시지 표시 후 상세화면(이전페이지) 이동
	 --%>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="guestbookVO2" class="com.bc.mybatis.GuestbookVO"/>
<jsp:setProperty property="*" name="guestbookVO2"/>
<%
	/*
		useBean 액션태그 사용시
		데이터가 로컬변수와 페이지 스코프에 저장되는지 확인
	*/
	System.out.println(guestbookVO2);
	System.out.println(pageContext.getAttribute("guestbookVO2"));
	
	if(guestbookVO2 == pageContext.getAttribute("guestbookVO2")){
		System.out.print("update ok부분  : 같은객체");
	}else{
		System.out.print("update ok부분  : 다른객체");
	}
	
	SqlSession ss = DBService.getFactory().openSession();
	try{
		ss.update("guestbook.update", guestbookVO2);
		ss.commit();
		
		//화면전환 - 정상처리되 경우
		response.sendRedirect("onelist.jsp?idx="+guestbookVO2.getIdx());
		%>
<%-- 		<script type="text/javascript">
			alert("수정완료. 상세페이지로 이동합니다.");
			/* 이 부분 주의하기 onelist페이지에서 idx를 받기때문에 파라미터로 보내줘야 함 */
			location.href="onelist.jsp?idx="+<%=guestbookVO2.getIdx() %>;
		</script> --%>
		<%
	}catch(Exception e){
		%>
		<script type="text/javascript">
			alert("[예외발생] 수정되지 않았습니다.");
			history.go(-2); //이전페이지 : 수정페이지, 그전페이지 : onelist.jsp페이지
		</script>
		<%
	}finally{
		ss.close();
	}
	
%>