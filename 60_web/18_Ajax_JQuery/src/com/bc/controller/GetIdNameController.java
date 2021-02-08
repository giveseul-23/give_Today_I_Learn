package com.bc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getIdName")
public class GetIdNameController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		System.out.println("id : " + id + ", pwd : " + pwd);
		
		//DB 연동해서 로그인 확인 후 성공시 아이디, 이름 리턴
		//JSON 형태 값으로 응답처리
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		//{"id":"admin", "name":"관리자"}
		String result ="{\"id\":\"hong\", \"name\":\"홍길동\"}";
		out.print(result);
	}
	
}
