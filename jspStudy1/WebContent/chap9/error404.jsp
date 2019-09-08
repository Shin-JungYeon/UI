<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap9/error404.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>요청페이지 없음</title>
</head>
<body>
	<h1>요청하신 페이지는 존재 하지 않습니다.</h1>
	<h2>URL 주소가 올바른지 확인 해주세요.</h2>
	<h3>입력 url : <%=request.getRequestURL() %></h3>
</body>
</html>