<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/chap7/join.jsp --%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="join" class="chap7.Member" />  <%-- useBean이 자료형 자동변환해줌. -> 자바 스크립트에서 검증 필요. --%>
<jsp:setProperty property="*" name="join" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 결과</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
	<table>
		<tr><td>아이디</td>
			<td><%=join.getId() %></td>
		</tr>
		<tr><td>비밀번호</td>
			<td><%=join.getPass() %></td>
		</tr>
		<tr><td>이름</td>
			<td><%=join.getName() %></td>
		</tr>
		<tr><td>성별</td>
			<td><%=(join.getGender() == 1)?"남":"여" %></td>
		</tr>
		<tr><td>나이</td>
			<td><%=join.getAge() %></td>
		</tr>
		<tr><td>이메일</td>
			<td><%=join.getEmail() %></td>
		</tr>
	</table>
</body>
</html>