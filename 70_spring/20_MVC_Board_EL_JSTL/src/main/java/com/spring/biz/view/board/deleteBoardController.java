package com.spring.biz.view.board;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;
import com.spring.biz.view.controller.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class deleteBoardController implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
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
        //response.sendRedirect("getBoardList.do");

        return "getBoardList.do";
    }
}
