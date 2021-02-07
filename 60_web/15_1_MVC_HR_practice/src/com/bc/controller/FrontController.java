package com.bc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.common.Common;
import com.bc.common.DeptCommon;
import com.bc.common.DeptListCommon;
import com.bc.common.NameCommon;
import com.bc.common.NameListCommon;
import com.bc.common.SearchCommon;
import com.bc.common.allListCommon;
import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

@WebServlet("/frontcontroller")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		
		System.out.println(type);
		
		String path = ""; 
		Common comm;
		
		if("all".equals(type)) {
			comm = new allListCommon();
			path = comm.execute(request, response);
			
			request.getRequestDispatcher(path).forward(request, response);
			
		}else if("dept".equals(type)) {
			comm = new DeptCommon();
			path = comm.execute(request, response);
			request.getRequestDispatcher(path).forward(request, response);
			
		}else if("deptList".equals(type)) {
			comm = new DeptListCommon();
			path = comm.execute(request, response);
			request.getRequestDispatcher(path).forward(request, response);
			
		}else if("name".equals(type)) {
			comm = new NameCommon();
			path = comm.execute(request, response);
			request.getRequestDispatcher(path).forward(request, response);
			  
		}else if("nameList".equals(type)) {
			comm = new NameListCommon();
			path = comm.execute(request, response);
			request.getRequestDispatcher(path).forward(request, response);
			
		}else if("search".equals(type)) {
			comm = new SearchCommon();
			path = comm.execute(request, response);
			request.getRequestDispatcher(path).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
