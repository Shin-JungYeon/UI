<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/password.jsp --%>
<%--
	1. 무조건 로그인 상태여야 함. 다른 사용자의 비밀번호는 변경 불가. 관리자도 불가능.
	   로그아웃상태인 경우. 로그인이 필요한 페이지입니다. -> opener 페이지를 login.jsp로 이동. 현재 페이지(비밀번호 변경 페이지)는 닫기.
	2. pass, chgpass(2는 필요 x) 파라미터 값 저장.
	3. pass 비밀번호가 db에 저장된 비밀번호와
		- 다름 : 비밀번호 오류 메세지 출력. -> passwordForm.jsp로 페이지 이동.
	 	- 같음 : 비밀번호 수정. -> opener 페이지를 info.jsp로 페이지 이동. 현재 페이지는 닫기.
--%>
<%
	String login = (String) session.getAttribute("login");
	boolean opener = false;
	String msg = null;
	String url = null;
	
	if(login == null || login.trim().equals("")) {  //로그아웃 상태.
		opener = true;
		msg = "로그인이 필요한 페이지입니다.";
		url = "loginForm.jsp";
	} else {  //로그인 상태.
		String pass = request.getParameter("pass");
		String chgpass = request.getParameter("chgpass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		
		if(pass.equals(mem.getPass())) {  //입력된 비밀번호와 db에 저장된 비밀번호가 같음.
			if(dao.updatePass(login, chgpass) > 0) {  //변경 성공.
				msg = "비밀번호가 변경되었습니다.";
				url = "info.jsp?id=" + login;
				opener = true;
			} else {  //변경 실패.
				msg = "변경 중 오류가 발생되었습니다.";
				url = "passwordForm.jsp";
			}
		} else {  //입력된 비밀번호와 db에 저장된 비밀번호가 다름.
			msg = "비밀번호 오류입니다. 다시 입력해주세요.";
			url = "passwordForm.jsp";
		}
	}
%>
<script>
	alert("<%=msg %>");
	<%	if(opener) { %>
			opener.location.href="<%=url %>";
			self.close();  //현재 window 닫기.
	<%	} else { %>
			location.href="<%=url %>";
	<%	} %>
</script>