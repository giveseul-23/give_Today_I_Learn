package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class Ex04 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//request 객체로 부터 파라미터 값 추출
		//1. getParameter(파라미터명) : "하나"의 파라미터 값 추출(사용)
		//2. getParameterValues(파라미터명) : "배열" 혈태 값 추출(체크박스 등과 같은 것)
		//3. getParameterMap() : 파라미터 값을 map 형태로 추출
		//기타 getParameterNames() : 파라미터명 확인시 사용
		//----------------------------------
		
		//전달받은 회원가입 정보를 추출해서 회원가입 정보 작성후 응답하기
		//요청정보 추출
		String name = req.getParameter("name");
		System.out.println("name : " + name);
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String email = req.getParameter("email");
		
		//취미값 추출
		//null 또는 하나만 검색
		//String hobby = req.getParameter("hobby"); //checkbox는 여러개 체크가 가능하기 때문에 value로 가져와야 함
		String hobby[] = req.getParameterValues("hobby");
		
		//서버 콘솔에 출력
		System.out.println("--------------------------");
		System.out.println("name : " + name);
		System.out.println("id : " + id);
		System.out.println("pwd : " + pwd);
		System.out.println("email : " + email);
		System.out.println("hobby : " + Arrays.toString(hobby));
		
		//-------------------------
		//클라이언트(브라우저) 쪽으로 응답처리
		resp.setContentType(" text/html;charset=utf-8 ");
		PrintWriter out = resp.getWriter();
		out.println("<h2>회원가입정보</h2>");
		out.println("<ul>");
		out.println("<li> 이름 : " + name + "</li>");
		out.println("<li> 아이디 : " + id + "</li>");
		out.println("<li> 비밀번호 : " + pwd + "</li>");
		out.println("<li> 이메일 : " + email + "</li>");
		out.println("<li>취미 : ");
		if(hobby == null) {
			out.println("선택사항 없음");
		}else {
			for (String h : hobby) {
				out.println(h + "&nbsp;&nbsp;");
			}
		}
		out.println("</li>");
		out.println("</ul>");
		
		
		//------------------------------
		//3. getParameterMap() : 파라미터 값을 map 형태로 추출
		Map<String, String[]> paramMap = req.getParameterMap();
		String[] names = paramMap.get("name");
		String[] hobby2 = paramMap.get("hobby");
		
		out.println("<h3>파라미터를 map 형식으로 받아서 처리</h3>");
		out.println("<ol>");
		out.println("<li>이름 : " + names[0] +"</li>");
		out.println("<li>취미 : ");
		if(hobby2 == null) {
			out.println("선택사항 없음");
		}else {
			for (String h : hobby2) {
				out.println(h + "&nbsp;&nbsp;");
			}
		}
		out.println("</li>");
		out.println("</ol>");
		out.println("<hr>");
		
		//-------------------------
		//기타 getParameterNames() : 파라미터명 확인시 사용
		out.println("<h3>넘겨받은 파라미터명</h3>");
		Enumeration<String> paramNames = req.getParameterNames();
		out.println("<p>");
		while(paramNames.hasMoreElements()) {
			out.println(paramNames.nextElement() + "  ");
		}
		out.println("</p>");
		out.println("<hr>");
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">> doPost() 실행");
		req.setCharacterEncoding("utf-8");
		doGet(req,resp);
	}
	
	
	
}
