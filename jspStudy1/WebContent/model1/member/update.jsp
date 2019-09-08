<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/update.jsp --%>
<%--
	1. ��� �Ķ���͸� Member ��ü�� �����ϱ�. useBean
	2. �Էµ� ��й�ȣ�� db�� ��й�ȣ�� ������ 3������ ����.
	       �ٸ��� ��й�ȣ ���� �޼��� ���. -> updateForm.jsp�� ������ �̵�.
	3. 1���� Member ��ü�� db�� �����ϱ�. int update(Member)
		- ����� 1 �̻� : "������ �Ϸ�Ǿ����ϴ�." -> main.jsp�� ������ �̵�.
		- ����� 0 : "������ �����Ͽ����ϴ�." -> updateForm.jsp�� ������ �̵�.
--%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mem" class="model.Member" />  <%-- �Ķ���Ϳ� �ִ� ���� ���� mem�� ���� ����. ��Ŭ������ ��������� �Ķ���� �̸��� ���⶧���� ����. --%>
<jsp:setProperty property="*" name="mem" />
<%
	String msg = null;
	String url = null;	
	System.out.println(mem);
	MemberDao dao = new MemberDao();
	Member dbMem = dao.selectOne(mem.getId());  //db�� ����Ǿ� �ִ� ����. id�� ���� �Ұ��̹Ƿ� id�� ���� ������.
	String login = (String) session.getAttribute("login");
	
	
	if(!mem.getPass().equals(dbMem.getPass())) {  //mem.getPass() : �Էµ� ����.
		msg = "��й�ȣ�� �߸��Ǿ����ϴ�.";
		url = "updateForm.jsp?id=" + mem.getId();
	} else {
		if(login.equals("admin") && dao.update(mem) > 0) {
			msg = "�����ڿ� ���� " + mem.getId() + "���� ȸ�� ���� ������ �Ϸ�Ǿ����ϴ�.";
			url = "info.jsp?id=" + mem.getId();
		} else {
			if(dao.update(mem) > 0) {  //update ����.
				msg = mem.getId() + "���� ȸ�� ���� ������ �Ϸ�Ǿ����ϴ�.";
				url = "info.jsp?id=" + mem.getId();
			} else {  //update ����.
				msg = mem.getId() + "���� ȸ�� ���� ������ �����Ͽ����ϴ�. �ٽ� �Է����ּ���.";
				url = "updateForm.jsp?id=" + mem.getId();
			}
		}
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>