<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="day" class="java.util.Date" />
<fmt:formatDate var="today" value="${day }" pattern="yyyyMMdd" />
<%-- /WebContent/project1/board/free.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자유 게시판</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/project1/css/project.css">
</head>
<body>
<form>
	<table>
		<tr><td colspan="4" style="text-align: left"><font size="5">${b.subject }</font></td></tr>
		<tr><td colspan="2" style="text-align: left">${b.id }</td>
			<td colspan="2" style="text-align: right"><fmt:formatDate value="${b.regdate }" pattern="yy-MM-dd HH:mm:ss" /></td></tr>
		<tr><td colspan="4"><table style="width: 100%; height: 250px;">
					<tr><td style="border-width: 0px; vertical-align: mid; text-align: left;">${b.content }</td></tr>
				</table>
			</td></tr>
		<tr><td>첨부파일</td>
			<td colspan="3" style="text-align: left">
			<c:if test="${!empty b.file }">
				<a href="file/${b.file }">${b.file }</a>
			</c:if>
			<c:if test="${empty b.file }">
				&nbsp;&nbsp;&nbsp;
			</c:if>
			</td></tr>
			<tr><td colspan="4" style="text-align: left">댓글[${commcnt }]&nbsp;&nbsp;&nbsp;조회수 ${b.readcnt }&nbsp;&nbsp;&nbsp;추천수 ${b.likecnt }</td></tr>
		
	<c:forEach var="comm" items="${commlist }">
	<c:if test="${comm.num == b.num }">
		<tr><td>${comm.id }</td><td style="text-align: left; vertical-align: center;">${comm.content }</td>
			<td><fmt:formatDate var="rdate" value="${comm.regdate }" pattern="yyyyMMdd" />
			<c:if test="${today == rdate }">
				<fmt:formatDate value="${comm.regdate }" pattern="HH:mm:ss" />
			</c:if>
			<c:if test="${today != rdate }">
				<fmt:formatDate value="${comm.regdate }" pattern="yy-MM-dd HH:mm:ss" />
			</c:if></td>
			<td><a href="commentdel.do?no=${comm.no }&num=${b.num }" onclick="return commDel('${comm.id }', '${sessionScope.login }')">삭제</a></td></tr>
			</c:if>
	</c:forEach>
		<tr><td colspan="2"><input type="text" name="content" id="content" style="width: 700px"></td>
			<td><input type="button" value="입력" id="commentadd">
				<input type="button" value="추천" onclick="like()"></td></tr>
		<tr><td colspan="4">
				<a href="freereplyForm.do?num=${param.num }"><input type="button" value="답글 쓰기"></a>
			<c:if test="${login == b.id }">
				<a href="updateForm.do?num=${b.num }"><input type="button" value="수정"></a>
				<a href="deleteForm.do?num=${b.num }%bclass=${b.bclass }"><input type="button" value="삭제"></a>
			</c:if>
				<a href="boardlist.do?bclass=${b.bclass }"><input type="button" value="목록"></a>
			</td>
		</tr>
	</table>
	<input type="hidden" value="${b.num }" id="num">
	<input type="hidden" value="${sessionScope.login }" id="id">
</form>

<script type="text/javascript">
		$(document).ready(function(){
			$('#commentadd').click(function(){
				if($('#id').val() == "") {
					alert("로그인 후 이용해 주세요.");
				} else {
					if($('#content').val() == "") {
						alert("댓글 내용을 입력하세요.");
					} else {
						$.ajax({
							url : "commentadd.do",
							type : "post",
							data : {
								num : $("#num").val(),
								id : $("#id").val(),
								content : $("#content").val()
							},
							success : function(data) {
								location.reload();
							}
						});
					}
				}
				
			});
		});
		function commDel(id, login) {
			if(login == id) {
				var message = confirm(login + "댓글을 정말 삭제하시겠습니까?");
				if(message == true) {
					return true;
				} else {
					return false;
				}
			} else {
				alert("자신의 댓글만 삭제가 가능합니다.");
				return false;
			}
		}
	</script>


</body>
</html>