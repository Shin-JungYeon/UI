<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	page ���þ�(Directive) : �Ӽ����� ������ �̿��Ͽ� ���� �������� Ư¡�� �����ϴ� ���.
		<@ page �Ӽ�1=�Ӽ���1 ... %>
			language="java" : �⺻ ��� ����. ���� ����.
			contentType : html �����̰�, euc-kr ���ڵ� ������� ����.
			import : ���Ǵ� Ŭ������ ��Ű���� ����. ���� �� ������ ������ �Ӽ�.
 --%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%-- /WebContent/pageDirectiveEx1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Page Directive(���þ�) ����</title>
</head>
<body>
	<%
		Date today = new java.util.Date();
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  //import �ϴ� ��� ���.
	%>
	���� �Ͻ� : <%=df.format(today) %>
</body>
</html>