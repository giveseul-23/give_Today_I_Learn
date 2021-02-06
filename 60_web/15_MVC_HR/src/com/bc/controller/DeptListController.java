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

@WebServlet("/deptList")
public class DeptListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//전달받은 부서코드로 DB데이터 조회 후 deptList.jsp 응답처리(위임처리)
		//1. 전달받은 파라미터 값(부서코드 : deptno) 추출
		String deptno = req.getParameter("deptno");
		
		//2. DB에서 해당부서(deptno)에 있는 직원 조회(DAO)
		List<EmployeeVO> list = DAO.getE_List(deptno);
		
		//3. 조회된 데이터를 응답페이지(deptList.jsp)에서 사용할 수 있게 저장 전달
		req.setAttribute("e_list", list);
		
		//4. 응답페이지(deptList.jsp)로 응답 위임처리(request, response 함께 전달)
		req.getRequestDispatcher("deptList.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		doGet(req,resp);
	}
	
}