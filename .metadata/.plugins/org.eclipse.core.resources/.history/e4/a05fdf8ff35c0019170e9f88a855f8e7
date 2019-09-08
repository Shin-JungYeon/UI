<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/info.jsp --%>
<%--
	1. id라는 파라미터 값을 받아옴.
	2. login 상태 검증 필요.
		- 로그아웃 상태 : "로그인이 필요한 페이지입니다." 메세지 출력 후 loginForm.jsp 페이지로 이동.
	3. 로그인 상태
		- id 파라미터 정보와 login 정보를 비교해서 다르면 "자신의 정보만 조회 가능합니다." 메세지 출력 후 main.jsp 페이지로 이동.
		- id 파라미터 정보와 login 정보를 비교해서 다르지만 login이 관리자인 경우와 id와 로그인 정보가 같은 경우 화면에 내용 출력. -> MemberDao().selectOne(id) 메서드 이용.
	4. 관리자로 로그인한 경우, 자신의 정보 조회하는 경우 화면에 출력하기.
--%>
<%
	String id = request.getParameter("id");
	String login = (String) session.getAttribute("login");
	
	if(login == null || login.trim().equals("")) { //로그인이 안 된 경우. or 연산자를 사용할 때는 앞이 true면 뒤의 조건은 실행 해보지도 않음. 무엇을 앞에 쓸 지 잘 생각.
%>
	<script>
		alert("로그인이 필요한 페이지입니다.");
		location.href="loginForm.jsp";
	</script>
<%
	} else if(!login.equals("admin") && !login.equals(id)) {  //로그인은 됐지만 관리자도 아니고 내 id도 아닌 경우.
%>
	<script>
		alert("자신의 정보만 조회 가능합니다.");
		location.href="main.jsp";
	</script>
<%	
	} else {  //내 id로 로그인 된 경우 db에서 조회해서 가져오기.
		Member mem = new MemberDao().selectOne(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 보기</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
	<table>
		<caption>MODEL1 회원 정보 보기</caption>
		<tr>
			<td rowspan="6">
				<img src="img/<%=mem.getPicture() %>" width="100" height="120">
			</td>
			<td>아이디</td><td><%=mem.getId() %></td>
		</tr>
		<tr><td>이름</td><td><%=mem.getName() %></td></tr>
		<tr><td>성별</td><td><%=mem.getGender()==1?"남자":"여자" %></td></tr>
		<tr><td>전화번호</td><td><%=mem.getTel() %></td></tr>
		<tr><td>이메일</td><td><%=mem.getEmail() %></td></tr>
		<tr><td colspan="2">
				<a href="updateForm.jsp?id=<%=mem.getId() %>">[수정]</a>
				<%	if(!id.equals("admin")) { %>
					<a href="deleteForm.jsp?id=<%=mem.getId() %>">[탈퇴]</a>
				<%	} %>
			</td>
		</tr>
	</table>
</body>
</html>
<%	} %>