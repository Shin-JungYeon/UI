<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /jspchap1 ������Ʈ/
	 /WebContent/currentTime.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����ð�</title>
</head>
<body>
	<%
		Calendar c = Calendar.getInstance();
		int hour = c.get(Calendar.HOUR_OF_DAY);
		int min = c.get(Calendar.MINUTE);
		int sec = c.get(Calendar.SECOND);
	%>  <%-- �ڹ� �ҽ�(�ڹٽ�ũ��Ʈ�ʹ� ���� ������ �ҽ�) --%>
	<h1>����ð��� <%=hour %>�� <%=min %>�� <%=sec %>�� �Դϴ�.</h1>  <%-- �ҽ����� �ϸ� �ڹټҽ��κ��� ������ ����. --%>
</body>
</html>