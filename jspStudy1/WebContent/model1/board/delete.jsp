<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/delete.jsp --%>
<%--
	1. num, pass �Ķ���͸� ������ ����.
	2. �Էµ� ��й�ȣ�� db ��й�ȣ�� ������ ����.
		- �ٸ� ��� : ��й�ȣ ���� �޼��� ��� �� deleteForm.jsp�� ������ �̵�.
	3. �Խù� ����.
		- ���� : ���� ���� �޼��� ��� �� list.jsp�� ������ �̵�.
		- ���� : ���� ���� �޼��� ��� �� info.jsp�� ������ �̵�.
--%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pass = request.getParameter("pass");
	String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է����ּ���.";
	String url = "deleteForm.jsp?num=" + num;
	
	BoardDao dao = new BoardDao();
	Board dbboard = dao.selectOne(num);
	
	if(pass.equals(dbboard.getPass())) {
		if(dao.delete(num)) {
			msg = "�Խù� ������ �Ϸ�Ǿ����ϴ�.";
			url = "list.jsp";
		} else {
			msg = "�Խù� ������ �����Ͽ����ϴ�.";
			url = "info.jsp?num=" + num;
		}
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>