<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/replyForm.jsp --%>
<%--
	select * from board order ref desc, refstep asc
	num : 고유 게시글 번호. 답글 원글 상관없이 계속 +1.
	ref : 원글의 ref값 그대로 유지
	reflevel : 원글의답글:1, 답글의답글:2, ...
	refstep : 원글-답글-답글의답글-... 순서
	
	1. 원글의 num을 파라미터로 받는다.
	2. 원글의 num, ref, reflevel, refstep 정보를 db에서 읽어서 가져와야 함.
	3. 입력 화면 표시.
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
<title>답글 쓰기 화면</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
<script type="text/javascript">
	function submit() {
		f = document.f;
		if(f.name.value == "") {
			alert("글쓴이를 입력하세요.");
			f.name.focus();
			return;
		}
		if(f.pass.value == "") {
			alert("비밀번호를 입력하세요.");
			f.pass.focus();
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
	<form action="reply.jsp" method="post" name="f">
	<%-- 원글에 대한 정보 : num, ref, reflevel(0~999), refstep --%>
		<input type="hidden" name="num" value="<%=board.getNum() %>">
		<input type="hidden" name="ref" value="<%=board.getRef() %>">
		<input type="hidden" name="reflevel" value="<%=board.getReflevel() %>">
		<input type="hidden" name="refstep" value="<%=board.getRefstep() %>">
		<table>
			<caption>MODEL1 게시판 답글 등록</caption>
			<%-- 답글에 대한 정보 : name, pass, content. subject는 원글의 제목 가져옴. --%>
			<tr><td>글쓴이</td><td><input type="text" name="name"></td></tr>
			<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
			<tr><td>제목</td><td><input type="text" name="subject" value="RE : <%=board.getSubject() %>"></td></tr>
			<tr><td>내용</td><td><textarea name="content" rows="15"></textarea></td></tr>
			<tr><td colspan="2"><a href="javascript:document.f.submit()">[답변글 등록]</a></td></tr>
		</table>
	</form>
</body>
</html>