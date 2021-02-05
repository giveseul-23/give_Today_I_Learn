package com.bc.frontcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.command.Command;
import com.bc.model.command.DeptCommand;
import com.bc.model.command.DeptListCommand;
import com.bc.model.command.FullnameCommand;
import com.bc.model.command.FullnameListCommand;
import com.bc.model.command.ListCommand;
import com.bc.model.command.SearchCommand;
import com.bc.model.vo.EmployeeVO;

@WebServlet("/controller")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doGet() 실행!");
		//파라미터 값 확인
		String type=request.getParameter("type");
		System.out.println("> type : "+ type);
		
		Command command = null;
		
		//작업요청에 대한 처리
		if("all".equals(type)) {
			command = new ListCommand();
			String path = command.execute(request, response);
			
			//3. 페이지 전환 - 응답할 페이지(list.jsp)로 포워딩(전환, 위임)
			request.getRequestDispatcher(path).forward(request, response);
			
		}else if("dept".equals(type)) {
			command = new DeptCommand();
			String path = command.execute(request, response);
			
			//dept.jsp 페이지로 응답처리(페이지 이동)
			request.getRequestDispatcher(path).forward(request, response);
		}else if("deptList".equals(type)) {
			command = new DeptListCommand();
			String path = command.execute(request, response);
			
			//4. 응답페이지(deptList.jsp)로 응답 위임처리(request, response 함께 전달)
			request.getRequestDispatcher(path).forward(request, response);
		}else if("fullname".equals(type)) {
			//fullname.jsp 페이지로 응답처리(페이지 전환)
			command = new FullnameCommand();
			String path = command.execute(request, response);
			
			request.getRequestDispatcher(path).forward(request, response);
		}else if("fullnameList".equals(type)) {
			command = new FullnameListCommand();
			String path = command.execute(request, response);
			
			//4. 응답페이지 위임처리
			request.getRequestDispatcher(path).forward(request, response);
		
		}else if("search".equals(type)) {
			command = new SearchCommand();
			String path = command.execute(request, response);
			
			//응답페이지 전환(searchList.jsp)
			request.getRequestDispatcher(path).forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController doPost() 실행!");
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
	
	
}
