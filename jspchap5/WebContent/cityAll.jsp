<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/cityAll.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ü ���� ���</title>
</head>
<body>
	<%
		pageContext.include("seoul.jsp");  //cityAll.jsp�� �ִ� request ��ü�� seoul.jsp �� ����. ���� ������ request ��ü.
	%>
	<hr>
	<%
		pageContext.include("busan.jsp");  //cityAll.jsp�� �ִ� request ��ü�� busan.jsp �� ����. ���� ������ request ��ü.
	%>
	<hr>
	<h4>��ü ���� ����Դϴ�....</h4>
<%--
	request : ��û ��ü. �Ķ���� ����, header ����, ... �� ������ ����.
	response : ���� ��ü. �������� ���޵Ǵ� ��ü.(��������, ����� ����, ...)
	pageContext : page ������ ����ϴ� ��ü. �ش� �������� ������ ����. -> ���������� �� ���� �Ҵ� ��. ���� ���� ������ ����. ���� x
 --%>
</body>
</html>