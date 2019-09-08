<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- /WebContent/model2/calc.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MODEL2 연습</title>
</head>
<body>
	<h3>숫자 두 개를 입력 받아 연산의 결과를 result에 소숫점 두 자리까지 출력하기.</h3>
	<form action="calc.me" method="post">
		<input type="text" name="num1" value="${param.num1 }">
		<select name="op">
			<option>+</option><option>-</option>
			<option>*</option><option>/</option>
		</select>
		<script type="text/javascript">
			document.forms[0].op.value='${param.op }'  //선택한 연산자 고정시켜줌.
		</script>
		<input type="text" name="num2" value="${param.num2 }">
		<input type="submit" value="=">
		<input type="text" name="result" value="<fmt:formatNumber value="${result }" pattern="###,###.00" />">
	</form>
</body>
</html>
