<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/city.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>�� �������� ������ ��Ÿ���� �ʽ��ϴ�.</h1>
	<%
		String city = request.getParameter("c");
		pageContext.forward(city + ".jsp");  //city.jsp ���� URL�� �ٲ��� ����. city.jsp�� seoul.jsp, busan.jsp �� request�� ���� request �����̴�. -> �������� ����Ǹ鼭 �����Ǵ� ��.
	%>
</body>
</html>