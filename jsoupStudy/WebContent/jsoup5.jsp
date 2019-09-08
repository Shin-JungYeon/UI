<%@page import="org.jsoup.nodes.Element"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jsoup5.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>class 속성으로 조회하기2</title>
</head>
<body>
<%
	String url = "http://biz.heraldcorp.com/";
	String line = "";
	Document doc = null;
	try {
		doc = Jsoup.connect(url).get();
		Elements e1 = doc.select("div[class=con_right] > div[class=c_r_top]");  //특정 태그의 class 속성값을 가진 부분을 가져올 때. 태그명[속성=속성값]
		for(Element ele : e1) {
			Elements e2 = ele.select("tbody");
			for(Element ele2 : e2) {
				String temp = ele2.html();
				line += "<tr>" + temp + "</tr>";
			}
		}
	} catch(IOException e) {
		e.printStackTrace();
	}
	%>
	<table><%=line %></table>
</body>
</html>