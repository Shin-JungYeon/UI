<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/delete.jsp --%>
<%--
	1. num, pass 파라미터를 변수에 저장.
	2. 입력된 비밀번호와 db 비밀번호가 같은지 검증.
		- 다른 경우 : 비밀번호 오류 메세지 출력 후 deleteForm.jsp로 페이지 이동.
	3. 게시물 삭제.
		- 성공 : 삭제 성공 메세지 출력 후 list.jsp로 페이지 이동.
		- 실팽 : 삭제 실패 메세지 출력 후 info.jsp로 페이지 이동.
--%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pass = request.getParameter("pass");
	String msg = "비밀번호가 틀렸습니다. 다시 입력해주세요.";
	String url = "deleteForm.jsp?num=" + num;
	
	BoardDao dao = new BoardDao();
	Board dbboard = dao.selectOne(num);
	
	if(pass.equals(dbboard.getPass())) {
		if(dao.delete(num)) {
			msg = "게시물 삭제가 완료되었습니다.";
			url = "list.jsp";
		} else {
			msg = "게시물 삭제에 실패하였습니다.";
			url = "info.jsp?num=" + num;
		}
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>