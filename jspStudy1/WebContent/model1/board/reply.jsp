<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/reply.jsp --%>
<%--
	select * from board order ref desc, refstep asc
	num : 고유 게시글 번호. 답글 원글 상관없이 계속 +1.
	ref : 원글의 ref값 그대로 유지
	reflevel : 원글의답글:1, 답글의답글:2, ...
	refstep : 원글-답글-답글의답글-... 순서. 원글의 답글, 답글의 답글 상관없이 계속 +1.
--%>
<%--
	1. 파라미터 값을 Board 객체에 저장하기.
		원글정보 : num, ref, reflevel, refstep
		답글정보 : name, pass, subject(원글에서 가져옴.), content
--%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="b" class="model.Board" />  <%-- 답글에는 첨부파일을 가져오지 않을 것이기 때문에 useBean 태그 사용 가능. 원글, 답글 정보 모두 가지고 있음. --%>
<jsp:setProperty name="b" property="*" />
<%
	BoardDao dao = new BoardDao();
	int reflevel = b.getReflevel();
	int refstep = b.getRefstep();
	
	//2. 같은 ref 값을 사용하는 게시물들의 refstep 값을 1 증가 시키기.
	dao.refstepadd(b.getRef(), b.getRefstep());
	
	//3. Board 객체를 db에 insert 하기.
	int num = dao.maxnum();
	String msg = "답글 등록에 실패하였습니다.";
	String url = "replyForm.jsp?num=" + b.getNum();
	b.setNum(++num);  //num은 원글, 답글 상관없이 증가.
	b.setReflevel(reflevel + 1);  //답글은 원글의 level보다 커야함.
	b.setRefstep(refstep +1);
	if(dao.insert(b)) {
		msg = "답글 등록이 완료되었습니다.";
		url = "list.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>