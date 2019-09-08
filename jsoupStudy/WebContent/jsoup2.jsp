<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jsoup2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSoup을 이용한 크롤링(데이터 수집) 예제2</title>
<style type="text/css">
	table,th,td {border: 2px solid grey;}
</style>
</head>
<body>
<%
	String url = "https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
	String line = "";
	Document doc = null;
	try {
		doc = Jsoup.connect(url).get();  //DOM 형태.
		Elements e1 = doc.select("table");
		for(Element ele : e1) {  //ele : table 태그의 하위 태그들로 구성.
			//String temp = ele.select("tr").text();  //text() : 태그는 인식하지 못하고 내용들만 가져옴.
			Elements e2 = ele.select("tr");  //tr 태그들 전부 가지고 있음.
			for(Element ele2 : e2){  //ele2 : tr 태그의 하위 태그들.
				String temp = ele2.html();
				System.out.println("====================================");
				System.out.println(temp);
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