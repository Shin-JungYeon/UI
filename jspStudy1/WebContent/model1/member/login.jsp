<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/login.jsp --%>
<%-- 
	1. id, pass �Ķ���� ����.
	2. db���� id�� �ش��ϴ� �����͸� �о Member ��ü�� ���� �ޱ�.
	3. ��� �м�
		- ���� ���� Member ��ü�� null �� ��� :
			- ȭ�鿡 "���̵� Ȯ���ϼ���." �޼��� ��� �� loginForm.jsp �������� �̵�.
		- ���� ���� Member ��ü�� null �� �ƴ� ��� :
	       	- ȭ�鿡�� �Էµ� ��й�ȣ�� db ��й�ȣ�� ���� �� ����.
	       		- ���� ��� : �α��� ����. main.jsp�� ������ �̵�.
	       		- �ٸ� ��� : "��й�ȣ�� Ȯ���ϼ���." -> loginForm.jsp�� ������ �̵�.
 --%>
<%
	String id = request.getParameter("id");  //�α��� ȭ�鿡�� �Է��� id ��
	String pass = request.getParameter("pass");  //�α��� ȭ�鿡�� �Է��� pass ��
	//mem : db�� ����� ȸ�������� �ҷ��ͼ� ����.
	Member mem = new MemberDao().selectOne(id);
	String msg = "���̵� Ȯ���ϼ���.";
	String url = "loginForm.jsp";
	if(mem != null) {  //�Էµ� id�� ���� ������ ���� �� null ����.
		if(pass.equals(mem.getPass())) {  //id�� �ִٸ� �Էµ� ���� ����Ǿ��� �ִ� ���� ���� �� Ȯ��.
			session.setAttribute("login", id);  //�Է��� id���� login�̶�� session ��ü�� �����ϰ� �α����� �Ǿ� �ִ� ���� ����.
			msg = mem.getName() + "���� �α��� �ϼ̽��ϴ�.";  //�α����� �ȴٴ� ���� �� id�� ���� ȸ���� ������ ��� ������ �� �ֱ� ������ �̸��� ������ �� ����.
			url = "main.jsp";
		} else {
			msg = "��й�ȣ�� Ȯ���ϼ���.";
		}
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>

</body>
</html>