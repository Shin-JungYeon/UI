<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/cityAll.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>전체 도시 목록</title>
</head>
<body>
	<%
		pageContext.include("seoul.jsp");  //cityAll.jsp에 있는 request 객체를 seoul.jsp 로 전달. 같은 영역의 request 객체.
	%>
	<hr>
	<%
		pageContext.include("busan.jsp");  //cityAll.jsp에 있는 request 객체를 busan.jsp 로 전달. 같은 영역의 request 객체.
	%>
	<hr>
	<h4>전체 도시 목록입니다....</h4>
<%--
	request : 요청 객체. 파라미터 정보, header 정보, ... 를 가지고 있음.
	response : 응답 객체. 브라우저에 전달되는 객체.(논리적으로, 명령을 전달, ...)
	pageContext : page 영역을 담당하는 객체. 해당 페이지의 정보를 저장. -> 페이지마다 한 개씩 할당 됨. 가장 작은 단위의 영역. 공유 x
 --%>
</body>
</html>