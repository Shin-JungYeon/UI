<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/session1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>session 객체</title>
</head>
<body>
	<h1>session 객체 : 브라우저의 상태 정보를 저장하는 객체</h1>
	<%
		session.setMaxInactiveInterval(10);  //session 유지 시간 설정. 초단위.
	%>
	<h3>session 테스트</h3>
	isNew() : <%=session.isNew() %><br>
	생성시간 : <%=session.getCreationTime() %><br>
	최종접속시간 : <%=session.getLastAccessedTime() %><br>
	sessionID : <%=session.getId() %>
</body>
</html>