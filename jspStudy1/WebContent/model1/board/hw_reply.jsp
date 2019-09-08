<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/hw_reply.jsp --%>
<%--
	select * from board order ref desc, refstep asc
	num : 고유 게시글 번호. 답글 원글 상관없이 계속 +1.
	ref : 원글의 ref값 그대로 유지
	reflevel : 원글의답글:1, 답글의답글:2, ...
	refstep : 원글-답글-답글의답글-... 순서. 원글의 답글, 답글의 답글 상관없이 계속 +1.
--%>
<%
	request.setCharacterEncoding("euc-kr");
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDao dao = new BoardDao();
	Board board = dao.selectOne(num); 
	
	num = dao.maxnum();
	board.setNum(++num);
	board.setName(request.getParameter("name"));
	board.setPass(request.getParameter("pass"));
	board.setSubject(request.getParameter("subject"));
	board.setContent(request.getParameter("content"));
	board.setRef(board.getRef());
	board.setFile1(null);
	
	int reflevel = Integer.parseInt(request.getParameter("reflevel"));
	int refstep = Integer.parseInt(request.getParameter("reflevel"));
	if(reflevel == dao.maxreflevel()) {
		reflevel = dao.maxreflevel();
		board.setReflevel(++reflevel);	
	} else {
		reflevel = dao.maxreflevel();
		board.setReflevel(reflevel);
	}
	
	refstep = dao.maxrefstep();
	board.setRefstep(++refstep);
	
	String msg = "답글 등록에 실패하였습니다.";
	String url = "replyForm.jsp?num=" + num;
	if(dao.insert(board)) {
		msg = "답글 등록이 완료되었습니다.";
		url = "list.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>