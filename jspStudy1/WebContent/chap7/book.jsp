<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap7/book.jsp --%>

<%-- 
	�Ķ���� 3���� : writer, title, content
 --%>
 
<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="book" class="chap7.Book" />
<%-- 
	<jsp:useBean /> : useBean �׼��±�. chap7.Book Ŭ���� ��üȭ.
	�ڹ� : book = new chap7.Book();
--%>

<jsp:setProperty property="*" name="book"/>
<%--
	<jsp:setProperty /> : setProperty �׼��±�.
		property="*" : �Ķ���� �̸��� ������Ƽ �̸��� ���� ����. �Ķ���� �̸��� �������� ������Ƽ�� ã�ƿ�.
		name="book" : book ��ü�� ���.
		
	�ڹ� : book.setWriter(request.getParameter('writer'))
		 book.setTitle(request.getParameter('title'))
		 book.setContent(request.getParameter('content'))
		 
	set ������Ƽ
		setWriter(...) : writer�� ������Ƽ��.
 --%>

<jsp:setProperty property="writer" param="name" name="book"/>
<%-- �ĸ����� �̸��� ������Ƽ �̸��� �ٸ� �� ����ϴ� ���. --%>
<%-- book.getWriter(request.getParameter("name")); --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
	<table>
		<tr><td>�湮��</td>
			<td><jsp:getProperty property="writer" name="book"/></td>
			<td><%=book.getWriter() %></td>  <%-- �ٷ� ���ٰ� ���� ����� ������. --%>
		</tr>
		<tr><td>����</td>
			<td><jsp:getProperty property="title" name="book"/></td>
			<td><%=book.getTitle() %></td>
		</tr>
		<tr><td>����</td>
			<td><jsp:getProperty property="content" name="book"/></td>
			<td><%=book.getContent() %></td>
		</tr>
	</table>
</body>
</html>