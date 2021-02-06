package com.bc.controller;

import java.io.IOException;
import java.util.List;

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
		
		System.out.println("idx : "+idx+" keyword : "+keyword);
		
		if(keyword == null || "".equals(keyword)) {
			//search.jsp 이동
			request.getRequestDispatcher("search.jsp").forward(request, response);
		}else { //검색값이 입력되었으니 DB에서 검색처리
			List<EmployeeVO> list = DAO.getSearch(idx, keyword);
			System.out.println(">> 동적 검색결과 : " + list);
			
			//동적검색 형태 확인
			String title ="";
			switch (idx) {
				case "0": title = "사번"; break;
				case "1": title = "이름"; break;
				case "2": title = "직종"; break;
				case "3": title = "부서"; break;
			}
			
			//동적검색 결과 응답페이지로 전달
			request.setAttribute("list", list);
			request.setAttribute("title", title);
			
			//응답페이지 전환(searchList.jsp)
			request.getRequestDispatcher("searchList.jsp").forward(request, response);
			
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
