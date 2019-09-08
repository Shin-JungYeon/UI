<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/main.jsp --%>
<%--
	1. 로그인에 성공한 후에 보여지는 페이지
		- 로그인 여부 확인. -> 로그인 상태이면 남아있고, 아니라면 loginForm.jsp 페이지로 다시 보내줌.
--%>
<%
	String login = (String) session.getAttribute("login");
	if(login == null || login.trim().equals("")) {
		response.sendRedirect("loginForm.jsp");
	} else {
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원관리 프로그램</title>
</head>
<body>
	<h3><%=login %> 회원님 반갑습니다.</h3>
	<h3><a href="logout.jsp">로그아웃</a></h3>
	<h3><a href="info.jsp?id=<%=login %>">회원정보 보기</a></h3>
	<%
		if(login.equals("admin")) { %>
		<h3><a href="list.jsp">회원목록 보기</a></h3>		
	<%	} %>
</body>
</html>
<%	} %>