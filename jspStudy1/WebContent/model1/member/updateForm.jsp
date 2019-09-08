<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/updateForm.jsp --%>
<%--
	1. id �Ķ���� ��������.
	2. login ���� ���� �ʿ�.
		- �α׾ƿ� ���� : "�α����� �ʿ��� �������Դϴ�." �޼��� ��� �� loginForm.jsp �������� �̵�.
	3. �α��� ����
		- id �Ķ���� ������ login ������ ���ؼ� �ٸ��� "�ڽ��� ������ ��ȸ �����մϴ�." �޼��� ��� �� info.jsp �������� �̵�.
		- id �Ķ���� ������ login ������ ���ؼ� �ٸ����� login�� �������� ���� id�� �α��� ������ ���� ��� ȭ�鿡 ���� ���. -> MemberDao().selectOne(id) �޼��� �̿�.
	4. db���� id�� �ش��ϴ� ȸ���� ������ ��ȸ�ؼ� ȭ�鿡 ���. 
--%>
<%
	String id = request.getParameter("id");
	String login = (String) session.getAttribute("login");
	
	if(login == null || login.trim().equals("")) { //�α����� �� �� ���.
%>
	<script>
		alert("�α����� �ʿ��� �������Դϴ�.");
		location.href="loginForm.jsp";
	</script>
<%
	} else if(!login.equals("admin") && !login.equals(id)) {  //�α����� ������ �����ڵ� �ƴϰ� �� id�� �ƴ� ���.
%>
	<script>
		alert("�ڽ��� ������ ���� �����մϴ�.");
		location.href="info.jsp?id=<%=login%>"  <%-- �Ķ���� �Է��ؼ� �ڽ��� ������ ���ư� �� �ְ� ����� ��. url�� ���� �־ �ڵ��ϱ� ����. --%>
	</script>
<%	
	} else {
		Member mem = new MemberDao().selectOne(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ���� ȭ��</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
<script type="text/javascript">
	function input_check(f) {
		if(f.pass.value == "") {
		<%	if(login.equals("admin")) { %>
				f.pass.value = "<%=mem.getPass() %>";
				return true;
		<%	} else { %>
				alert("��й�ȣ�� �Է��ϼ���.");
				f.pass.focus();
				return false;
		<%	} %>
		}
		return true;
	}
	function passchg_winopen() {
		var op = "width=500, height=230, left=50, top=150";
		open("passwordForm.jsp", "", op);  //���ο� â ����.
	}
	function win_upload() {
		var op = "windth=500, height=150, left=50, top=150";
		open("pictureimgForm.jsp", "", op);
	}
</script>
</head>
<body>
	<form action="update.jsp" name="f" method="post" onsubmit="return input_check(this)">  <%-- onsubmit : �̺�Ʈ ó�� --%>
		<input type="hidden" name="picture" value="<%=mem.getPicture() %>">
		<table>
			<caption>MODEL1 ȸ�� ���� ����</caption>
			<tr><td rowspan="4" valign="bottom">
					<img src="img/<%=mem.getPicture() %>" width="100" height="120" id="pic"><br>
					<font size="1"><a href="javascript:win_upload()">��������</a></font>
				</td>
				<td>���̵�</td><td><input type="text" name="id" value="<%=mem.getId() %>" readonly></td>  <%-- readonly : �����ֱ⸸ �ϰ� ���� �Ұ���. --%>
			</tr>
			<tr><td>��й�ȣ</td><td><input type="password" name="pass"></td></tr>
			<tr><td>�̸�</td><td><input type="text" name="name" value="<%=mem.getName() %>"></td></tr>
			<tr><td>����</td>
				<td><input type="radio" name="gender" value="1" <%=mem.getGender()==1?"checked":"" %>>��  <%-- radio ��ư�� Ư���� �������� üũ�� �����θ� ������. ������ ������ ���ǽ� �Ƚ��൵ ��. --%>
					<input type="radio" name="gender" value="2" <%=mem.getGender()==2?"checked":"" %>>��</td>
			</tr>
			<tr><td>��ȭ��ȣ</td><td colspan="2"><input type="text" name="tel" value="<%=mem.getTel() %>"></td></tr>
			<tr><td>�̸���</td><td colspan="2"><input type="text" name="email" value="<%=mem.getEmail() %>"></td></tr>
			<tr><td colspan="3">
					<input type="submit" value="ȸ������">
					<input type="button" value="��й�ȣ����" onclick="passchg_winopen()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<%	} %>