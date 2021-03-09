package com.spring.biz.view.board;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class UpdateBoardController implements Controller {

    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) {
        System.out.println(">> 게시글 수정처리");

        //1. 전달받은 파라미터 값 추출(확인)
        //request.setCharacterEncoding("UTF-8");
        String seq = request.getParameter("seq");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        //2. 업무처리 - DB 연동작업(게시글 수정)
        BoardVO vo = new BoardVO();
        vo.setSeq(Integer.parseInt(seq));
        vo.setTitle(title);
        vo.setContent(content);

        BoardDAO dao = new BoardDAO();
        dao.updateBoard(vo);

        //3. 화면 네비게이션(목록 페이지로) : 데이터 다시 읽어오기
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:getBoardList.do");//뷰리졸버 적용안함(재요청)
        
        return mav;
    }
}
