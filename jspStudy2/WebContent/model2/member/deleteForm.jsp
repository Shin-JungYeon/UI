<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/deleteForm.jsp --%>
<%--
	
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� Ż�� ��й�ȣ Ȯ��</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
</head>
<body>
	<form name="f" action="delete.me" method="post">
		<input type="hidden" name="id" value="${param.id }"> <%-- ȭ�鿡�� ������ ������ �Ķ������ ���� �Է��� �Ǿ ������ ����. --%>
		<table>
			<caption>ȸ�� ���� ��й�ȣ �Է�</caption>
			<tr><td>��й�ȣ</td>
				<td><input type="password" name="pass"></td></tr>
			<tr><td colspan="2"><input type="submit" value="Ż���ϱ�"></td></tr>
		</table>
	</form>
</body>
</html>