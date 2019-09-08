<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/hw2_test.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>입력된 숫자까지의 합</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		int num = Integer.parseInt(request.getParameter("num"));  //파라미터값은 전부 String으로 넘어옴.
		
		int sum=0;
		for(int i=1; i<=num; i++) {
			sum += i;
		}
	%>
	<h2><%=num %>까지의 합 :<%=sum %></h2>
</body>
</html>
