package com.bc.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

public class SearchCommon implements Common {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		String path ="";
		
		if(keyword == null || keyword.trim().equals("")) {
			path = "search.jsp";
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
			
			path = "searchList.jsp";
		}
		
			return path; 

	}
	
}
