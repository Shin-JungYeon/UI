<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/test4.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>프로 농구팀 순위 조회</title>
<style type="text/css">
	table, th, td {border: 1px solid grey;}
</style>
</head>
<body>
<%
	String url = "https://www.kbl.or.kr/stats/team_rank.asp";
	String line = "";
	Document doc = null;
	try {
		doc = Jsoup.connect(url).get();
		Elements e1 = doc.select(".tbltype_record");
		for(Element ele : e1) {
			String temp = ele.html();
			line += temp;
		}
	} catch(IOException e) {
		e.printStackTrace();
	}
%>
<table><%=line %></table>
</body>
</html>