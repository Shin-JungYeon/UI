<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap7/joinFrom.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입화면</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
<%-- 
	입력된 내용이 join.jsp에 출력되도록 join.jsp 프로그램 작성하기
	단 uesBean 액션태그, setProperty 액션태그를 반드시 사용하기.
	사용되는 bean 클래스 : chap7.Member
 --%>
	<form action="join.jsp" method="post">
		<table>
			<caption>회원가입</caption>
			<tr><td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr><td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr><td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr><td>성별</td>
				<td><input type="radio" name="gender" value="1">남
					<input type="radio" name="gender" value="2">여</td>
			</tr>
			<tr><td>나이</td>
				<td><input type="text" name="age"></td>
			</tr>
			<tr><td>이메일</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr><td colspan="2" align="center"><input type="submit" value="회원가입"></td></tr>
		</table>
	</form>
</body>
</html>