package com.spring.biz.view.User;

import com.spring.biz.user.UserVO;
import com.spring.biz.user.impl.UserDAO;
import com.spring.biz.view.controller.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginController implements Controller {

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
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
        String returnStr = "";
        if (user != null) { //사용자 정보가 있는 경우
            System.out.println("> 로그인 성공!!!");
            /*
                getBoardList.jsp 가 아닌 getBoardList.do 는 것은
                컨트롤러를 타기 위함
            */
            //response.sendRedirect("getBoardList.do");
            returnStr = "getBoardList.do";
        } else {
            System.out.println("> 로그인 실패!!!");
            //response.sendRedirect("login.jsp");
            // DisplatcherServlet 에서 ViewResolver로 갈때 확장자명을 붙여줌
            returnStr = "login";
        }
        
        /* .do 가 있는지 없는지 여부에 따라 viewResolver 로 가는지 안가는지를 판가름함
            .do (x) ->  viewResolver 감
            .do (o) -> viewResolver 안감
            해당 처리는 DisplatcherServlet 에서 함
        */
        
        return returnStr;
    }
}
