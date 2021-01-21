package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/today")
public class Ex02 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(">> Ex02 doGet() 실행");
		//한글깨짐 방지를 위한 문자타입 처리(UTF-8)
		resp.setContentType("text/html;charset=UTF-8"); //해당 구문을 넣어줘야 한글깨짐 현상이 일어나지 않음
		//resp.getWriter().print("<h1>오늘 날짜는?</h1>");
		
		PrintWriter out = resp.getWriter();
		// 서블릿은 자바코드 내에 html 문서를 작성하는 방식임
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8''>");
		out.println("<tilte>~오늘 날짜~</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>오늘 날짜는?</h1>");
		out.println("<h3>오늘 날짜는 "+"입니다.</h3>");
		out.println("</body>");
		out.println("</html>");
	}
	
}
