<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/deleteForm.jsp --%>
<%--
	1. 
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� Ż�� ��й�ȣ Ȯ��</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
	<form nam="f" action="delete.jsp" method="post">
		<input type="hidden" name="id" value="<%=request.getParameter("id") %>"> <%-- ȭ�鿡�� ������ ������ �Ķ������ ���� �Է��� �Ǿ ������ ����. --%>
		<table>
			<caption>ȸ�� ���� ��й�ȣ �Է�</caption>
			<tr><td>��й�ȣ</td>
				<td><input type="password" name="pass"></td></tr>
			<tr><td colspan="2"><input type="submit" value="Ż���ϱ�"></td></tr>
		</table>
	</form>
</body>
</html>