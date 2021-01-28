<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 파일 업로드 처리하고 파일 정보를 화면에 표시 --%>
<% 
	//한글처리 utf-8설정
	request.setCharacterEncoding("UTF-8");


	/*
		form 태그에 enctype="multipart/form-data" 설정하면 
		request 객체를 통한 파라미터 값이 조회되지 않는다.
	*/
	//파라미터 값 확인 - enctype="multipart/form-data" 설정때문에 값 조회 안됨
	String name = request.getParameter("name");
	System.out.println(name);
	
	//파일을 저장할 경로(위치)
	
	String path = this.getServletContext().getRealPath("/upload");
	System.out.println(path);
	
	MultipartRequest mr = new MultipartRequest(request, //요청객체
												path, //실제 파일을 저장할 경로
												10 * 1024 * 1024, //업로드 파일의 최대크기(byte단위)
												"UTF-8", //인코딩 형식
												new DefaultFileRenamePolicy() //파일명 중복시 새로운 이름 생성 사용
												);
	/*
		MultipartRequest 주요 메서드
		getParameter(문자열) : 파라미터값 추출
		getOriginalFileName(문자열) : 업로드시 사용된 원본파일명
		getFilesystemName(문자열) : 업로드시 저장된 파일명(실제 물리적으로)
		getContentType(문자열) : 업로드 된 파일타입 형식		
	*/
%>

	<h1>파일업로드 결과보기</h1>
	<h2>올린사람(name) : <%=mr.getParameter("name") %></h2>
	<h2>제목(title) : <%=mr.getParameter("title") %></h2>
	<h2>파일(f_name) : <%=mr.getParameter("f_name") %></h2> <!-- null값 뜸 , 이 메소드로는 검색안됨 -->
	<h2>원본파일명 : <%=mr.getOriginalFileName("f_name") %></h2>
	<h2>저장된파일명 : <%=mr.getFilesystemName("f_name") %></h2>
	<h2>파일타입: <%=mr.getContentType("f_name") %></h2>
	<hr>
	
<%
	//파일 가지고 오기
	File file = mr.getFile("f_name");
	out.println("<h2>파일이름 : "+file.getName()+"</h2>");
	out.println("<h2>파일크기 : "+file.length()+"</h2>");
%>

	<!-- 다운로드 링크 연결  -->
	<a href="download.jsp?path=upload&name=<%=mr.getFilesystemName("f_name") %>">
		다운로드할 파일(<%=mr.getOriginalFileName("f_name") %>)</a>
	
	
	
	