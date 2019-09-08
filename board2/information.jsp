<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/project1/board/free.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �Խ���</title>
<link rel="stylesheet" href="/project1/css/project.css">
</head>
<body>
<div>
	<table>
		<tr><td width="30%">�۾���</td><td width="80%" style="text-align: left">${b.id }</td></tr>
		<tr><td>����</td><td style="text-align: left">${b.subject }</td></tr>
		<tr><td>����</td>
			<td>
				<table style="width: 100%; height: 250px;">
					<tr><td style="border-width: 0px; vertical-align: top; text-align: left;">${b.content }</td></tr>
				</table>
			</td></tr>
		<tr><td>÷������</td>
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
				<a href="updateForm.do?num=${b.num }">[����]</a>
				<a href="deleteForm.do?num=${b.num }">[����]</a>
			</c:if>
			<c:if test="${m.mclass == 1 }">
				<a href="reviewForm.do">[���� ����]</a>
			</c:if>
				<a href="informationlist.do">[���]</a>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>