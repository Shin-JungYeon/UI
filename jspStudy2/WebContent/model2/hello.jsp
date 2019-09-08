<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/hello.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%-- http://localhost:8080/jspStudy2/model2/hello.me --%>
	<%-- http://localhost:8080/jspStudy2/model2/hello.do --%>
	${hello }  <%-- pageContext에서 먼저 찾음. -> 없으므로 request 객체에서 찾아옴. -> Hello World --%>
</body>
</html>