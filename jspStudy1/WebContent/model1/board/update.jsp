<%@page import="model.BoardDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/update.jsp --%>
<% 
	Board board = new Board();  //파일이 존재하기 때문에 useBean 객체 사용 불가.
	String path = application.getRealPath("/") + "model1/board/file/";
	MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");
	
	//1.
	board.setNum(Integer.parseInt(multi.getParameter("num")));
	board.setName(multi.getParameter("name"));
	board.setPass(multi.getParameter("pass"));
	board.setSubject(multi.getParameter("subject"));
	board.setContent(multi.getParameter("content"));
	board.setFile1(multi.getFilesystemName("file1"));  //새로 업로드한 첨부파일로 저장.
	if(board.getFile1() == null || board.getFile1().equals("")) {
		board.setFile1(multi.getParameter("file2"));  //새로 업로드하지 않으면 file2에 기존에 있던 파일을 가지고 있어서 원상태로 돌려놓음.
	}
	
	//2.
	BoardDao dao = new BoardDao();
	Board dbboard = dao.selectOne(board.getNum());
	String msg = "비밀번호가 틀렸습니다. 다시 입력해주세요.";
	String url = "updateForm.jsp?num=" + board.getNum();
	
	if(board.getPass().equals(dbboard.getPass())) {
		if(dao.update(board)) {
			msg = "게시물 수정이 완료되었습니다.";
			url = "list.jsp";
		} else {
			msg = "게시물 수정에 실패하였습니다.";
		}
	}
%>
<<script type="text/javascript">
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>

