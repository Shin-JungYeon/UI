<%@page import="rweb.Rserve"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/seoul.jsp : 서울시 응답소 분석하여 이미지 출력하기. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>R을 이용하여 wordcloud 이미지 출력하기</title>
<script type="text/javascript">
	function wordcloud() {
		wordcloudimg.src = 'img/<%=Rserve.wordcloud("seoul_new.txt", request) %>';
	}
</script>
</head>
<body>
	<input type="button" value="서울시 응답소 분석" onclick="wordcloud()"><br>
	<img alt="" src="" id="wordcloudimg">
</body>
</html>