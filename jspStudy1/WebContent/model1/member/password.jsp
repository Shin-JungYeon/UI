<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/password.jsp --%>
<%--
	1. ������ �α��� ���¿��� ��. �ٸ� ������� ��й�ȣ�� ���� �Ұ�. �����ڵ� �Ұ���.
	   �α׾ƿ������� ���. �α����� �ʿ��� �������Դϴ�. -> opener �������� login.jsp�� �̵�. ���� ������(��й�ȣ ���� ������)�� �ݱ�.
	2. pass, chgpass(2�� �ʿ� x) �Ķ���� �� ����.
	3. pass ��й�ȣ�� db�� ����� ��й�ȣ��
		- �ٸ� : ��й�ȣ ���� �޼��� ���. -> passwordForm.jsp�� ������ �̵�.
	 	- ���� : ��й�ȣ ����. -> opener �������� info.jsp�� ������ �̵�. ���� �������� �ݱ�.
--%>
<%
	String login = (String) session.getAttribute("login");
	boolean opener = false;
	String msg = null;
	String url = null;
	
	if(login == null || login.trim().equals("")) {  //�α׾ƿ� ����.
		opener = true;
		msg = "�α����� �ʿ��� �������Դϴ�.";
		url = "loginForm.jsp";
	} else {  //�α��� ����.
		String pass = request.getParameter("pass");
		String chgpass = request.getParameter("chgpass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		
		if(pass.equals(mem.getPass())) {  //�Էµ� ��й�ȣ�� db�� ����� ��й�ȣ�� ����.
			if(dao.updatePass(login, chgpass) > 0) {  //���� ����.
				msg = "��й�ȣ�� ����Ǿ����ϴ�.";
				url = "info.jsp?id=" + login;
				opener = true;
			} else {  //���� ����.
				msg = "���� �� ������ �߻��Ǿ����ϴ�.";
				url = "passwordForm.jsp";
			}
		} else {  //�Էµ� ��й�ȣ�� db�� ����� ��й�ȣ�� �ٸ�.
			msg = "��й�ȣ �����Դϴ�. �ٽ� �Է����ּ���.";
			url = "passwordForm.jsp";
		}
	}
%>
<script>
	alert("<%=msg %>");
	<%	if(opener) { %>
			opener.location.href="<%=url %>";
			self.close();  //���� window �ݱ�.
	<%	} else { %>
			location.href="<%=url %>";
	<%	} %>
</script>