<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	page 지시어(Directive) : 속성들의 설정을 이용하여 현재 페이지의 특징을 설정하는 요소.
		<@ page 속성1=속성값1 ... %>
			language="java" : 기본 언어 설정. 생략 가능.
			contentType : html 형태이고, euc-kr 인코딩 방식으로 설정.
			import : 사용되는 클래스의 패키지를 설정. 여러 번 설정이 가능한 속성.
 --%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%-- /WebContent/pageDirectiveEx1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Page Directive(지시어) 예제</title>
</head>
<body>
	<%
		Date today = new java.util.Date();
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  //import 하는 대신 사용.
	%>
	현재 일시 : <%=df.format(today) %>
</body>
</html>