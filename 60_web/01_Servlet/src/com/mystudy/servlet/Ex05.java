package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sungjuk")
public class Ex05 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String kor = req.getParameter("kor");
		String eng = req.getParameter("eng");
		String math = req.getParameter("math");
		
		int korNumber = Integer.parseInt(kor);
		int engNumber = Integer.parseInt(eng);
		int mathNumber = Integer.parseInt(math);
		
		int result = (korNumber+engNumber+mathNumber);
		double avg = result*100/3/100.00;
		
		//System.out.println(name + kor + eng + math); //확인용
		
		//브라우저쪽으로 응답처리
		resp.setContentType("text/html;charset=utf-8 ");
		PrintWriter out = resp.getWriter();
		
		out.println("<h3>성적처리결과</h3>");
		out.println("<table border>");
		out.println("<tr>");
		out.println("<th>이름</th>");
		out.println("<td>"+name+"</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>국어</th>");
		out.println("<td>"+kor+"</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>영어</th>");
		out.println("<td>"+eng+"</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>수학</th>");
		out.println("<td>"+math+"</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>총점</th>");
		out.println("<td>"+result+"</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<th>평균</th>");
		out.println("<td>" + avg + "</td>");
		out.println("</tr>");
		out.println("</table>");
		
	}
	
}
