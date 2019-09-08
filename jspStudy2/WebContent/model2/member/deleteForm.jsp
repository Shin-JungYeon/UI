<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/member/deleteForm.jsp --%>
<%--
	
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 탈퇴 비밀번호 확인</title>
<link rel="stylesheet" href="/jspStudy2/css/main.css">
</head>
<body>
	<form name="f" action="delete.me" method="post">
		<input type="hidden" name="id" value="${param.id }"> <%-- 화면에는 보이지 않지만 파라미터의 값은 입력이 되어서 가지고 있음. --%>
		<table>
			<caption>회원 정보 비밀번호 입력</caption>
			<tr><td>비밀번호</td>
				<td><input type="password" name="pass"></td></tr>
			<tr><td colspan="2"><input type="submit" value="탈퇴하기"></td></tr>
		</table>
	</form>
</body>
</html>