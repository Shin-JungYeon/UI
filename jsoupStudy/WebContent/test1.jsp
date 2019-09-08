<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/test1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>test1</title>  <%-- 크롤링 : 데이터 수집 방법. 내가 원하는 정보가 있는 페이지의 url을 가져와서 필요한 부분만 얻어냄. --%>
<style type="text/css">
	table,th,td {border: 2px solid grey;}
</style>
</head>
<body>
<%
	String url = "https://www1.president.go.kr/articles/3440";
	String line = "";
	Document doc = null;
	try {
		doc = Jsoup.connect(url).get();  //페이지 소스 보기에서 보이는 내용을 모두 가져와서 DOM 형태로 저장.
		Elements e1 = doc.select(".text_wrap");  //e1 : table 태그 부분만 선택해서 가져와서 저장. table이 여러 개일 수 있어서 Elements 객체로 저장(Collection 객체). DOM 형태이기 때문에 속성값을 통해 가져올 수도 있음.
		for(Element ele : e1) {
			Elements e2 = ele.select("p");
			for(Element ele2 : e2) {
				String temp = ele2.html();
				line += temp;
			}
		}
	} catch(IOException e) {
		e.printStackTrace();
	}
%>
	<table><%=line %></table>
</body>
</html>