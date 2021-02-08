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

@WebServlet("/getXmlMembers")
public class GetXmlMembersController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			//DB데이터 가져와서 XML형식 문자열 만들고 응답처리
			List<MembersVO> list = DAO.getList();
			
			//XML 형태 작성예시
			/*
			  	<?xml version="1.0" encoding="UTF-8"?>
				<members>
					<member>
						<idx>1</idx>
						<name>홍길동</name>
						<age>27</age>
						<addr>서울</addr>
						<regdate>2021-02-08</regdate>
					</member>
					...
				</members>
			 */
			//XML 형태 문자열로 만들기
			StringBuffer result = new StringBuffer();
			result.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			result.append("<members>");
			for(MembersVO vo : list) {
				result.append("<member>");
				result.append("<idx>"+vo.getIdx()+"</idx>");
				result.append("<name>"+vo.getName()+"</name>");
				result.append("<age>"+vo.getAge()+"</age>");
				result.append("<addr>"+vo.getAddr()+"</addr>");
				result.append("<regdate>"+vo.getRegdate()+"</regdate>");
				result.append("</member>");
			}
			result.append("</members>");
			System.out.println(result);
			
			//XML 문자열로 응답처리
			out.print(result.toString());
	}
	
}
