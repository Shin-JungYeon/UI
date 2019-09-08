<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����Ʈ �Խ���</title>
<link rel="stylesheet" href="/project1/css/project.css">
</head>
<body>
	<div>
	<%-- ����Ʈ ���� ��� --%>
		<c:if test="${boardcount > 0 }">
			<div class="board_title">
			<form action="pnoticeForm.do?bclass=1" method="post">
				<table style="width: 500px;">
					<tr><td colspan="4"></td><td><font size="2">�Խù� �� : ${boardcount }</font></td></tr>
					<tr><th>No.</th><th>����</th><th>�ۼ���</th><th>�����</th><th>��ȸ��</th></tr>
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
					<tr><td colspan="4"></td><td><input type="submit" value="���� �߰�"></td></tr>
				</c:if>
			</table>
			</form>
		</div>
	</c:if>
	</div>

	<div><br></div>
	
	<%-- ����Ʈ ��ǰ ��� --%>
	<div>
		<form action="pitemForm.do" method="post">
			<table style="width: 500px;">
				<tr><th>No.</th><th>��� ����Ʈ</th><th colspan="3">����Ʈ ��� ����</th><th>��û</th></tr>
				<c:forEach var="p" items="${plist }">
					<tr><td>${p.no }</td><td>${p.point }</td><td colspan="3">${p.name }</td><td><a href="pointaskForm.do?no=${p.no }">��û</a></td></tr>
				</c:forEach>
				<c:if test="${sessionScope.login == 'admin' }">
					<tr><td colspan="5"></td><td><input type="submit" value="��ǰ �߰�"></td></tr>
				</c:if>
			</table>		
		</form>
	</div>
</body>
</html>