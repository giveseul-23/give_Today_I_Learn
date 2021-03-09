package com.spring.biz.view.board;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;
import com.spring.biz.user.UserVO;
import com.spring.biz.user.impl.UserDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
public class GetBoardListController{
	
	@RequestMapping("/getBoardList.do")
	public ModelAndView getBoardList(BoardDAO boardDAO, ModelAndView mav) {
		System.out.println(">> 게시글 전체목록 보여주기 - getBoardList()");
		
		List<BoardVO> boardList = boardDAO.getBoardList();
		
        mav.addObject("boardList", boardList); 
        mav.setViewName("getBoardList.jsp"); 
        
        return mav;
	}
	
	/*
	//이제 사용되지 않는 코드임(참고용)
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {

        System.out.println(">> 게시글 전체목록 보여주기");

        //1. 게시글 목록 조회(SELECT)
        BoardDAO boardDAO = new BoardDAO();
        List<BoardVO> boardList = boardDAO.getBoardList();

        //2. 검색결과를 세션에 저장
        //request.getSession().setAttribute("boardList", boardList);

        //3. ModelAndView 형식으로 데이터 저장 및 뷰 이름 저장
        ModelAndView mav = new ModelAndView();
        mav.addObject("boardList", boardList); //뷰에 사용할 데이터 저장
        mav.setViewName("getBoardList"); //뷰리졸버 적용됨(redirect: 를 앞에 붙이면 뷰리졸버가 적용되지 않음)
        
        return mav;
    }
    */
}
