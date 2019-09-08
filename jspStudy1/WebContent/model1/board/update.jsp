<%@page import="model.BoardDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/update.jsp --%>
<% 
	Board board = new Board();  //������ �����ϱ� ������ useBean ��ü ��� �Ұ�.
	String path = application.getRealPath("/") + "model1/board/file/";
	MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");
	
	//1.
	board.setNum(Integer.parseInt(multi.getParameter("num")));
	board.setName(multi.getParameter("name"));
	board.setPass(multi.getParameter("pass"));
	board.setSubject(multi.getParameter("subject"));
	board.setContent(multi.getParameter("content"));
	board.setFile1(multi.getFilesystemName("file1"));  //���� ���ε��� ÷�����Ϸ� ����.
	if(board.getFile1() == null || board.getFile1().equals("")) {
		board.setFile1(multi.getParameter("file2"));  //���� ���ε����� ������ file2�� ������ �ִ� ������ ������ �־ �����·� ��������.
	}
	
	//2.
	BoardDao dao = new BoardDao();
	Board dbboard = dao.selectOne(board.getNum());
	String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է����ּ���.";
	String url = "updateForm.jsp?num=" + board.getNum();
	
	if(board.getPass().equals(dbboard.getPass())) {
		if(dao.update(board)) {
			msg = "�Խù� ������ �Ϸ�Ǿ����ϴ�.";
			url = "list.jsp";
		} else {
			msg = "�Խù� ������ �����Ͽ����ϴ�.";
		}
	}
%>
<<script type="text/javascript">
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>

