package com.spring.biz.view.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;

@Controller
public class BoardController {

	//메소드에 선언된 @ModelAttribute : 리턴된 데이터를 View 에 전달
	//@ModelAttribute 선언된 메소드는 @RequestMapping 메소드보다 '먼저 실행'됨
	//뷰에 전달될 때 설정된 명칭(예 : conditionMap ) 으로 전달
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		System.out.println("--> searchConditionMap() ");
		//key : 제목 | value : TILTE
		//key : 내용 | value : CONTENT
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");

		return conditionMap;
	}
	
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
