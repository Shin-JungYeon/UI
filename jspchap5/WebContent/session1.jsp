<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/session1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>session ��ü</title>
</head>
<body>
	<h1>session ��ü : �������� ���� ������ �����ϴ� ��ü</h1>
	<%
		session.setMaxInactiveInterval(10);  //session ���� �ð� ����. �ʴ���.
	%>
	<h3>session �׽�Ʈ</h3>
	isNew() : <%=session.isNew() %><br>
	�����ð� : <%=session.getCreationTime() %><br>
	�������ӽð� : <%=session.getLastAccessedTime() %><br>
	sessionID : <%=session.getId() %>
</body>
</html>