<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/delete.jsp --%>
<%--
	1. �α׾ƿ� ���� : �α����� �ʿ��� ������ �Դϴ�. -> loginForm.jsp�� ������ �̵�.
	       �α��� ����
	     - �Ϲ� ����� : ��й�ȣ ����. -> ��ġ�ϸ� db���� id�� �ش��ϴ� ���� ����.
	     						     �α׾ƿ� �� Ż�𼺰� �޼��� ���. -> loginForm.jsp�� ������ �̵�.
								     ���� ���н� ���� �޼��� ��� �� main.jsp�� ������ �̵�.
	     					   -> ����ġ�ϸ� ��й�ȣ ����ġ �޼��� ��� �� deleteForm.jsp�� ������ �̵�.
	     - ������ : db���� �ش� id ���� ����.
	     		   Ż�� ���� �޼��� ��� �� list.jsp�� ������ �̵�.
	     		   ���� ���н� ���� �޼��� ��� �� list.jsp�� ������ �̵�.
--%>
<%
	String msg = null;
	String url = null;
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = (String) session.getAttribute("login");
	
	if(login == null || login.trim().equals("")) {
		msg = "�α����� �ʿ��� �������Դϴ�.";
		url = "loginForm.jsp";
	} else if(!login.equals(id) && !login.equals("admin")) {  //�Ϲ� ����ڰ� �ٸ� ����� id �����Ϸ��� �� ��
		msg = "���θ� ���� ������ ������ �Դϴ�.";
		url = "main.jsp";
	} else if(id.equals("admin")) {  //������ ������ Ż�� �Ұ�.
		msg = "�����ڴ� Ż���� �� �����ϴ�.";
		url = "main.jsp";
	} else {
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(id);
		if(login.equals("admin") || pass.equals(mem.getPass())) {  //�� ������ ���̸� �� ������ �� �ʿ䵵 ����.
			int result = dao.delete(id);
			if(result > 0) {  //���� ����
				if(login.equals("admin")) {
					msg = "�����ڿ� ���� " + id + "���� Ż��Ǿ����ϴ�.";
					url = "list.jsp";
				} else {
					msg = id + "���� ȸ�� Ż�� �Ϸ�Ǿ����ϴ�.";
					url = "loginForm.jsp";
					session.invalidate();
				}
			} else {  //���� ����
				msg = id + "���� Ż�� �����Ͽ����ϴ�.";
				if(login.equals("admin")) {
					url = "list.jsp";
				} else {
					url = "main.jsp";
				}
			}
		} else {
			msg = id + "���� ��й�ȣ�� Ʋ���ϴ�.";
			url = "deleteForm.jsp?id=" + id;
		}
	}
	
/*
	if(login == null || login.trim().equals("")) {
		msg = "�α����� �ʿ��� �������Դϴ�.";
		url = "loginForm.jsp";
	} else {
		if(!mem.getPass().equals(dbMem.getPass())) {
			msg = "��й�ȣ�� �߸��Ǿ����ϴ�.";
			url = "deleteForm.jsp?id=" + mem.getId();
		} else {
			if(login.equals("admin") && dao.delete(mem) > 0 ) {  //������
				msg = "�����ڿ� ���� " + mem.getId() + "���� Ż�� �Ϸ�Ǿ����ϴ�.";
				url = "list.jsp";
			} else if(login.equals("admin") && dao.delete(mem) <= 0 ) {
				msg = mem.getId() + "���� Ż�� �����Ͽ����ϴ�.";
				url = "list.jsp";
			} else {  //�Ϲݻ����
				if(dao.delete(mem) > 0) {
					msg = mem.getId() + "���� ȸ�� Ż�� �Ϸ�Ǿ����ϴ�.";
					url = "loginForm.jsp";
				} else {
					msg = "ȸ�� Ż�� �����Ͽ����ϴ�.";
					url = "main.jsp?id=" + mem.getId();
				}
			}
		}
	}
*/
%>
<<script type="text/javascript">
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>