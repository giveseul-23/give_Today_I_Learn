package com.bc.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

public class NameListCommon extends NameCommon{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		List<EmployeeVO> list = DAO.getNameList(name);
		request.setAttribute("list", list);
		
		return "nameList.jsp";
	}
	
}
