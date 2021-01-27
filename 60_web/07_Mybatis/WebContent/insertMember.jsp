<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.mystudy.mybatis.DBService"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값을 DB에 입력하고 화면이동
	1. 파라미터 값을 MemberVO 타입의 객체(memberVO)에 저장
	2. mapper에 memberVO 전달해서 입력처리
	3. 페이지 전환	
		정상처리 : selectAll.jsp
		예외발생 : error.jsp
--%>
	<jsp:useBean id="memberVO" class="com.mystudy.mybatis.MemberVO" />
	<jsp:setProperty property="*" name="memberVO"/>	
<%
	System.out.println("memberVO : " + memberVO);

	SqlSession ss = DBService.getFactory().openSession(); //오토커밋 아닌 상태 - 실제로 저장되지 않음 커밋해줘야 함
	
	try{
		int result = ss.insert("member.insertMember", memberVO);
		System.out.println("result : " + result);
		ss.commit(); // 명시적 커밋처리
		//화면이동
		response.sendRedirect("selectAll.jsp");
	}catch(Exception e){
		e.printStackTrace();
		ss.rollback();
		//화면이동
		response.sendRedirect("error.jsp");
	}finally{
		System.out.println(">>finally는 언제나 실행");
		ss.close(); //자원반납
	}
	
	//이 구문은 화면이동시 실행 안될 수 있음
	System.out.println("끝");
	
%>