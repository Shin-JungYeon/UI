<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isErrorPage="true" %>  <%-- exception 객체 전달 가능하게 해줌. --%>
<%-- /WebContent/chap9/error.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>오류 페이지</title>
</head>
<body>
	<h1>파라미터 noname을 입력해주세요.</h1>
	<h1>계속 오류 발생시 전산부에 전화 요망</h1>
	<h1>[전산부 홍길동 : 1234]</h1>
	<%=exception.getMessage() %>
	<!-- 오류페이지의 출력 용량이 500바이트 미만인 경우 브라우저의 http 오류 메세지가 출력됨.
		  그러므로 500바이트 이상이 되도록 오류 메세지를 출력해야 해당 페이지로 인식합니다. (임의로 오류발생 시키기) -->
</body>
</html>