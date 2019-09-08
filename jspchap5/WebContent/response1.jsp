<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/response1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>응답 객체</title>
</head>
<body>
	<h1>response 객체는 브라우저에 전달되는 객체로 이해하면 된다.
		내부에 출력 버퍼를 가지고 있어서, 브라우저에 전달되는 내용을 저장하고 있다.</h1>
	<h2>또한 response 객체를 이용하여 브라우저로 하여금 다른 페이지를 요청하도록 할 수 있다.
		다른 페이지를 요청하도록 하는 것을 redirect 라고 한다.</h2>
	<h2>지금 보여지고 잇는 페이지의 내용은 하나도 보이지 않을 것이다.</h2>
	<% response.sendRedirect("response2.jsp"); %>  <!-- 파일 없을 경우 404오류 -->
	<!-- 브라우저가 재요청하는 것. r1.jsp 요청 -> 서버가 r1.jsp 호출(서블릿으로 바뀌어서)
			-> 응답(response.sendRe...(r2.jsp)) -> r2.jsp 재요청. 브라우저에게 r2.jsp 요청하라고 명령하는 것. -->
	<!-- forward는 URL 바뀌지 않음. -->
</body>
</html>