<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/join.jsp --%>
<%--
	1. �Ķ���� ������ Member ��ü�� ����.
	2. Member ��ü�� ����� ������ db�� ����. -> model �κп��� ó��.
	3. ���� : loginForm.jsp �������� �̵�.
	       ���� : joinForm.jsp �������� �̵�.
--%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mem" class="model.Member" /> <%-- 1. --%>
<jsp:setProperty property="*" name="mem" />
<%
	MemberDao dao = new MemberDao();  //model class�� ���ؼ� db����� ���õ� ��� ���� ����.
	int result = dao.insert(mem);  //2. �����ϸ� 1, �����ϸ� 0
	String msg = null;
	String url = null;
	
	if(result > 0) {  //���� ����   3.
		msg = mem.getName() + "���� ȸ�� ������ �Ϸ�Ǿ����ϴ�.";
		url = "loginForm.jsp";
	} else {  //���� ����
		msg = "ȸ�� ���Կ� �����Ͽ����ϴ�.";
		url = "joinForm.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>