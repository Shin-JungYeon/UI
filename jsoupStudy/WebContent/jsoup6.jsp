<%@page import="org.jsoup.nodes.Element"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jsoup6.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>이 달의 프로축구 순위</title>
</head>
<body>
<%
	String url = "https://www.kleague.com/rank?ch=020840";
	String line = "";
	Document doc = null;
	try {
		doc = Jsoup.connect(url).get();
		Elements e1 = doc.select(".data-body");
		for(Element ele : e1) {
			String temp = ele.html();
			line += temp;
		}
	} catch(IOException e) {
		e.printStackTrace();
	}
	
	//jsoup은 원하는 부분만 잘라서 가져오기 때문에 전체 소스가 필요한 기능들은 되지 않음.(로그인 같은..)
%>
<table><%=line %></table>
</body>
</html>