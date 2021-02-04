<%@page import="com.bc.mybatis.DAO"%>
<%@page import="com.bc.mybatis.BBSVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 사용해서 DB데이터 수정후 상세페이지로 이동 --%>
<%
	request.setCharacterEncoding("utf-8");

	//파일 저장위치
	String path = "C:/git_gitTIL/temp";
	
	MultipartRequest mr = new MultipartRequest(
			request, path, 10 * 1024 * 1024,
			"utf-8", new DefaultFileRenamePolicy()
	);
	
	//사용할 데이터 준비
	BBSVO bvo = (BBSVO)session.getAttribute("bvo");
	
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
	
	//DB에 수정 처리
	DAO.update(bvo);
	
	//화면전환(상세페이지로 이동)
	response.sendRedirect("view.jsp?b_idx="+bvo.getB_idx()+"&cPage="+session.getAttribute("cPage"));
%>