<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap7/joinFrom.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ȭ��</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
<%-- 
	�Էµ� ������ join.jsp�� ��µǵ��� join.jsp ���α׷� �ۼ��ϱ�
	�� uesBean �׼��±�, setProperty �׼��±׸� �ݵ�� ����ϱ�.
	���Ǵ� bean Ŭ���� : chap7.Member
 --%>
	<form action="join.jsp" method="post">
		<table>
			<caption>ȸ������</caption>
			<tr><td>���̵�</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr><td>��й�ȣ</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr><td>�̸�</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr><td>����</td>
				<td><input type="radio" name="gender" value="1">��
					<input type="radio" name="gender" value="2">��</td>
			</tr>
			<tr><td>����</td>
				<td><input type="text" name="age"></td>
			</tr>
			<tr><td>�̸���</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr><td colspan="2" align="center"><input type="submit" value="ȸ������"></td></tr>
		</table>
	</form>
</body>
</html>