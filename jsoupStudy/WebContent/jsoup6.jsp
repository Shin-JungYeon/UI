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
<title>�� ���� �����౸ ����</title>
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
	
	//jsoup�� ���ϴ� �κи� �߶� �������� ������ ��ü �ҽ��� �ʿ��� ��ɵ��� ���� ����.(�α��� ����..)
%>
<table><%=line %></table>
</body>
</html>