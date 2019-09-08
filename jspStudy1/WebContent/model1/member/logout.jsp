<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/logout.jsp --%>
<%--
	1. session에 등록된 로그인 정보 제거.
	2. "id님 로그아웃 되었습니다." 메세지 출력 후 loginForm.jsp 페이지로 이동.
--%>

<%
	String login = (String) session.getAttribute("login");
	session.invalidate();  //이 방법 더 많이 씀.
	//session.removeAttribute("login");
%>
<script>
	alert("<%=login %>님 로그아웃 되었습니다.");
	location.href="loginForm.jsp";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>