<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/response1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��ü</title>
</head>
<body>
	<h1>response ��ü�� �������� ���޵Ǵ� ��ü�� �����ϸ� �ȴ�.
		���ο� ��� ���۸� ������ �־, �������� ���޵Ǵ� ������ �����ϰ� �ִ�.</h1>
	<h2>���� response ��ü�� �̿��Ͽ� �������� �Ͽ��� �ٸ� �������� ��û�ϵ��� �� �� �ִ�.
		�ٸ� �������� ��û�ϵ��� �ϴ� ���� redirect ��� �Ѵ�.</h2>
	<h2>���� �������� �մ� �������� ������ �ϳ��� ������ ���� ���̴�.</h2>
	<% response.sendRedirect("response2.jsp"); %>  <!-- ���� ���� ��� 404���� -->
	<!-- �������� ���û�ϴ� ��. r1.jsp ��û -> ������ r1.jsp ȣ��(�������� �ٲ�)
			-> ����(response.sendRe...(r2.jsp)) -> r2.jsp ���û. ���������� r2.jsp ��û�϶�� ����ϴ� ��. -->
	<!-- forward�� URL �ٲ��� ����. -->
</body>
</html>