<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/upload/uploadForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���ε�â</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
	<form action="uplaod.jsp" method="post" enctype="multipart/form-data">
	<%--
		���� ���ε�� �ݵ�� enctype="multipart/form-data" �����ؾ� ��.
		  -> ���� ������ �Ķ���� ������ ������ ������� ������ ������ �� �ֵ��� ����.
		  -> �ݵ�� method="post" ���� ��.
		  -> uplaod.jsp ������ request ��ü�� ���� ����� �� ����. utility���� �ʿ�.
		  	 cos.jar ������ classpath�� �����Ͽ� MultipartRequest ��ü�� ����ؾ� ��.
	--%>
		<table>
			<tr><td>�ø����</td><td><input type="text" name="name"></td></tr>
			<tr><td>����</td><td><input type="text" name="title"></td></tr>
			<tr><td>����</td><td><input type="file" name="file1"></td></tr>
			<tr><td colspan="2"><input type="submit" value="����"></td></tr>
		</table>
	</form>
</body>
</html>