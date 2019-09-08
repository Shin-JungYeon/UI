<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jsoup1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSoup�� �̿��� ũ�Ѹ�(������ ����) ����</title>  <%-- ũ�Ѹ� : ������ ���� ���. ���� ���ϴ� ������ �ִ� �������� url�� �����ͼ� �ʿ��� �κи� ��. --%>
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
		doc = Jsoup.connect(url).get();  //������ �ҽ� ���⿡�� ���̴� ������ ��� �����ͼ� DOM ���·� ����.
		Elements e1 = doc.select("table");  //e1 : table �±� �κи� �����ؼ� �����ͼ� ����. table�� ���� ���� �� �־ Elements ��ü�� ����(Collection ��ü). DOM �����̱� ������ �Ӽ����� ���� ������ ���� ����.
		for(Element ele : e1) {
			String temp = ele.html();
			System.out.println("====================================");
			System.out.println(temp);
			line += temp;
		}
	} catch(IOException e) {
		e.printStackTrace();
	}
%>
	<table><%=line %></table>
</body>
</html>