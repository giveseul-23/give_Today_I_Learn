package com.bc.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

public class DeptListCommon extends DeptCommon {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String deptno = request.getParameter("deptno");
		List<EmployeeVO> list = DAO.getDeptList(deptno);
		request.setAttribute("list", list);
		
		return "deptList.jsp";
	}
	
}
