<%@page import="com.bc.mybatis.Cart"%>
<%@page import="com.bc.mybatis.ShopDAO"%>
<%@page import="com.bc.mybatis.ShopVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cart" class="com.bc.mybatis.Cart" scope="session"/> 
<jsp:useBean id="dao" class="com.bc.mybatis.ShopDAO" scope="session"/>

<%
	String p_num = request.getParameter("p_num");
	
	cart.addCart(p_num, dao);
	
	response.sendRedirect("product_content.jsp?p_num=" + p_num);
%>
