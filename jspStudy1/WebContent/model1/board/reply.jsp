<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/reply.jsp --%>
<%--
	select * from board order ref desc, refstep asc
	num : ���� �Խñ� ��ȣ. ��� ���� ������� ��� +1.
	ref : ������ ref�� �״�� ����
	reflevel : �����Ǵ��:1, ����Ǵ��:2, ...
	refstep : ����-���-����Ǵ��-... ����. ������ ���, ����� ��� ������� ��� +1.
--%>
<%--
	1. �Ķ���� ���� Board ��ü�� �����ϱ�.
		�������� : num, ref, reflevel, refstep
		������� : name, pass, subject(���ۿ��� ������.), content
--%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="b" class="model.Board" />  <%-- ��ۿ��� ÷�������� �������� ���� ���̱� ������ useBean �±� ��� ����. ����, ��� ���� ��� ������ ����. --%>
<jsp:setProperty name="b" property="*" />
<%
	BoardDao dao = new BoardDao();
	int reflevel = b.getReflevel();
	int refstep = b.getRefstep();
	
	//2. ���� ref ���� ����ϴ� �Խù����� refstep ���� 1 ���� ��Ű��.
	dao.refstepadd(b.getRef(), b.getRefstep());
	
	//3. Board ��ü�� db�� insert �ϱ�.
	int num = dao.maxnum();
	String msg = "��� ��Ͽ� �����Ͽ����ϴ�.";
	String url = "replyForm.jsp?num=" + b.getNum();
	b.setNum(++num);  //num�� ����, ��� ������� ����.
	b.setReflevel(reflevel + 1);  //����� ������ level���� Ŀ����.
	b.setRefstep(refstep +1);
	if(dao.insert(b)) {
		msg = "��� ����� �Ϸ�Ǿ����ϴ�.";
		url = "list.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>