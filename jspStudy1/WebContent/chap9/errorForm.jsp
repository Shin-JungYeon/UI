<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page errorPage="error.jsp" %>
<%-- /WebContent/chap9/errorForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%=request.getParameter("noname").trim() %>
</body>
</html>
<%--
	error ������ ó�� ���. ��ȣ����� �켱������ ���´�.
	  1. �ش� ���������� <%@ page errorPage="...jsp" %>�� ����.
	  2. web.xml�� ���� ��ü���� ó��.
	  3. web.xml�� ���� �ڵ庰�� ó��.
	  4. ��Ĺ(�� ���ø����̼� ����, �� �����̳�)���� �⺻���� �����Ǵ� ���� ������. ����ó�� ���� ����.
--%>