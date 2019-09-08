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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><decorator:title /></title>  <%-- 원래 현재 페이지의 제목이 들어가야 하는데 이 테두리를 사용하는 페이지의 title로 자동으로 설정해줌. --%>
<decorator:head />
<link rel="stylesheet" href="${path }/css/main.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">

<style>
	body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
	.w3-bar-block .w3-bar-item {padding:20px}
</style>

</head>
<body>
	<div class="w3-top">
		<div class="w3-white w3-xlarge" style="max-width:auto; margin:auto">
			<div class="w3-button w3-padding-16 w3-right" onclick="w3_open()">
				<c:if test="${!empty login }">
					<a href="${path }/model2/member/info.me?id=${login }" class="w3-buttonw3-black">${login }님</a><br>
					<a href="${path }/model2/member/logout.me" class="w3-buttonw3-black">Logout</a>
				</c:if>
			</div> 
    		<div class="w3-button w3-padding-16 w3-left" onclick="w3_open()">=</div>
    		<div class="w3-center w3-padding-16">MODEL2 프로그램 연습</div>
		</div>
	</div>
	<div class="w3-main w3-padding" style="max-width:1200px;margin-top:100px; "></div>
	<nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" style="display:none;z-index:2;width:20%;min-width:300px" id="mySidebar">
		<a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button">Close Menu</a>
		<a href="${path }/model2/member/joinForm.me" onclick="w3_close()" class="w3-bar-item w3-button">Join</a>
		<c:if test="${!empty login }">
			<a href="${path }/model2/member/logout.me" onclick="w3_close()" class="w3-bar-item w3-button">Logout</a>
		</c:if>
		<c:if test="${empty login }">
			<a href="${path }/model2/member/loginForm.me" onclick="w3_close()" class="w3-bar-item w3-button">Login</a>
		</c:if>
		<c:if test="${login == 'admin' }">
			<a href="${path }/model2/member/list.me" onclick="w3_close()" class="w3-bar-item w3-button">Member List</a>
		</c:if>
		<a href="${path }/model2/member/main.me" onclick="w3_close()" class="w3-bar-item w3-button">Member Main</a>
		<a href="${path }/model2/board/list.do" onclick="w3_close()" class="w3-bar-item w3-button">Board List</a>
	</nav>
	<div class="w3-container w3-center">
		<table class="w3-table w3-bordered">
			<tr><td style="text-align: center; vertical-align: top">
					<decorator:body />  <%-- 이 테두리를 사용하는 페이지의 <body> 부분 사용. --%>
				</td></tr>
		</table>
	</div>
	<footer class="w3-row-padding w3-padding-32">
    	<div class="w3-center w3-bottom">
      		<h5>구디아카데미 Since 2016</h5>
		</div>
	</footer>
	
	<script>
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
		}
		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
		}
	</script>
</body>
</html>