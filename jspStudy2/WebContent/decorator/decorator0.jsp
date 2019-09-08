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
<title><decorator:title /></title>  <%-- 원래 현재 페이지의 제목이 들어가야 하는데 이 테두리를 사용하는 페이지의 title로 자동으로 설정해줌. --%>
<decorator:head />
<link rel="stylesheet" href="${path }/css/main.css">
</head>
<body>
	<table>
		<tr><td colspan="3" align="right">MODEL2 프로그램 연습</td></tr>
		<tr>
			<td width="15%">
				<a href="${path }/model2/member/main.me">회원관리</a><br><br>
				<a href="${path }/model2/board/list.do">게시판</a><br>
			</td>
			<td colspan="2" style="text-align: letf; vertical-align: top">
				<decorator:body />  <%-- 이 테두리를 사용하는 페이지의 <body> 부분 사용. --%>
			</td>
		</tr>
		<tr><td colspan="3">구디아카데미 Since 2016</td></tr>
	</table>
</body>
</html>