package com.spring.biz.view.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;

@Controller
public class BoardController {
	
	/*
	   @RequestParam(value="searchCondition")
		String condition 
		어노테이션에 value 속성 정해주면 파라미터 이름 마음대로 작성해도 괜찮음
		required=false
		-> 해당 설정이 없는 경우 다른 페이지로 넘어갈 때  404 에러가 남
		* Required String parameter 'searchCondition' is not present
		* false를 하면 반드시 그 값이 계속 들어와야된다는 에러가 뜨지 않는다.
	*/
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, BoardDAO boardDAO, Model model, 
			String condition, String keyword) {
		System.out.println(">> 게시글 전체목록 보여주기 - getBoardList()");
		System.out.println("> condition : " + condition);
		System.out.println("> keyword : " + keyword);
		//검색조건 값이 없을 때 기본값 설정
		if(vo.getSearchCondition() == null){
			vo.setSearchCondition("TITLE");
		}else if(vo.getSearchKeyword() == null){
			vo.setSearchCondition("");
		}

		List<BoardVO> boardList = boardDAO.getBoardList(vo);
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
