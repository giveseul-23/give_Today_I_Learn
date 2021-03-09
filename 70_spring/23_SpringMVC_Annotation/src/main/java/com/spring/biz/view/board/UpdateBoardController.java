package com.spring.biz.view.board;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;

@Controller
public class UpdateBoardController{
	
	@RequestMapping("/updateBoard.do")
    public String UpdateBoard( BoardVO vo, BoardDAO dao) {
		System.out.println(">> 게시글 수정처리 - UpdateBoard()");
        dao.updateBoard(vo);
		
		return "getBoardList.do";
    }
	
}
