<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/decorator/decorator.jsp --%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title /></title>  <%-- ���� ���� �������� ������ ���� �ϴµ� �� �׵θ��� ����ϴ� �������� title�� �ڵ����� ��������. --%>
<decorator:head />
<link rel="stylesheet" href="${path }/css/main.css">
</head>
<body>
	<table>
		<tr><td colspan="3" align="right">MODEL2 ���α׷� ����</td></tr>
		<tr>
			<td width="15%">
				<a href="${path }/model2/member/main.me">ȸ������</a><br><br>
				<a href="${path }/model2/board/list.do">�Խ���</a><br>
			</td>
			<td colspan="2" style="text-align: letf; vertical-align: top">
				<decorator:body />  <%-- �� �׵θ��� ����ϴ� �������� <body> �κ� ���. --%>
			</td>
		</tr>
		<tr><td colspan="3">�����ī���� Since 2016</td></tr>
	</table>
</body>
</html>