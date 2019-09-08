<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/board/informationForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>정보 글쓰기</title>
<script type="text/javascript">
	function board_submit() {
		f = document.f;
		if(f.pass.value == "") {
			alert("비밀번호를 입력하세요.");
			f.pass.focus();
			return;
		}
		if(f.subject.value == "") {
			alert("제목을 입력하세요.");
			f.subject.focus();
			return;
		}
		if(f.content.value == "") {
			alert("내용을 입력하세요.");
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
			<tr><td>제목</td><td><input type="text" name="subject" value="[연극 정보]"></td></tr>
			<tr><td>작성자</td><td><input type="text" name="id"></td></tr>
			<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
			<tr><td colspan="2">
					<img src="" width="100" height="120" id="pic"><br>
					<font size="1"><a href="javascript:win_upload()">포스터 업로드</a></font>
				</td></tr>
			<tr><td>연극 제목</td><td><input type="text" name="id"></td></tr>
			<tr>
				<td colspan="2">
					<textarea name="content"></textarea>
				</td>
			</tr>
			<tr><td colspan="2"><a href="javascript:board_submit()">[게시물 등록]</a></td></tr>
		</table>
	</form>
</body>
</html>