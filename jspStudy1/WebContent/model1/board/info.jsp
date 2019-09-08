<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/info.jsp --%>
<%--
	1. num �Ķ���͸� �̿��Ͽ� db�� �ش� �Խù� ��ȸ.
		Board board = new BoardDao().selectOne(num);
	2. �Խù� ��ȸ�� ��ȸ��(readcnt) +1.
		new BoardDao().readcntadd(num);
	3. 1������ ��ȸ�� �Խù� �����͸� ȭ�鿡 ����ϱ�.
--%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDao dao = new BoardDao();
	Board board = dao.selectOne(num);  //num�� �ش��ϴ� �Խù� ��ȸ.
	dao.readcntadd(num);  //num�� �ش��ϴ� �Խù��� ��ȸ�Ǽ� ����.
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� �� ����</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
	<table>
		<caption>MODEL1 �Խù� �� ����</caption>
		<tr><td width="30%">�۾���</td><td width="80%" style="text-align: left"><%=board.getName() %></td></tr>
		<tr><td>����</td><td style="text-align: left"><%=board.getSubject() %></td></tr>
		<tr><td>����</td>
			<td>
				<table style="width: 100%; height: 250px;">
					<tr><td style="border-width: 0px; vertical-align: top; text-align: left;"><%=board.getContent() %></td></tr>
				</table>
			</td></tr>
		<tr><td>÷������</td>
			<td style="text-align: left">
			<% if(board.getFile1() != null && !board.getFile1().trim().equals("")) { %>
				<a href="file/<%=board.getFile1() %>"><%=((board.getFile1()==null)?"":board.getFile1()) %></a>
			<% } else { %>
				&nbsp;&nbsp;&nbsp;
			<% } %>
			</td></tr>
		<tr><td colspan="2">
				<a href="replyForm.jsp?num=<%=num %>">[�亯]</a>
				<a href="updateForm.jsp?num=<%=num %>">[����]</a>
				<a href="deleteForm.jsp?num=<%=num %>">[����]</a>
				<a href="list.jsp">[���]</a>
			</td>
		</tr>
	</table>
</body>
</html>