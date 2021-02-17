package com.bc.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.SelectDAO;
import com.bc.model.vo.MemberVO;

public class LoginCommand implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String path = "";
		System.out.println("id: " + id + ", password: " + password);
		
		SelectDAO.login(id, password);
		
		return "mainpage.jsp"; //메인페이지
	}
	
}
