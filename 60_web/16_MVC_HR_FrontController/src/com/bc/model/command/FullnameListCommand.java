package com.bc.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

public class FullnameListCommand extends FullnameCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1. 파라미터 값 추출
		String fullname = request.getParameter("fullname");
		//2. DAO 사용 데이터 조회
		List<EmployeeVO> list = DAO.getFullname(fullname);
		//3. 조회된 데이터 request객체에 저장
		request.setAttribute("nameList", list);
		
		return "fullnameList.jsp";
	}
	
}
