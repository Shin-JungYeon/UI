<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /jspchap1 프로젝트/
	 /WebContent/currentTime.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>현재시간</title>
</head>
<body>
	<%
		Calendar c = Calendar.getInstance();
		int hour = c.get(Calendar.HOUR_OF_DAY);
		int min = c.get(Calendar.MINUTE);
		int sec = c.get(Calendar.SECOND);
	%>  <%-- 자바 소스(자바스크립트와는 완전 별개의 소스) --%>
	<h1>현재시간은 <%=hour %>시 <%=min %>분 <%=sec %>초 입니다.</h1>  <%-- 소스보기 하면 자바소스부분은 보이지 않음. --%>
</body>
</html>