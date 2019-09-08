<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/list.jsp --%>
<%--
	1. �α׾ƿ� ���� : �α��� �ϼ���. �޼��� ��� -> loginForm.jsp�� ������ �̵�.
	2. �α��� ���� : �ݵ�� admin���� �α��εǾ�� ��.
		- �Ϲ� ����� �α��� : �����ڸ� ��ȸ�� �����մϴ�. -> main.jsp�� ������ �̵�.
	3. ȸ�� ����� ��ȸ�Ͽ� ȭ�鿡 ����ϱ�.
--%>
<%
	String login = (String) session.getAttribute("login");
	
	if(login == null || login.trim().equals("")) {  //�α׾ƿ� ����. %>
	<script>
		alert("�����ڷ� �α����ϼ���.");
		location.href="loginForm.jsp";
	</script>
<%	} else if(!login.equals("admin")) {  //�Ϲ� ����� �α��� ����. %>
	<script>
		alert("�����ڸ� ��ȸ�� �����մϴ�.");
		location.href= "main.jsp";
	</script>
<%	} else {  //������ �α��� ����. 
		List<Member> list = new MemberDao().list();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ��� ��ȸ</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
<script type="text/javascript">
	function del(id) {
		if(confirm(id + "���� ������ Ż�� ��Ű�ðڽ��ϱ�?") == true) {
			location.href = "delete.jsp?id=" + id;
		}
	}
</script>
</head>
<body>
	<table>
		<caption>MODEL1 ȸ�� ���</caption>
		<tr><th>����</th><th>���̵�</th><th>�̸�</th><th>����</th><th>��ȭ��ȣ</th><th>&nbsp;</th></tr>
		<%	for(Member m : list) { %>
			<tr><td><img src="img/<%=m.getPicture() %>" width="30" height="40"></td>
				<td><a href="info.jsp?id=<%=m.getId() %>"><%=m.getId() %></a></td>
				<td><%=m.getName() %></td>
				<td><%=m.getGender()==1?"����":"����" %></td>
				<td><%=m.getTel() %></td>
				<td><a href="updateForm.jsp?id=<%=m.getId() %>">[����]</a>
				<% 	if(!m.getId().equals("admin")) { %>
				<%-- <a href="delete.jsp?id=<%=m.getId() %>" onclick="return delchk(this)">[����Ż��]</a> --%>
					<a href="javascript:del('<%=m.getId() %>')">[����Ż��]</a>  <%-- �ٷ� �ٸ� �������� �̵��ϴ� ���� �ƴ϶� �ڹٽ�ũ��Ʈ�� �ִ� del�Լ��� ȣ��. --%>
				<%	} %>
				</td>
			</tr>
		<%	} %>
	</table>
</body>
</html>
<%	} %>
