package com.newlec.servlet.study;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hi")
public class Nana extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Nana() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		String cnt = req.getParameter("cnt");

		int cntNum = 100; //기본값
		if(cnt != null && !cnt.equals("")){ //파라미터를 비운 채로 주거나 null 값으로 준 경우
			cntNum = Integer.parseInt(cnt);
		}

		for(int i=0; i<cntNum; i++){
			out.println((i+1) + ": 안녕 Servlet!!<br>");	
		} 
	}

    
}
