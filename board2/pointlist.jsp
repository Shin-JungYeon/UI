<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>포인트 게시판</title>
<link rel="stylesheet" href="/project1/css/project.css">
</head>
<body>
	<div>
	<%-- 포인트 공지 목록 --%>
		<c:if test="${boardcount > 0 }">
			<div class="board_title">
			<form action="pnoticeForm.do?bclass=1" method="post">
				<table style="width: 500px;">
					<tr><td colspan="4"></td><td><font size="2">게시물 수 : ${boardcount }</font></td></tr>
					<tr><th>No.</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th></tr>
				<c:forEach var="pn" items="${pnlist }">
					<tr><td>${boardnum }</td>
						<td>
						<c:set var="boardnum" value="${boardnum - 1 }" />
						<c:if test="${!empty pn.file }">
							<a href="file/${pn.file }" style="text-decoration: none;">@</a>
						</c:if>
						<c:if test="${empty pn.file }">
							&nbsp;&nbsp;&nbsp;
						</c:if>
							<a href="pnotice.do?num=${pn.num }">${pn.subject }</a>
						</td>
						<td>${pn.id }</td>
						<td>
							<fmt:formatDate var="rdate" value="${pn.regdate }" pattern="yyyyMMdd" />
						<c:if test="${today == rdate }">
							<fmt:formatDate value="${pn.regdate }" pattern="HH:mm:ss" />
						</c:if>
						<c:if test="${today != rdate }">
							<fmt:formatDate value="${pn.regdate }" pattern="yy-MM-dd HH:mm:ss" />
						</c:if>
						</td>
						<td>${pn.readcnt }</td>
					</tr>
				</c:forEach>
				<c:if test="${sessionScope.login == 'admin' }">
					<tr><td colspan="4"></td><td><input type="submit" value="공지 추가"></td></tr>
				</c:if>
			</table>
			</form>
		</div>
	</c:if>
	</div>

	<div><br></div>
	
	<%-- 포인트 상품 목록 --%>
	<div>
		<form action="pitemForm.do" method="post">
			<table style="width: 500px;">
				<tr><th>No.</th><th>사용 포인트</th><th colspan="3">포인트 사용 내용</th><th>신청</th></tr>
				<c:forEach var="p" items="${plist }">
					<tr><td>${p.no }</td><td>${p.point }</td><td colspan="3">${p.name }</td><td><a href="pointaskForm.do?no=${p.no }">신청</a></td></tr>
				</c:forEach>
				<c:if test="${sessionScope.login == 'admin' }">
					<tr><td colspan="5"></td><td><input type="submit" value="상품 추가"></td></tr>
				</c:if>
			</table>		
		</form>
	</div>
</body>
</html>