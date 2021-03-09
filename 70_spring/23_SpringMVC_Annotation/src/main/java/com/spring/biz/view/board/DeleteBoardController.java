package com.spring.biz.view.board;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;

@Controller
public class DeleteBoardController{
	
	@RequestMapping("/deleteBoard.do")
	public String DeleteBoard(BoardVO vo, BoardDAO dao) {
		System.out.println(">> 게시글 삭제처리 - DeleteBoard()");

        dao.deleteBoard(vo);
        
        return "getBoardList.do";
	}
    
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
        System.out.println(">> 게시글 삭제처리");

        //1. 전달받은 파라미터 값 추출(확인)
        //request.setCharacterEncoding("UTF-8");
        String seq = request.getParameter("seq");
        String title = request.getParameter("title");
        String writer = request.getParameter("writer");
        String content = request.getParameter("content");

        //2. 업무처리 - DB 연동작업(게시글 수정)
        BoardVO vo = new BoardVO();
        vo.setSeq(Integer.parseInt(seq));

        BoardDAO dao = new BoardDAO();
        dao.deleteBoard(vo);

        //3. 화면 네비게이션(목록 페이지로)
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:getBoardList.do");//뷰리졸버 적용안함(재요청)
        
        return mav;
    }
}
