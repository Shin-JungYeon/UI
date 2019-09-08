<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/join.jsp --%>
<%--
	1. 파라미터 정보를 Member 객체에 저장.
	2. Member 객체에 저장된 내용을 db에 저장. -> model 부분에서 처리.
	3. 성공 : loginForm.jsp 페이지로 이동.
	       실패 : joinForm.jsp 페이지로 이동.
--%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="mem" class="model.Member" /> <%-- 1. --%>
<jsp:setProperty property="*" name="mem" />
<%
	MemberDao dao = new MemberDao();  //model class를 통해서 db연결과 관련된 모든 것을 수행.
	int result = dao.insert(mem);  //2. 성공하면 1, 실패하면 0
	String msg = null;
	String url = null;
	
	if(result > 0) {  //가입 성공   3.
		msg = mem.getName() + "님의 회원 가입이 완료되었습니다.";
		url = "loginForm.jsp";
	} else {  //가입 실패
		msg = "회원 가입에 실패하였습니다.";
		url = "joinForm.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>