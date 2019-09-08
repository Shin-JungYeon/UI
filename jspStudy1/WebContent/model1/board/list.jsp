<%@page import="model.Board"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/board/list.jsp --%>
<%--
	1. pageNum 파라미터 존재. pageNum 파라미터 없으면 강제로 1로 설정.
	2. 한 페이지 당 10건의 게시물만 조회 가능.
		-> db에서 해당 페이지에 출력되는 게시물만 조회.순서 : 가장 최근 게시물이 제일 위로 오도록 출력.
	3. 화면에 출력.
--%>
<%
	int pageNum = 1;
	try {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	} catch(NumberFormatException e) {}  //pageNum 에 아무값이 안들어가도 아무짓도 하지 않고 그냥 첫 번째 페이지 보여줌.
	int limit = 10;  //한 페이지에 보여줄 최대 게시물 수.
	BoardDao dao = new BoardDao();
	int boardcount = dao.boardCount();  //등록된 전체 게시물의 건수.
	List<Board> list = dao.list(pageNum, limit);  //화면에 출력된 게시물 데이터.
	
	int maxpage = (int)((double)boardcount/limit + 0.95);
	/*
		maxpage : 전체 페이지의 수.
			-> 전체 게시물 건수 : 21
  				(double)21/10 -> 2.1 + 0.95 -> (int)(3.05) -> 3 페이지
  			-> 전체 게시물 건수 : 10
  				(double)10/10 -> 1.0 + 0.95 -> (int)(1.95) -> 1 페이지
	  		-> 전체 게시물 건수 : 101
  				(double)101/10 -> 10.1 + 0.95 -> (int)(11.05) -> 11 페이지
	 */
	
	//화면에 표시될 페이지 번호. 10개만 표시.
	int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;  //10개 중 시작 페이지 번호.
	int endpage = startpage + 9;  //마지막 페이지 번호.
	if(endpage > maxpage) endpage = maxpage;
	/*
		pageNum : 2
			-> startpage : 2/10.0 -> 0.2 + 0.9 -> (int)(1.1) - 1 -> 0 * 10 + 1 -> 1 페이지
		pageNum : 10
			-> startpage : 10/10.0 -> 1.0 + 0.9 -> (int)(1.9) - 1 -> 0 * 10 + 1 -> 1 페이지
		pageNum : 11
			-> startpage : 11/10.0 -> 1.1 + 0.9 -> (int)(2.0) - 1 -> 1 * 10 + 1 -> 11페이지  //10페이지는 뒤로 넘겨버림.
		pageNum : 19
			-> startpage : 19/10.0 -> 1.9 + 0.9 -> (int)(2.8) - 1 -> 1 * 10 + 1 -> 11 페이지
	 */
	
	int boardnum = boardcount - (pageNum - 1) * limit;  //limit이 한 페이지 당 게시물 수(10)를 가지고 있음.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 목록 보기</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
	<table>
		<caption>MODEL1 게시판 목록</caption>
		<% if(boardcount == 0) { %>
			<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
		<% } else {  //등록된 게시물 존재. %>
			<tr><td colspan="5" style="text-align:right">게시물 수 : <%=boardcount %></td></tr>
			<tr><th width="8%">번호</th>
				<th width="50%">제목</th>
				<th width="14%">작성자</th>
				<th width="17%">등록일</th>
				<th width="11%">조회수</th>
			</tr>
			<% for(Board b : list) { %>
<%--				<tr><td><%=b.getNum() %></td>  --%>  <%-- db에 저장된 num은 글의 작성 순서만 알려줄 뿐 게시판에 보여지는 num은 엉망. --%>
				<tr><td><%=boardnum-- %></td>  <%-- 반드시 뒤에 -- --%>
					<td style="text-align: left">
					<% if(b.getFile1() != null && !b.getFile1().trim().equals("")) {  //첨부파일 존재. %>
						<a href="file/<%=b.getFile1() %>" style="text-decoration: none;">@</a>
					<% } else {  //없으면 자리 맞추기 위해 공백 추가. %>
						&nbsp;&nbsp;&nbsp;
					<% } %>
					<% if(b.getReflevel() > 0) {
						for(int i=1; i<b.getReflevel(); i++) { %>
						  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<% } %>└ <% } %>
						<a href="info.jsp?num=<%=b.getNum() %>"><%=b.getSubject() %></a>
					</td>
					<td><%=b.getName() %></td>
					<td><%=b.getRegdate() %></td>
					<td><%=b.getReadcnt() %></td>
				</tr>
			<% }  //for 구문 종료 %>
			<%-- 페이지 처리 부분 --%>
			<tr><td colspan="5">
			<% if(pageNum <= 1) {  //이전 페이지가 없으므로 하이퍼링크 걸지 않음. %>
				[이전]
			<% } else {  //이전 페이지 존재. %>
				<a href="list.jsp?pageNum=<%=pageNum - 1 %>">[이전]</a>
			<% } %>
			<% for(int a=startpage; a<=endpage; a++) { %>
				<% if(a == pageNum) {  //내가 보고 있는 페이지는 하이퍼링크 걸지 않음. %>
					[<%=a %>]
				<% } else {  //그 외 보고있지 않은 페이지는 하이퍼링크 걸어줌. 선택시 그 페이지로 바로 이동 가능. %>
					<a href="list.jsp?pageNum=<%=a %>">[<%=a %>]</a>
				<% } 
				} %>
			<% if(pageNum >= maxpage) {  //다음 페이지가 없음. %>
				[다음]
			<% } else {  //다음 페이지 존재. %>
				<a href="list.jsp?pageNum=<%=pageNum + 1 %>">[다음]</a>
			<% } %>
				</td></tr>
		<% }  //else 구문 종료 %>
			<tr><td colspan="5" style="text-align:right"><a href="writeForm.jsp">[글쓰기]</a></td></tr>
	</table>
</body>
</html>

