<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/board/informationForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �۾���</title>
<script type="text/javascript">
	function board_submit() {
		f = document.f;
		if(f.pass.value == "") {
			alert("��й�ȣ�� �Է��ϼ���.");
			f.pass.focus();
			return;
		}
		if(f.subject.value == "") {
			alert("������ �Է��ϼ���.");
			f.subject.focus();
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
	<form action="write.do" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="bclass" value="${param.bclass }">
		<table>
			<tr><td>����</td><td><input type="text" name="subject" value="[���� ����]"></td></tr>
			<tr><td>�ۼ���</td><td><input type="text" name="id"></td></tr>
			<tr><td>��й�ȣ</td><td><input type="password" name="pass"></td></tr>
			<tr><td colspan="2">
					<img src="" width="100" height="120" id="pic"><br>
					<font size="1"><a href="javascript:win_upload()">������ ���ε�</a></font>
				</td></tr>
			<tr><td>���� ����</td><td><input type="text" name="id"></td></tr>
			<tr>
				<td colspan="2">
					<textarea name="content"></textarea>
				</td>
			</tr>
			<tr><td colspan="2"><a href="javascript:board_submit()">[�Խù� ���]</a></td></tr>
		</table>
	</form>
</body>
</html>