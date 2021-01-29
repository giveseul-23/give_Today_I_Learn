<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	(실습)
	제품번호, 수량 전달받아 장바구니(cart)에 있는 데이터 수정 후
	장바구니보기 페이지로 이동
	- 카트 : 세션에 있는 cart 사용
	- 수량 변경 작업  cart에 있는 setQuant() 메소드 사용
	- 페이지 이동 : cartList.jsp
 --%>
<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/>

<%  
	//수량, 제품번호 확인
	int su = Integer.parseInt(request.getParameter("su"));
	String p_num = request.getParameter("p_num");
	
	//카트에서 제품 수정처리
	//방법1
	//cart.setQuant(p_num, su);
	//방법2
	cart.setQuant2(p_num, su);
	
	//화면전환
	response.sendRedirect("cartList.jsp");
%>