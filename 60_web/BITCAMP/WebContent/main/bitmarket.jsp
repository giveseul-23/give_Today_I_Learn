<%@page import="com.bc.model.vo.PListVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.bc.model.SelectDAO"%>
<%@page import="com.bc.model.vo.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String type = (String) request.getAttribute("type");
	System.out.println("type받기 : " + type);
	
	String txt = (String) request.getAttribute("searchtxt");
	System.out.println("txt받기 : " + txt);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIT MARKET</title>
<link rel="stylesheet" href="../CSS/main.css" type="text/css">
</head>
<body>
	<div class="wrap">
        <header>
            <div id="logo"><a href="bitmarket" target="_self"><img src="../img/logo.PNG" alt="logo"></a></div>
            <div id="mainMenu">
                <a href="#"><img src="../img/sales.png" alt="상품등록"><p>상품등록</p></a>
                <a href="../Login/login.jsp"><img src="../img/Login.png" alt="로그인"><p>로그인</p></a>
            </div>
        </header> 
        <nav>
            <form class="searchWrap" name="frm">
                <input type="text" style="height: 25px; width: 200px; color:gray;" value="상품명 검색" name="searchtxt">
                <input type="hidden" name="type" value="search">
                <a href="javascript:searchFunction()">
                	<img alt="찾기" src="../img/Magnifying Glass.png">
                </a>
            </form>
            <ul>
                <li><a href="#">지역</a></li>
                <li><a href="#">카테고리</a></li>
                <li><a href="#">고객센터</a></li>
            </ul>
        </nav>
        <main>
	        <ul id="product_list">
	        <c:if test="${empty list }">
	        	<h2>현재 등록된 게시글이 없습니다.</h2>
	        </c:if>
	        <c:if test="${not empty list }">
	            <c:forEach var="vo" items="${list }">
			             <li>
			                 <a href="#">
			                     <img src="../img/${vo.picture01}" alt="${vo.p_title }">
			                     <h2>${vo.p_title }</h2>
			                     <p>${vo.price }</p>
			                     <p style="font-size:12px; padding-top:5px;">${vo.common_name }</p>
			                 </a>
			             </li>
	        	</c:forEach> 
	        </c:if>
	        </ul>
        </main>
        <ol class="paging">
					<c:choose>
						<c:when test="${pvo.beginPage == 1 }">
							<li class="disable">이전으로</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="bitmarket?cPage=${pvo.beginPage-1 }&type=${type}&searchtxt=${searchtxt}">
									이전으로
								</a>
							</li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
						
						<c:if test="${pageNo == pvo.nowPage }">
							<li>${pageNo }</li>
						</c:if>
						
						<c:if test="${pageNo != pvo.nowPage }">
							<li>
								<a href="bitmarket?cPage=${pageNo }&type=${type}&searchtxt=${searchtxt}">${pageNo }</a>
							</li>
						</c:if>
						
					</c:forEach>

						 <c:if test="${pvo.endPage < pvo.totalPage }">
						 	<li><a href="bitmarket?cPage=${pvo.endPage +1 }&type=${type}&searchtxt=${searchtxt}">다음으로</a></li>
						 </c:if>
						 <c:if test="${pvo.endPage >= pvo.totalPage }">
						 	<li class="disable">다음으로</li>
						 </c:if>
			</ol>
    </div>
    <footer>
        <p>여기는 풋터다~~~</p>
    </footer>
</body>
<script type="text/javascript">
	function searchFunction(){
		location.href="bitmarket";
		frm.submit();
	}
</script>
</html>