<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����Ʈ ��ǰ ���</title>
<script type="text/javascript">
	if(f.pass.value == "") {
		alert("��й�ȣ�� �Է��ϼ���.");
		f.pass.focus();
		return;
	}
</script>
</head>
<body>
	<div>
		<form action="pitemadd.do" method="post" enctype="multipart/form-data" name="f">
			<table>
				<tr><td>��ǰ �̹���</td>
					<td><input type="file" name="itemimg" style="width: 300px;"></td>
				</tr>
				<tr>
					<td>��ǰ �̸�</td>
					<td><input type="text" name="name" style="width: 300px;"></td>
				</tr>
				<tr>
					<td>��ǰ ����Ʈ</td>
					<td><input type="text" name="point" style="width: 300px;"></td>
				</tr>
				<tr><td colspan="2"><input type="submit" value="��ǰ���"></td></tr>
				<tr><td>��й�ȣ</td><td><input type="password" name="pass"></td></tr>
			</table>
		</form>
	</div>
</body>
</html>