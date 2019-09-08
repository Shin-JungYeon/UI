<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/loginForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 화면</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
</head>
<body>
	<form action="login.me" method="post">
		<table>
			<caption>MODEL2 로그인</caption>
			<tr><td>아이디</td><td><input type="text" name="id"></td></tr>
			<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
			<tr><td colspan="2">
				<input type="submit" value="로그인">
				<input type="button" value="회원가입" onclick="location.href='joinForm.jsp'"></td>
			</tr>
		</table>
	</form>
</body>
</html>