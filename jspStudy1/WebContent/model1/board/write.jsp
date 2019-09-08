<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/write.jsp --%>
<%--
	1. �Ķ���� ���� model.Board ��ü�� ����. useBean �׼� �±� ��� �Ұ�. -> �ϳ��ϳ� ��ü ��������� ��.
	2. �Խù� ��ȣ num ���. -> ���� ��ϵ� num�� �ִ밪�� ��ȸ�ؼ� �� �ִ밪 +1 �� ��ϵ� �Խù��� ��ȣ.
							-> db���� maxnum�� ���� �� +1 ���༭ num �����ϱ�.
	3. board ��ü�� ������ db�� insert�ϱ�.
--%>
<%
	//1. �Ķ���� ���� model.Board ��ü�� ����.
	String uploadPath = application.getRealPath("/") + "model1/board/file/";
	int size = 10 * 1024 * 1024;
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr");
	Board board = new Board();  //�󲮵���..

	board.setName(multi.getParameter("name"));
	board.setPass(multi.getParameter("pass"));
	board.setSubject(multi.getParameter("subject"));
	board.setContent(multi.getParameter("content"));
	board.setFile1(multi.getFilesystemName("file1"));

	//2. �Խù� ��ȣ(num) ���.
	BoardDao dao = new BoardDao();
	int num = dao.maxnum();
	
	//3. board ��ü�� ������ db�� insert�ϱ�.
	String msg = "�Խù� ��Ͽ� �����Ͽ����ϴ�.";
	String url = "writeForm.jsp";
	board.setNum(++num);
	board.setRef(num);
	if(dao.insert(board)) {
		msg = "�Խù� ����� �Ϸ�Ǿ����ϴ�.";
		url = "list.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>