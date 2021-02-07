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

@WebServlet("/search")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			
			List<EmployeeVO> list = DAO.getSearchList(map);
			
			request.setAttribute("title", title);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("searchList.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
