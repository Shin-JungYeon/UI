<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>포인트 게시판</title>
<link rel="stylesheet" href="/project1/css/project.css">
</head>
<body>
	<div>
		<form action="pnoticeForm.do?classify=1" method="post">
			<div class="board_title">
				<span>No.</span><span>제목</span><span>작성자</span><span>작성날짜</span><span>조회수</span>
			</div>
			<c:forEach var="pn" items="${pnlist }">
				<div><span>${pn.num }</span><span>${pn.subject }</span><span>${pn.name }</span><span>${pn.regdate }</span><span>${pn.readcnt }</span></div>
			</c:forEach>
			<c:if test="${sessionScope.login == 'admin' }">
				<div><span><input type="submit" value="공지 추가"></span></div>
			</c:if>
		</form>
	</div>
	
	<div>
		<form action="pitemForm.do" method="post">
			<div class="board_title">
				<span>사용 포인트</span><span>포인트 사용 내용</span><span>신청</span>
			</div>
			<c:forEach var="p" items="${plist }">
				<div><span>${p.point }</span><span>${p.name }</span><span><a href="pointaskForm.do?no=${p.no }">신청</a></span></div>
			</c:forEach>
			<c:if test="${sessionScope.login == 'admin' }">
				<div><span><input type="submit" value="상품 추가"></span></div>
			</c:if>
		</form>
	</div>
</body>
</html>