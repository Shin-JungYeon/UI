<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isErrorPage="true" %>  <%-- exception ��ü ���� �����ϰ� ����. --%>
<%-- /WebContent/chap9/error.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ������</title>
</head>
<body>
	<h1>�Ķ���� noname�� �Է����ּ���.</h1>
	<h1>��� ���� �߻��� ����ο� ��ȭ ���</h1>
	<h1>[����� ȫ�浿 : 1234]</h1>
	<%=exception.getMessage() %>
	<!-- ������������ ��� �뷮�� 500����Ʈ �̸��� ��� �������� http ���� �޼����� ��µ�.
		  �׷��Ƿ� 500����Ʈ �̻��� �ǵ��� ���� �޼����� ����ؾ� �ش� �������� �ν��մϴ�. (���Ƿ� �����߻� ��Ű��) -->
</body>
</html>