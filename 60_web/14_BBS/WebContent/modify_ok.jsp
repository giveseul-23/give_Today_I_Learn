<%@page import="com.bc.mybatis.DAO"%>
<%@page import="com.bc.mybatis.BBSVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//파일 저장위치
	String path = "C:/git_gitTIL/temp";
	
	MultipartRequest mr = new MultipartRequest(
			request, path, 10 * 1024 * 1024,
			"utf-8", new DefaultFileRenamePolicy()
	);
	
	//전달받은 데이터 VO에 저장후 DB에 입력처리(DB연동 작업)
	BBSVO bvo = (BBSVO)session.getAttribute("bvo");
	System.out.println("modify : "+bvo);
	
	bvo.setSubject(mr.getParameter("subject"));
	bvo.setWriter(mr.getParameter("writer"));
	bvo.setContent(mr.getParameter("content"));
	
	bvo.setIp(request.getRemoteAddr());
	
	//첨부파일 처리
	if(mr.getFile("file_name") != null){
		bvo.setFile_name(mr.getFilesystemName("file-name"));
		bvo.setOri_name(mr.getOriginalFileName("file-name"));
	}else{
		bvo.setFile_name("");
		bvo.setOri_name("");
	}
	
	//DB에 입력(저장) 처리
	DAO.update(bvo);
	
	//화면전환(목록페이지로 이동)
	response.sendRedirect("list.jsp");
%>