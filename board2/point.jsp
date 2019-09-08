<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����Ʈ �Խ���</title>
<link rel="stylesheet" href="/project1/css/project.css">
</head>
<body>
	<div>
		<form action="pnoticeForm.do?classify=1" method="post">
			<div class="board_title">
				<span>No.</span><span>����</span><span>�ۼ���</span><span>�ۼ���¥</span><span>��ȸ��</span>
			</div>
			<c:forEach var="pn" items="${pnlist }">
				<div><span>${pn.num }</span><span>${pn.subject }</span><span>${pn.name }</span><span>${pn.regdate }</span><span>${pn.readcnt }</span></div>
			</c:forEach>
			<c:if test="${sessionScope.login == 'admin' }">
				<div><span><input type="submit" value="���� �߰�"></span></div>
			</c:if>
		</form>
	</div>
	
	<div>
		<form action="pitemForm.do" method="post">
			<div class="board_title">
				<span>��� ����Ʈ</span><span>����Ʈ ��� ����</span><span>��û</span>
			</div>
			<c:forEach var="p" items="${plist }">
				<div><span>${p.point }</span><span>${p.name }</span><span><a href="pointaskForm.do?no=${p.no }">��û</a></span></div>
			</c:forEach>
			<c:if test="${sessionScope.login == 'admin' }">
				<div><span><input type="submit" value="��ǰ �߰�"></span></div>
			</c:if>
		</form>
	</div>
</body>
</html>