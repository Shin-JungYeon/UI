<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/hw_reply.jsp --%>
<%--
	select * from board order ref desc, refstep asc
	num : ���� �Խñ� ��ȣ. ��� ���� ������� ��� +1.
	ref : ������ ref�� �״�� ����
	reflevel : �����Ǵ��:1, ����Ǵ��:2, ...
	refstep : ����-���-����Ǵ��-... ����. ������ ���, ����� ��� ������� ��� +1.
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
	
	String msg = "��� ��Ͽ� �����Ͽ����ϴ�.";
	String url = "replyForm.jsp?num=" + num;
	if(dao.insert(board)) {
		msg = "��� ����� �Ϸ�Ǿ����ϴ�.";
		url = "list.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>