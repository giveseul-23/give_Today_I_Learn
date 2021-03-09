package com.spring.biz.view.User;

import com.spring.biz.user.UserVO;
import com.spring.biz.user.impl.UserDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
//spring에서 제공하는 컨트롤러
import org.springframework.web.servlet.mvc.Controller;

public class LoginController implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
        System.out.println(">> 로그인 처리");

        //1. 사용자 입력 데이터 확인(추출)
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        //2. DB연동작업(id, password 유무 확인)
        UserVO vo = new UserVO();
        vo.setId(id);
        vo.setPassword(password);

        UserDAO userDAO = new UserDAO();
        UserVO user = userDAO.getUser(vo);

        //3. 화면 네비게이션(화면이동)
        //로그인 성공 : 게시글 보여주기 - getBoardList.jsp
        //로그인 실패 : 로그인화면으로 이동 - login.jsp
        ModelAndView mav = new ModelAndView();
        if (user != null) { //사용자 정보가 있는 경우
            System.out.println("> 로그인 성공!!!");
            //returnStr = "getBoardList.do";
            mav.setViewName("getBoardList.do");
        } else {
            System.out.println("> 로그인 실패!!!");
            //returnStr = "login";
            mav.setViewName("login.jsp"); //뷰리졸버 사용하지 않는 경우
        }
        
        
        return mav;
    }
}
