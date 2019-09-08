<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/hw1_book1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록 글쓰기</title>
</head>
<body>
	<form action="hw1_book2.jsp" method="post">
		<table>
			<tr><td>방문자</td><td><input type="text" name="방문자"></td></tr>
			<tr><td>제목</td><td><input type="text" name="제목"></td></tr>
<!--		<tr><td>내용</td><td><input type="text" name="내용" style="width: 400px; height: 200px"></td></tr> -->
			<tr><td>내용</td><td><textarea rows="10" cols="60" name="내용"></textarea></td></tr>
			<tr><th colspan="2"><input type="submit" value="글쓰기"></th></tr>
		</table>
	</form>
</body>
</html>
