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

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

@WebServlet("/frontcontroller")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		
		System.out.println(type);
		
		List<EmployeeVO> list;
		
		if("all".equals(type)) {
			list = DAO.getAllList();
			request.setAttribute("list", list);
			request.getRequestDispatcher("allList.jsp").forward(request, response);
			
		}else if("dept".equals(type)) {
			request.getRequestDispatcher("dept.jsp").forward(request, response);
			
		}else if("deptList".equals(type)) {
			System.out.println("FrontController deptList 실행중" );
			String deptno = request.getParameter("deptno");
			list = DAO.getDeptList(deptno);
			request.setAttribute("list", list);
			request.getRequestDispatcher("deptList.jsp").forward(request, response);
			
		}else if("name".equals(type)) {
			request.getRequestDispatcher("name.jsp").forward(request, response);
			  
		}else if("nameList".equals(type)) {
			String name = request.getParameter("name");
			list = DAO.getNameList(name);
			request.setAttribute("list", list);
			request.getRequestDispatcher("nameList.jsp").forward(request, response);
			
		}else if("search".equals(type)) {
			String idx = request.getParameter("idx");
			String keyword = request.getParameter("keyword");
			
			if(keyword == null || keyword.trim().equals("")) {
				//입력칸이 빈 경우
				request.getRequestDispatcher("search.jsp").forward(request, response);
			}else {
				Map<String, String> map = new HashMap<String, String>();
				map.put("idx", idx);
				map.put("keyword", keyword);
				
				String title = "";
				switch (idx) {
					case "0": {
						title = "사번";
						break;
					}
					case "1": {
						title = "이름";
						break;
					}
					case "2": {
						title = "직종";
						break;
					}
					case "3": {
						title = "부서";
						break;
					}
				}
				
				list = DAO.getSearchList(map);
				
				request.setAttribute("title", title);
				request.setAttribute("list", list);
				
				request.getRequestDispatcher("searchList.jsp").forward(request, response);
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
