<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap7/join.jsp --%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="join" class="chap7.Member" />  <%-- useBean�� �ڷ��� �ڵ���ȯ����. -> �ڹ� ��ũ��Ʈ���� ���� �ʿ�. --%>
<jsp:setProperty property="*" name="join" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ���</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
	<table>
		<tr><td>���̵�</td>
			<td><%=join.getId() %></td>
		</tr>
		<tr><td>��й�ȣ</td>
			<td><%=join.getPass() %></td>
		</tr>
		<tr><td>�̸�</td>
			<td><%=join.getName() %></td>
		</tr>
		<tr><td>����</td>
			<td><%=(join.getGender() == 1)?"��":"��" %></td>
		</tr>
		<tr><td>����</td>
			<td><%=join.getAge() %></td>
		</tr>
		<tr><td>�̸���</td>
			<td><%=join.getEmail() %></td>
		</tr>
	</table>
</body>
</html>