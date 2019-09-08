<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/delete.jsp --%>
<%--
	1. 로그아웃 상태 : 로그인이 필요한 페이지 입니다. -> loginForm.jsp로 페이지 이동.
	       로그인 상태
	     - 일반 사용자 : 비밀번호 검증. -> 일치하면 db에서 id에 해당하는 정보 삭제.
	     						     로그아웃 후 탈퇴성공 메세지 출력. -> loginForm.jsp로 페이지 이동.
								     삭제 실패시 실패 메세지 출력 후 main.jsp로 페이지 이동.
	     					   -> 불일치하면 비밀번호 불일치 메세지 출력 후 deleteForm.jsp로 페이지 이동.
	     - 관리자 : db에서 해당 id 정보 삭제.
	     		   탈퇴 성공 메세시 출력 후 list.jsp로 페이지 이동.
	     		   삭제 실패시 실패 메세지 출력 후 list.jsp로 페이지 이동.
--%>
<%
	String msg = null;
	String url = null;
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = (String) session.getAttribute("login");
	
	if(login == null || login.trim().equals("")) {
		msg = "로그인이 필요한 페이지입니다.";
		url = "loginForm.jsp";
	} else if(!login.equals(id) && !login.equals("admin")) {  //일반 사용자가 다른 사람의 id 삭제하려고 할 때
		msg = "본인만 접근 가능한 페이지 입니다.";
		url = "main.jsp";
	} else if(id.equals("admin")) {  //관리자 정보는 탈퇴 불가.
		msg = "관리자는 탈퇴할 수 없습니다.";
		url = "main.jsp";
	} else {
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(id);
		if(login.equals("admin") || pass.equals(mem.getPass())) {  //앞 조건이 참이면 뒤 조건은 볼 필요도 없음.
			int result = dao.delete(id);
			if(result > 0) {  //삭제 성공
				if(login.equals("admin")) {
					msg = "관리자에 의해 " + id + "님이 탈퇴되었습니다.";
					url = "list.jsp";
				} else {
					msg = id + "님의 회원 탈퇴가 완료되었습니다.";
					url = "loginForm.jsp";
					session.invalidate();
				}
			} else {  //삭제 실패
				msg = id + "님의 탈퇴에 실패하였습니다.";
				if(login.equals("admin")) {
					url = "list.jsp";
				} else {
					url = "main.jsp";
				}
			}
		} else {
			msg = id + "님의 비밀번호가 틀립니다.";
			url = "deleteForm.jsp?id=" + id;
		}
	}
	
/*
	if(login == null || login.trim().equals("")) {
		msg = "로그인이 필요한 페이지입니다.";
		url = "loginForm.jsp";
	} else {
		if(!mem.getPass().equals(dbMem.getPass())) {
			msg = "비밀번호가 잘못되었습니다.";
			url = "deleteForm.jsp?id=" + mem.getId();
		} else {
			if(login.equals("admin") && dao.delete(mem) > 0 ) {  //관리자
				msg = "관리자에 의해 " + mem.getId() + "님의 탈퇴가 완료되었습니다.";
				url = "list.jsp";
			} else if(login.equals("admin") && dao.delete(mem) <= 0 ) {
				msg = mem.getId() + "님의 탈퇴에 실패하였습니다.";
				url = "list.jsp";
			} else {  //일반사용자
				if(dao.delete(mem) > 0) {
					msg = mem.getId() + "님의 회원 탈퇴가 완료되었습니다.";
					url = "loginForm.jsp";
				} else {
					msg = "회원 탈퇴에 실패하였습니다.";
					url = "main.jsp?id=" + mem.getId();
				}
			}
		}
	}
*/
%>
<<script type="text/javascript">
	alert("<%=msg %>");
	location.href="<%=url %>";
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