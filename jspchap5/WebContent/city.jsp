<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/city.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>이 페이지의 내용은 나타나지 않습니다.</h1>
	<%
		String city = request.getParameter("c");
		pageContext.forward(city + ".jsp");  //city.jsp 에서 URL이 바뀌지 않음. city.jsp와 seoul.jsp, busan.jsp 의 request는 같은 request 영역이다. -> 동적으로 실행되면서 결정되는 것.
	%>
</body>
</html>