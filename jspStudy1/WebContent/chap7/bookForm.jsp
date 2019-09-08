<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%-- /WebContent/chap7/bookFrom.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록 글쓰기</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
	<form action="book.jsp" method="post">
		<table>
			<tr><td>방문자</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr><td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr><td>내용</td>
				<td><textarea name="content" rows="5"></textarea></td>
			</tr>
			<tr><td colspan="2" align="center"><input type="submit" value="방명록등록"></td></tr>
		</table>
	</form>
</body>
</html>