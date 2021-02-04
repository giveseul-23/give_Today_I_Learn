<%@page import="com.bc.mybatis.BBSVO"%>
<%@page import="com.bc.mybatis.CommVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	삭제후 화면전환 : list.jsp
	삭제실패(댓글있는 경우) -> 경고창, 이전 페이지
 --%>
<%
	String b_idx = ((BBSVO)session.getAttribute("bvo")).getB_idx();
	List<CommVO> list = DAO.getCommList(b_idx);
	//System.out.println(list);
	
	/**/
	if(list == null){
		int result = DAO.delete(b_idx);
		if(result < 1){%>
			<script type="text/javascript">
				alert("오류발생! 관리자에게 문의하세요.");
				history.go(-2);
			</script>
	<%
		}else{%>
			<script type="text/javascript">
				alert("삭제완료. 목록페이지로 되돌아갑니다.");
				location.href="list.jsp";
			</script>
		<%
			}
	}else{%>
		<script type="text/javascript">
			alert("댓글이 존재합니다. 관리자에게 문의하세요."+<br>+"상세보기로 되돌아갑니다.");
			location.href="list.jsp";
		</script>
<%
	}
%>