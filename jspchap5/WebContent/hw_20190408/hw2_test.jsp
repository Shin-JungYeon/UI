<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/hw2_test.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Էµ� ���ڱ����� ��</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		int num = Integer.parseInt(request.getParameter("num"));  //�Ķ���Ͱ��� ���� String���� �Ѿ��.
		
		int sum=0;
		for(int i=1; i<=num; i++) {
			sum += i;
		}
	%>
	<h2><%=num %>������ �� :<%=sum %></h2>
</body>
</html>
