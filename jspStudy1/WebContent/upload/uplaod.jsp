<%@page import="com.oreilly.servlet.MultipartRequest"%> <%-- cos.jar ���� �ȿ� ����. --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/upload/upload.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���ε� ���</title>
</head>
<body>
<%
	String uploadPath = application.getRealPath("/") + "upload/";
	int size = 10 * 1024 * 1024;  //10MB���� ���ε�.
	/*
		new MultipartRequest
			- request : ��û ����, �Ķ���� ����, ���� ����, ������ ������ �����ϰ� �ִ� ��ü.
			- uploadPath : ������ ������ ������ ���� ����.
			- size : ���ε� �Ǵ� ������ �ִ� ũ�� ����.
			- "euc-kr" : �Ķ���� ���ڵ� ��� ����.
	*/
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr");  //��ü �����ϴ� ���� ���� ���� �Ϸ�.
	String name = multi.getParameter("name");
	String title = multi.getParameter("title");
	String filename = multi.getFilesystemName("file1");
%>
	���ε� ��ġ : <%=uploadPath %><br>
	�ø���� : <%=name %><br>
	���� : <%=title %><br>
	���� :  <a href="<%=filename %>"><%=filename %></a><br>
</body>
</html>