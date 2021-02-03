<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터 사용해서 파일 다운로드 처리 --%>
<% 
	//한글처리
	request.setCharacterEncoding("UTF-8");
	
	//전달받은 파라미터 값 추출
	String path = "C:/git_gitTIL/temp";
	String filename = request.getParameter("name");
	System.out.println("> path : " + path);
	System.out.println("> filename(파일명) : " + filename);
	
	//실제 파일이 저장된 경로 확인
	String realPath = this.getServletContext().getRealPath(path);
	System.out.println("realPath(파일저장위치) : " + realPath);
	
	//다운로드 받을 수 있도록 클라이언트 응답문서타입 변경
	response.setContentType("application/x-msdownload");
	
	//클라이언트 헤더정보를 첨부파일이 있는 것으로 변경
	response.setHeader("Content-Disposition", "attachment;filename=" + filename);
	
	/*
		실제 파일을 읽고 쓰기 작업
		물리적으로 실제 파일을 복사하는 작업 구현(바이트계열 처리)
		원본파일에서 읽고(input) 대상파일에 쓰기(output)
	*/
	
	File file= new File(realPath + "/" + filename);
	FileInputStream fis = null;
	BufferedInputStream bis = null;
	
	BufferedOutputStream bos = null;
	if(file.isFile()){ //속성이 파일인지 여부
		try{
			//파일을 읽기 위한 객체 생성
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis); 
			
			//파일에 쓰기 위한 객체 생성
			bos = new BufferedOutputStream(response.getOutputStream());  
			
			//파일로부터 읽고 쓰기
			int readValue = bis.read(); // -1이면 읽는 부분에 끝부분
			/* readValue == -1 : 읽을 값이 없다는 의미 */
			while(readValue != -1){
				bos.write(readValue); //읽고
				readValue = bis.read(); //쓰고
				//읽고 쓰고가 반복됨
			}
			bos.flush(); 
			
			//JSP 출력스트림과 서블릿 출력스트림이 겹쳐서 발생하는 오류 해결
			out.clear();
			out = pageContext.pushBody();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			bos.close();
			bis.close();
		}
	}
%>