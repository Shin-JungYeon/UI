<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/project1/board/notice.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>포인트 공지 게시판</title>
<link rel="stylesheet" href="/project1/css/project.css">
</head>
<body>
<div>
	<table>
		<tr><td width="30%">글쓴이</td><td width="80%" style="text-align: left">${b.id }</td></tr>
		<tr><td>제목</td><td style="text-align: left">${b.subject }</td></tr>
		<tr><td>내용</td>
			<td>
				<table style="width: 100%; height: 250px;">
					<tr><td style="border-width: 0px; vertical-align: top; text-align: left;">${b.content }</td></tr>
				</table>
			</td></tr>
		<tr><td>첨부파일</td>
			<td style="text-align: left">
			<c:if test="${!empty b.file }">
				<a href="file/${b.file }">${b.file }</a>
			</c:if>
			<c:if test="${empty b.file }">
				&nbsp;&nbsp;&nbsp;
			</c:if>
			</td></tr>
	
		<tr><td colspan="2">
			<c:if test="${login == b.id }">
				<a href="updateForm.do?num=${b.num }">[수정]</a>
				<a href="deleteForm.do?num=${b.num }">[삭제]</a>
			</c:if>
				<a href="pointlist.do?bclass=1">[목록]</a>
			</td>
		</tr>
	
	</table>
	</div>
</body>
</html>