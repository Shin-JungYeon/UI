<%@page import="rweb.Rserve"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/seoul.jsp : ����� ����� �м��Ͽ� �̹��� ����ϱ�. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>R�� �̿��Ͽ� wordcloud �̹��� ����ϱ�</title>
<script type="text/javascript">
	function wordcloud() {
		wordcloudimg.src = 'img/<%=Rserve.wordcloud("seoul_new.txt", request) %>';
	}
</script>
</head>
<body>
	<input type="button" value="����� ����� �м�" onclick="wordcloud()"><br>
	<img alt="" src="" id="wordcloudimg">
</body>
</html>