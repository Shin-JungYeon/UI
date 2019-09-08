<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/info.jsp --%>
<%--
	1. id��� �Ķ���� ���� �޾ƿ�.
	2. login ���� ���� �ʿ�.
		- �α׾ƿ� ���� : "�α����� �ʿ��� �������Դϴ�." �޼��� ��� �� loginForm.jsp �������� �̵�.
	3. �α��� ����
		- id �Ķ���� ������ login ������ ���ؼ� �ٸ��� "�ڽ��� ������ ��ȸ �����մϴ�." �޼��� ��� �� main.jsp �������� �̵�.
		- id �Ķ���� ������ login ������ ���ؼ� �ٸ����� login�� �������� ���� id�� �α��� ������ ���� ��� ȭ�鿡 ���� ���. -> MemberDao().selectOne(id) �޼��� �̿�.
	4. �����ڷ� �α����� ���, �ڽ��� ���� ��ȸ�ϴ� ��� ȭ�鿡 ����ϱ�.
--%>
<%
	String id = request.getParameter("id");
	String login = (String) session.getAttribute("login");
	
	if(login == null || login.trim().equals("")) { //�α����� �� �� ���. or �����ڸ� ����� ���� ���� true�� ���� ������ ���� �غ����� ����. ������ �տ� �� �� �� ����.
%>
	<script>
		alert("�α����� �ʿ��� �������Դϴ�.");
		location.href="loginForm.jsp";
	</script>
<%
	} else if(!login.equals("admin") && !login.equals(id)) {  //�α����� ������ �����ڵ� �ƴϰ� �� id�� �ƴ� ���.
%>
	<script>
		alert("�ڽ��� ������ ��ȸ �����մϴ�.");
		location.href="main.jsp";
	</script>
<%	
	} else {  //�� id�� �α��� �� ��� db���� ��ȸ�ؼ� ��������.
		Member mem = new MemberDao().selectOne(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ����</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
	<table>
		<caption>MODEL1 ȸ�� ���� ����</caption>
		<tr>
			<td rowspan="6">
				<img src="img/<%=mem.getPicture() %>" width="100" height="120">
			</td>
			<td>���̵�</td><td><%=mem.getId() %></td>
		</tr>
		<tr><td>�̸�</td><td><%=mem.getName() %></td></tr>
		<tr><td>����</td><td><%=mem.getGender()==1?"����":"����" %></td></tr>
		<tr><td>��ȭ��ȣ</td><td><%=mem.getTel() %></td></tr>
		<tr><td>�̸���</td><td><%=mem.getEmail() %></td></tr>
		<tr><td colspan="2">
				<a href="updateForm.jsp?id=<%=mem.getId() %>">[����]</a>
				<%	if(!id.equals("admin")) { %>
					<a href="deleteForm.jsp?id=<%=mem.getId() %>">[Ż��]</a>
				<%	} %>
			</td>
		</tr>
	</table>
</body>
</html>
<%	} %>