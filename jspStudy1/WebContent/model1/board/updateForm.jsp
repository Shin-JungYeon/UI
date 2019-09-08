<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/updateForm.jsp --%>
<%--
	1. num ���� �Խù��� ��ȸ�Ͽ� ȭ�� ����ϱ�.
--%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	Board board = new BoardDao().selectOne(num);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� ���� ȭ��</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
<script type="text/javascript">
	function file_delete() {
		document.f.file2.value="";  //������ ���� ����.
		file_desc.style.display="none";  //ȭ�鿡�� div �κ��� ������ �ʰ� ����.
	}
</script>
</head>
<body>
	<form action="update.jsp" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="num" value="<%=board.getNum() %>">  <%-- ���������� �Խù��� �������ִ� key���̱� ������ ������ �ʿ�� ������ �� �����;� ��. --%>
		<input type="hidden" name="file2" value="<%=((board.getFile1()==null)?"":board.getFile1()) %>">  <%-- file1�� �״�� ����ϸ� ������ ���� �� null��. null�� �� ���ڿ��� �ٲ��ֱ� ����. --%>
		<table>
			<caption>MODEL1 �Խ��� ���� ȭ��</caption>
			<tr><td>�۾���</td><td><input type="text" name="name" value="<%=board.getName() %>"></td></tr>
			<tr><td>��й�ȣ</td><td><input type="password" name="pass"></td></tr>
			<tr><td>����</td><td><input type="text" name="subject" value="<%=board.getSubject() %>"></td></tr>
			<tr><td>����</td><td><textarea name="content" rows="15"><%=board.getContent() %></textarea></td></tr>
			<tr><td>÷������</td>
				<td style="text-align: left">
				<% if(board.getFile1() != null && !(board.getFile1().equals(""))) { %>
					<div id="file_desc"><%=board.getFile1() %>
						<a href="javascript:file_delete()">[÷������ ����]</a>
					</div>
				<% } %>
					<input type="file" name="file1">
				</td></tr>
			<tr><td colspan="2"><a href="javascript:document.f.submit()">[�Խù� ����]</a></td></tr>
		</table>
	</form>
</body>
</html>