package com.spring.biz.view.board;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
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
		

		List<BoardVO> boardList = boardService.getBoardList(vo);
		System.out.println("boardList : " + boardList);
        model.addAttribute("boardList", boardList); 
        
        return "getBoardList.jsp";
	}
	
	
	//리턴타입 ModelAndView -> String
	//Model -> view 쪽에서 사용할 수 있도록 데이터를 전달하는 역할을 한다고 보면 됨
	@RequestMapping("/getBoard.do")
	public ModelAndView getBoard(ModelAndView model, BoardVO vo) {
		System.out.println(">> 게시글 상세보기 - String getBoard()");

        BoardVO board = boardService.getBoard(vo);
        
        model.addObject("board", board);
        model.setViewName("getBoard.jsp");
        
        return model;
	}
	
	
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo) throws IllegalStateException, IOException {
		System.out.println(">> 게시글 입력처리 - insertBoard()");
		
		System.out.println("vo : " + vo);
		
		MultipartFile uploadFile = vo.getUploadFile();
		System.out.println("파일  : " + uploadFile);
		if(!uploadFile.isEmpty()) { //파일이 있으면
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("C:/git_gitTIL/temp" + fileName)); //저장할 위치
		}
		
		boardService.insertBoard(vo);
		return "getBoardList.do";
	}
	
	@RequestMapping("/updateBoard.do")
    public String UpdateBoard(@ModelAttribute("board") BoardVO vo) {
		System.out.println(">> 게시글 수정처리 - UpdateBoard()");
		System.out.println("> board : " + vo);
		boardService.updateBoard(vo);
		
		return "getBoardList.do";
    }
	
	@RequestMapping("/deleteBoard.do")
	public String DeleteBoard(BoardVO vo) {
		System.out.println(">> 게시글 삭제처리 - DeleteBoard()");
		boardService.deleteBoard(vo);
        
        return "getBoardList.do";
	}
	
	//Ajax 요청을 받고 JSON 배열 데이터 리턴
	@RequestMapping("/ajaxGetBoardList.do")
	@ResponseBody
	public List<BoardVO> ajaxGetBoardList(BoardVO vo){
		System.out.println("boadList : " + boardService.getBoardList(vo));
		return boardService.getBoardList(vo);
	}
}
