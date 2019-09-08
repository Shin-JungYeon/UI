<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/replyForm.jsp --%>
<%--
	select * from board order ref desc, refstep asc
	num : ���� �Խñ� ��ȣ. ��� ���� ������� ��� +1.
	ref : ������ ref�� �״�� ����
	reflevel : �����Ǵ��:1, ����Ǵ��:2, ...
	refstep : ����-���-����Ǵ��-... ����
	
	1. ������ num�� �Ķ���ͷ� �޴´�.
	2. ������ num, ref, reflevel, refstep ������ db���� �о �����;� ��.
	3. �Է� ȭ�� ǥ��.
--%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDao dao = new BoardDao();
	Board board = dao.selectOne(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��� ���� ȭ��</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
<script type="text/javascript">
	function submit() {
		f = document.f;
		if(f.name.value == "") {
			alert("�۾��̸� �Է��ϼ���.");
			f.name.focus();
			return;
		}
		if(f.pass.value == "") {
			alert("��й�ȣ�� �Է��ϼ���.");
			f.pass.focus();
			return;
		}
		if(f.content.value == "") {
			alert("������ �Է��ϼ���.");
			f.content.focus();
			return;
		}
		f.submit();
	} 
</script>
</head>
<body>
	<form action="reply.jsp" method="post" name="f">
	<%-- ���ۿ� ���� ���� : num, ref, reflevel(0~999), refstep --%>
		<input type="hidden" name="num" value="<%=board.getNum() %>">
		<input type="hidden" name="ref" value="<%=board.getRef() %>">
		<input type="hidden" name="reflevel" value="<%=board.getReflevel() %>">
		<input type="hidden" name="refstep" value="<%=board.getRefstep() %>">
		<table>
			<caption>MODEL1 �Խ��� ��� ���</caption>
			<%-- ��ۿ� ���� ���� : name, pass, content. subject�� ������ ���� ������. --%>
			<tr><td>�۾���</td><td><input type="text" name="name"></td></tr>
			<tr><td>��й�ȣ</td><td><input type="password" name="pass"></td></tr>
			<tr><td>����</td><td><input type="text" name="subject" value="RE : <%=board.getSubject() %>"></td></tr>
			<tr><td>����</td><td><textarea name="content" rows="15"></textarea></td></tr>
			<tr><td colspan="2"><a href="javascript:document.f.submit()">[�亯�� ���]</a></td></tr>
		</table>
	</form>
</body>
</html>