package com.spring.biz.view.controller;

import com.spring.biz.view.User.LoginController;
import com.spring.biz.view.User.LogoutController;
import com.spring.biz.view.board.*;

import java.util.HashMap;
import java.util.Map;

/*
     HandlerMapping -> 요청정보와 처리할 컨트롤러를 연결하는 정보 저장
     DisplatcherServlet 의 init() 호출시 생성
*/
public class HandlerMapping {
    //String 은 key값을 요청명으로 하기 위함
    private Map<String, Controller> mappings;

    public HandlerMapping(){
        //컨트롤러 객체 생성해서 요청과 매칭시키기
        mappings = new HashMap<>();
        mappings.put("/login.do", new LoginController());
        mappings.put("/logout.do", new LogoutController());
        mappings.put("/getBoardList.do", new GetBoardListController());
        mappings.put("/getBoard.do", new getBoardController());
        mappings.put("/insertBoard.do", new InsertBoardController());
        mappings.put("/updateBoard.do", new updateBoardController());
        mappings.put("/deleteBoard.do", new deleteBoardController());

    }

    public Controller getController(String path){
        /* 경로인 path 가 이동할 페이지 주소(ex_~.do) */
        /* 리턴값은 path 값에 따른 controller */
        return mappings.get(path);
    }

}
