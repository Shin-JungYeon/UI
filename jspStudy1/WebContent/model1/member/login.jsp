<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/login.jsp --%>
<%-- 
	1. id, pass 파라미터 저장.
	2. db에서 id에 해당하는 데이터를 읽어서 Member 객체로 전달 받기.
	3. 결과 분석
		- 전달 받은 Member 객체가 null 인 경우 :
			- 화면에 "아이디를 확인하세요." 메세지 띄운 후 loginForm.jsp 페이지로 이동.
		- 전달 받은 Member 객체가 null 이 아닌 경우 :
	       	- 화면에서 입력된 비밀번호와 db 비밀번호와 같은 지 검증.
	       		- 같은 경우 : 로그인 성공. main.jsp로 페이지 이동.
	       		- 다른 경우 : "비밀번호를 확인하세요." -> loginForm.jsp로 페이지 이동.
 --%>
<%
	String id = request.getParameter("id");  //로그인 화면에서 입력한 id 값
	String pass = request.getParameter("pass");  //로그인 화면에서 입력한 pass 값
	//mem : db에 저장된 회원정보를 불러와서 저장.
	Member mem = new MemberDao().selectOne(id);
	String msg = "아이디를 확인하세요.";
	String url = "loginForm.jsp";
	if(mem != null) {  //입력된 id와 같은 정보가 없을 때 null 리턴.
		if(pass.equals(mem.getPass())) {  //id가 있다면 입력된 값과 저장되어져 있는 값이 같은 지 확인.
			session.setAttribute("login", id);  //입력한 id값을 login이라는 session 객체에 저장하고 로그인이 되어 있는 상태 저장.
			msg = mem.getName() + "님이 로그인 하셨습니다.";  //로그인이 된다는 것은 그 id를 가진 회원의 정보를 모두 가져올 수 있기 때문에 이름도 가져올 수 있음.
			url = "main.jsp";
		} else {
			msg = "비밀번호를 확인하세요.";
		}
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>

</body>
</html>