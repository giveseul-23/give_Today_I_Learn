package com.spring.biz.view.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;

@Controller
@SessionAttributes("board") //board라는 이름의 Model 이 있으면 세션에 저장
public class BoardController {
	
	@Autowired //BoardServiceImpl 객체 의존주입 : 동일한 데이터 타입 객체
	private BoardService boardService;
	
	public BoardController() {
		System.out.println(">> BoardController() 객체 생성");
		System.out.println("boardService : " + boardService); //null
	}
	
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
	public String getBoardList(BoardVO vo, Model model, 
			String condition, String keyword) {
		System.out.println(">> 게시글 전체목록 보여주기 - getBoardList()");
		System.out.println("> condition : " + condition);
		System.out.println("> keyword : " + keyword);
		
		//검색조건 값이 없을 때 기본값 설정
		if(vo.getSearchCondition() == null){
			vo.setSearchCondition("TITLE");
		}
		
		if(vo.getSearchKeyword() == null){
			vo.setSearchKeyword("");
		}

		List<BoardVO> boardList = boardService.getBoardList(vo);
		System.out.println("boardList : " + boardList);
        model.addAttribute("boardList", boardList); 
        
        return "getBoardList.jsp";
	}
	
	
	//리턴타입 ModelAndView -> String
	//Model -> view 쪽에서 사용할 수 있도록 데이터를 전달하는 역할을 한다고 보면 됨
	@RequestMapping("/getBoard.do")
	public String getBoard(Model model, BoardVO vo) {
		System.out.println(">> 게시글 상세보기 - String getBoard()");

        BoardVO board = boardService.getBoard(vo);
        
        model.addAttribute("board", board);
        
        return "getBoard.jsp";
	}
	
	
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo) {
		System.out.println(">> 게시글 입력처리 - insertBoard()");
		boardService.insertBoard(vo);
		
		return "getBoardList.do";
	}
	
	@RequestMapping("/updateBoard.do")
	//인수(파라미터)에 설정한 @ModelAttribute("board") : 속성명 board 가 있으면 사용
	//없으면 새로 만들어서 적용
    public String UpdateBoard(@ModelAttribute("board") BoardVO vo) {
		System.out.println(">> 게시글 수정처리 - UpdateBoard()");
		System.out.println("> board : " + vo);
		boardService.updateBoard(vo);
		
		return "getBoardList.do";
    }
	
	@RequestMapping("/deleteBoard.do")
	public String DeleteBoard( BoardVO vo) {
		System.out.println(">> 게시글 삭제처리 - DeleteBoard()");

		boardService.deleteBoard(vo);
        
        return "getBoardList.do";
	}
}
