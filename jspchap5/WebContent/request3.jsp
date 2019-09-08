<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/request3.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사칙연산 결과 보기</title>
</head>
<body>
	<%
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		String kind = request.getParameter("kind");
		double result = 0;
		switch(kind) {
			case "+" : result = num1+num2; break;
			case "-" : result = num1-num2; break;
			case "*" : result = num1*num2; break;
			case "/" : result = (double)num1/num2; break;
		}
	%>
	<h2><%=num1 %> <%=kind %> <%=num2 %> = <%=result %></h2>
</body>
</html>