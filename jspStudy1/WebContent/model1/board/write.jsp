<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/write.jsp --%>
<%--
	1. 파라미터 값을 model.Board 객체에 저장. useBean 액션 태그 사용 불가. -> 하나하나 객체 생성해줘야 함.
	2. 게시물 번호 num 계산. -> 현재 등록된 num의 최대값을 조회해서 그 최대값 +1 이 등록된 게시물의 번호.
							-> db에서 maxnum을 구한 후 +1 해줘서 num 설정하기.
	3. board 객체의 내용을 db에 insert하기.
--%>
<%
	//1. 파라미터 값을 model.Board 객체에 저장.
	String uploadPath = application.getRealPath("/") + "model1/board/file/";
	int size = 10 * 1024 * 1024;
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr");
	Board board = new Board();  //빈껍데기..

	board.setName(multi.getParameter("name"));
	board.setPass(multi.getParameter("pass"));
	board.setSubject(multi.getParameter("subject"));
	board.setContent(multi.getParameter("content"));
	board.setFile1(multi.getFilesystemName("file1"));

	//2. 게시물 번호(num) 계산.
	BoardDao dao = new BoardDao();
	int num = dao.maxnum();
	
	//3. board 객체의 내용을 db에 insert하기.
	String msg = "게시물 등록에 실패하였습니다.";
	String url = "writeForm.jsp";
	board.setNum(++num);
	board.setRef(num);
	if(dao.insert(board)) {
		msg = "게시물 등록이 완료되었습니다.";
		url = "list.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>