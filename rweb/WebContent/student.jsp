<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/student.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�л� ������ �м�</title>
</head>
<body>
	<form action="student.do" method="post"	>
		<table>
			<tr>
				<td><input type="radio" name="wh" value="1">��ո�����
					<input type="radio" name="wh" value="2">���Ű
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="gm" value="1">�г�
					<input type="radio" name="gm" value="2">�а�
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="gr" value="1">���� �׷���
					<input type="radio" name="gr" value="2">���� �׷���
				</td>
			</tr>
			<tr><td><input type="submit" value="�л����� �м��ϱ�"></td></tr>
		</table>
		<img src="img/student.png" id="graph"><br>
	</form>
</body>
</html>