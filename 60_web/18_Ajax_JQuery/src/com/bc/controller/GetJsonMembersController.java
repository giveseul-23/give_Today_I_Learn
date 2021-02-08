package com.bc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.MembersVO;

@WebServlet("/getJsonMembers")
public class GetJsonMembersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DB에서 데이터 조회후  JSON 형식문자열 생성후 응답처리
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//DB 데이터 조회
		List<MembersVO> list = DAO.getList();
		System.out.println("list : " + list);
		
		//검색된 데이터 JSON 문자열로 바꾸기
		/*
		 {
		 	"idx" : "+1+",
		 	"name" : "name값",
		 	"age" : "age값",
		 	"addr" : "addr값",
		 	"regdate" : "regdate값"
		 },
		 {}. {], ....., {}
		 */
		
		String result = "{\"list\" [";
		for(MembersVO vo : list){
			result += "{";
			result += "\"idx\":\""+vo.getIdx() + "\",";
			result += "\"name\":\""+vo.getName() + "\",";
			result += "\"age\":\""+vo.getAge() + "\",";
			result += "\"addr\":\""+vo.getAddr() + "\",";
			result += "\"regdate\":\""+vo.getRegdate() + "\",";
			result += "},";
		}
		//문자열 맨 마지막 문자 제거하기
		result = result.substring(0, result.length()-1);
		result += "]}";
		//확인용
		System.out.println(result);
		
		//JSON 문자열 출력
	}

}
