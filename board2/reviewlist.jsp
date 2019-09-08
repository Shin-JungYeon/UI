<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="day" class="java.util.Date" />
<fmt:formatDate var="today" value="${day }" pattern="yyyyMMdd" />
<%-- WebContent/project1/board/review.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리뷰 게시판</title>
<link rel="stylesheet" href="/project1/css/project.css">
<script type="text/javascript">
	function listcall(page) {
		document.sf.pageNum.value = page;
		document.sf.submit();
	}
</script>
</head>
<body>
<%-- 게시글 검색 --%>
	<div>
		<form action="review.do?bclass=2" method="post" name="sf">
			<input type="hidden" name="calssify" value="2">
			<input type="hidden" name="pageNum" value="1">
			<table>
				<tr>
					<td>
						<select name="column">
							<option value="">선택하세요</option>
							<option value="content">작성자</option>
							<option value="content">제목</option>
							<option value="content">내용</option>
						</select>
					</td>
					<td><input type="text" name="find" value="${param.find }" style="width: 300px;" ></td>
					<td><input type="submit" value="검색"></td>
				</tr>
			</table>
			<script type="text/javascript">
				document.sf.column.value = "${param.column}";
			</script>
		</form>
	</div>
	<div>
	<%-- 게시글 목록 --%>
		<c:if test="${boardcount > 0 }">
			<div class="board_title">
				<table>
					<tr><td colspan="5"></td><td><font size="2">게시물 수 : ${boardcount }</font></td></tr>
					<tr><th>No.</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th><th>추천수</th></tr>
				<c:forEach var="b" items="${list }">
					<tr><td>${boardnum }</td>
						<td>
						<c:set var="boardnum" value="${boardnum - 1 }" />
						<c:if test="${!empty b.file }">
							<a href="file/${b.file }" style="text-decoration: none;">@</a>
						</c:if>
						<c:if test="${empty b.file }">
							&nbsp;&nbsp;&nbsp;
						</c:if>
						<c:if test="${b.reflevel > 0 }">
							<c:forEach var="i" begin="1" end="${b.reflevel }">
							  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>└ 
						</c:if>
							<a href="review.do?num=${b.num }">${b.subject }</a>
						</td>
						<td>${b.id }</td>
						<td>
							<fmt:formatDate var="rdate" value="${b.regdate }" pattern="yyyyMMdd" />
						<c:if test="${today == rdate }">
							<fmt:formatDate value="${b.regdate }" pattern="HH:mm:ss" />
						</c:if>
						<c:if test="${today != rdate }">
							<fmt:formatDate value="${b.regdate }" pattern="yy-MM-dd HH:mm:ss" />
						</c:if>
						</td>
						<td>${b.readcnt }</td>
						<td>${b.likecnt }</td>
					</tr>
				</c:forEach>
				
			<%-- 페이지 번호 --%>
					<tr>
						<td colspan="6">
						<c:if test="${pageNum <= 1 }">
							[이전]
						</c:if>
						<c:if test="${pageNum > 1 }">
							<a href="javascript:listcall(${pageNum - 1 })">[이전]</a>
						</c:if>
						<c:forEach var="a" begin="${startpage }" end="${endpage }">
							<c:if test="${a == pageNum }">
								[${a }]
							</c:if>
							<c:if test="${a != pageNum }">
								<a href="javascript:listcall(${a })">[${a }]</a>
							</c:if>
						</c:forEach>
						<c:if test="${pageNum < maxpage }">
							<a href="javascript:listcall(${pageNum +1 })">[다음]</a>
						</c:if>
						<c:if test="${pageNum >= maxpage }">
							[다음]
						</c:if>
						</td>
					</tr>
				<c:if test="${mclass == 1 }">
					<tr><td colspan="5"></td>
						<td>
							<form action="reviewForm.do" method="post" name="wf">
								<input type="submit" value="글쓰기">
								<input type="hidden" name="id" value="${sessionScope.login }">
							</form>
						</td>
					</tr>
				</c:if>
				</table>
			</div>
		</c:if>
	</div>
</body>
</html>