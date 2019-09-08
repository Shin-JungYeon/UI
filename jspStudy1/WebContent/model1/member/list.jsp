<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/list.jsp --%>
<%--
	1. 로그아웃 상태 : 로그인 하세요. 메세지 출력 -> loginForm.jsp로 페이지 이동.
	2. 로그인 상태 : 반드시 admin으로 로그인되어야 함.
		- 일반 사용자 로그인 : 관리자만 조회가 가능합니다. -> main.jsp로 페이지 이동.
	3. 회원 목록을 조회하여 화면에 출력하기.
--%>
<%
	String login = (String) session.getAttribute("login");
	
	if(login == null || login.trim().equals("")) {  //로그아웃 상태. %>
	<script>
		alert("관리자로 로그인하세요.");
		location.href="loginForm.jsp";
	</script>
<%	} else if(!login.equals("admin")) {  //일반 사용자 로그인 상태. %>
	<script>
		alert("관리자만 조회가 가능합니다.");
		location.href= "main.jsp";
	</script>
<%	} else {  //관리자 로그인 상태. 
		List<Member> list = new MemberDao().list();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 목록 조회</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
<script type="text/javascript">
	function del(id) {
		if(confirm(id + "님을 정말로 탈퇴 시키시겠습니까?") == true) {
			location.href = "delete.jsp?id=" + id;
		}
	}
</script>
</head>
<body>
	<table>
		<caption>MODEL1 회원 목록</caption>
		<tr><th>사진</th><th>아이디</th><th>이름</th><th>성별</th><th>전화번호</th><th>&nbsp;</th></tr>
		<%	for(Member m : list) { %>
			<tr><td><img src="img/<%=m.getPicture() %>" width="30" height="40"></td>
				<td><a href="info.jsp?id=<%=m.getId() %>"><%=m.getId() %></a></td>
				<td><%=m.getName() %></td>
				<td><%=m.getGender()==1?"남자":"여자" %></td>
				<td><%=m.getTel() %></td>
				<td><a href="updateForm.jsp?id=<%=m.getId() %>">[수정]</a>
				<% 	if(!m.getId().equals("admin")) { %>
				<%-- <a href="delete.jsp?id=<%=m.getId() %>" onclick="return delchk(this)">[강제탈퇴]</a> --%>
					<a href="javascript:del('<%=m.getId() %>')">[강제탈퇴]</a>  <%-- 바로 다른 페이지로 이동하는 것이 아니라 자바스크립트에 있는 del함수를 호출. --%>
				<%	} %>
				</td>
			</tr>
		<%	} %>
	</table>
</body>
</html>
<%	} %>
