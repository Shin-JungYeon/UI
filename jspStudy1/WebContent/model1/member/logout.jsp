<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/logout.jsp --%>
<%--
	1. session�� ��ϵ� �α��� ���� ����.
	2. "id�� �α׾ƿ� �Ǿ����ϴ�." �޼��� ��� �� loginForm.jsp �������� �̵�.
--%>

<%
	String login = (String) session.getAttribute("login");
	session.invalidate();  //�� ��� �� ���� ��.
	//session.removeAttribute("login");
%>
<script>
	alert("<%=login %>�� �α׾ƿ� �Ǿ����ϴ�.");
	location.href="loginForm.jsp";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>