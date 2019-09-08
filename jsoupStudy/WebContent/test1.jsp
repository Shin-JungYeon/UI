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
<title>test1</title>  <%-- ũ�Ѹ� : ������ ���� ���. ���� ���ϴ� ������ �ִ� �������� url�� �����ͼ� �ʿ��� �κи� ��. --%>
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
		doc = Jsoup.connect(url).get();  //������ �ҽ� ���⿡�� ���̴� ������ ��� �����ͼ� DOM ���·� ����.
		Elements e1 = doc.select(".text_wrap");  //e1 : table �±� �κи� �����ؼ� �����ͼ� ����. table�� ���� ���� �� �־ Elements ��ü�� ����(Collection ��ü). DOM �����̱� ������ �Ӽ����� ���� ������ ���� ����.
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