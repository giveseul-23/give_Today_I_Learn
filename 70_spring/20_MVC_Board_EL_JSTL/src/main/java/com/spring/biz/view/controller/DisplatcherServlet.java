package com.spring.biz.view.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;
import com.spring.biz.user.UserVO;
import com.spring.biz.user.impl.UserDAO;
import com.spring.biz.view.viewResolver.ViewResolver;

/*@WebServlet("*.do") //web.xml 설정방식으로 변경했기 때문에 주석처리함*/
public class DisplatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HandlerMapping handlerMapping;
	private ViewResolver viewResolver;

	@Override
	public void init() throws ServletException {
		super.init();
		handlerMapping = new HandlerMapping();
		viewResolver = new ViewResolver();
		viewResolver.setPrefix("./"); //위치경로
		viewResolver.setSuffix(".jsp"); //파일타입(확장명)
	}


	public DisplatcherServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		process(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	
	/*
	   그냥 jsp로 가게되면 수정이 업데이트 되어서 보여주지 않기 때문에
	  백단에 처리한 경우에는 .do 로 페이지를 이동시켜야 함
	*/
	private void process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		/* 이전에는 do~메소드 내에 직접 작성했지만 이 안에서 실질적인 처리함 */
		// 요청 처리 작업 진행
		System.out.println(">> DisplatcherServlet : *.do 요청에 대한 처리 진행");
		
		//1. 클라이언트에서 어떤 작업을 요청했는지 확인하기
		String uri = request.getRequestURI(); //요청 uri
		System.out.println("uri : " + uri);
		
		String path = uri.substring(uri.lastIndexOf("/")); ///biz/login.do - > /login.do
		System.out.println("path : " + path);
		
		//2. 클라이언트의 요청형태에 따른 작업처리(컨트롤러)
		Controller ctrl = handlerMapping.getController(path);
		System.out.println(">> ctrl : " +  ctrl); //어떤 컨트롤러인지 확인

		//3. 검색된 컨트롤러 실행(컨트롤러 handleRequest 메소드 호출)
		String viewName = ctrl.handleRequest(request, response);
		System.out.println(">> viewName: " + viewName);

		//4. 이동할 view 이름 확인하고 응답페이지 작성
		String view = null; //최종 요청처리할 URL 값
		if(viewName.contains(".do")){
			view = viewName;
		}else{
			view = viewResolver.getView(viewName);
		}

		System.out.println("> view : " + view);

		//5. 재요청 처리
		response.sendRedirect(view);

	}


}
