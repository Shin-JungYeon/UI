<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/board/reviewForm.jsp --%>
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
		<div>
			<select name="genre">
				<option>�帣</option>
				<option value="�θǽ�">�θǽ�</option>
				<option value="����">����</option>
				<option value="���">���</option>
				<option value="��Ÿ��">��Ÿ��</option>
				<option value="�߸�������">�߸�������</option>
			</select>
			<select name="watchdate">
				<option>������¥</option>
				
			</select>
			<select name="watchloc">
				<option>��������</option>
				<option value="����">����</option>
				<option value="���">���</option>
				<option value="��õ">��õ</option>
				<option value="�λ�">�λ�</option>
			</select>
			<select name="grade">
				<option>����</option>
				<option value="1">�ڡ١١١�</option>
				<option value="2">�ڡڡ١١�</option>
				<option value="3">�ڡڡڡ١�</option>
				<option value="4">�ڡڡڡڡ�</option>
				<option value="5">�ڡڡڡڡ�</option>
			</select>
		</div><br>
		<div>�ۼ���</div><div><input type="text" name="id" value="${sessionScope.login }"></div>
		<div>��й�ȣ</div><div><input type="password" name="pass"></div>
		<div>����</div><div><input type="text" name="subject"></div>
		<div>����</div><div><textarea rows="15" name="content"></textarea></div>
		<div>÷������</div><div><input type="file" name="file"></div>
		<div><a href="javascript:board_submit()">[�Խù� ���]</a></div>
	</form>
</body>
</html>