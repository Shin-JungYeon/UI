<%@page import="com.oreilly.servlet.MultipartRequest"%> <%-- cos.jar 파일 안에 있음. --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/upload/upload.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>파일 업로드 결과</title>
</head>
<body>
<%
	String uploadPath = application.getRealPath("/") + "upload/";
	int size = 10 * 1024 * 1024;  //10MB까지 업로드.
	/*
		new MultipartRequest
			- request : 요청 정보, 파라미터 정보, 파일 정보, 파일의 내용을 저장하고 있는 객체.
			- uploadPath : 서버에 파일을 저장할 폴더 설정.
			- size : 업로드 되는 파일의 최대 크기 설정.
			- "euc-kr" : 파라미터 인코딩 방식 설정.
	*/
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr");  //객체 생성하는 순간 파일 전송 완료.
	String name = multi.getParameter("name");
	String title = multi.getParameter("title");
	String filename = multi.getFilesystemName("file1");
%>
	업로드 위치 : <%=uploadPath %><br>
	올린사람 : <%=name %><br>
	제목 : <%=title %><br>
	파일 :  <a href="<%=filename %>"><%=filename %></a><br>
</body>
</html>