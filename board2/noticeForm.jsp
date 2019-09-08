<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/board/noticeForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공지사항 글쓰기</title>
<link rel="stylesheet" href="/project1/css/project.css">
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
		<input type="hidden" name="id" value="${sessionScope.login }">
		<div>작성자</div><div><input type="text" name="name" value="관리자"></div>
		<div>비밀번호</div><div><input type="password" name="pass"></div>
		<div>제목</div><div><input type="text" name="subject" value="[공지]"></div>
		<div>내용</div><div><textarea rows="15" name="content"></textarea></div>
		<div>첨부파일</div><div><input type="file" name="file"></div>
		<div><a href="javascript:board_submit()">[게시물 등록]</a></div>
	</form>
</body>
</html>