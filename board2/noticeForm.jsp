<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/board/noticeForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�������� �۾���</title>
<link rel="stylesheet" href="/project1/css/project.css">
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
		<input type="hidden" name="id" value="${sessionScope.login }">
		<div>�ۼ���</div><div><input type="text" name="name" value="������"></div>
		<div>��й�ȣ</div><div><input type="password" name="pass"></div>
		<div>����</div><div><input type="text" name="subject" value="[����]"></div>
		<div>����</div><div><textarea rows="15" name="content"></textarea></div>
		<div>÷������</div><div><input type="file" name="file"></div>
		<div><a href="javascript:board_submit()">[�Խù� ���]</a></div>
	</form>
</body>
</html>