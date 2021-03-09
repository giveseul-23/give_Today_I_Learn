package com.spring.biz.view.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;

@Controller
public class BoardController {
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardDAO boardDAO, Model model) {
		System.out.println(">> 게시글 전체목록 보여주기 - getBoardList()");
		
		List<BoardVO> boardList = boardDAO.getBoardList();
		
        model.addAttribute("boardList", boardList); 
        
        return "getBoardList.jsp";
	}
	
	
	//리턴타입 ModelAndView -> String
	//Model -> view 쪽에서 사용할 수 있도록 데이터를 전달하는 역할을 한다고 보면 됨
	@RequestMapping("/getBoard.do")
	public String getBoard(Model model, BoardVO vo, BoardDAO boardDAO) {
		System.out.println(">> 게시글 상세보기 - String getBoard()");

        BoardVO board = boardDAO.getBoard(vo);
        
        model.addAttribute("board", board);
        
        return "getBoard.jsp";
	}
	
	
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo, BoardDAO boardDAO) {
		System.out.println(">> 게시글 입력처리 - insertBoard()");
		boardDAO.insertBoard(vo);
		
		return "getBoardList.do";
	}
	
	@RequestMapping("/updateBoard.do")
    public String UpdateBoard( BoardVO vo, BoardDAO dao) {
		System.out.println(">> 게시글 수정처리 - UpdateBoard()");
        dao.updateBoard(vo);
		
		return "getBoardList.do";
    }
	
	@RequestMapping("/deleteBoard.do")
	public String DeleteBoard( BoardVO vo, BoardDAO dao) {
		System.out.println(">> 게시글 삭제처리 - DeleteBoard()");

        dao.deleteBoard(vo);
        
        return "getBoardList.do";
	}
}
