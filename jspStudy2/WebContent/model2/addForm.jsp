<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/addForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MODEL2 연습</title>
</head>
<body>
	<form action="add.me" method="post">
		<input type="text" name="num1" value="${param.num1 }"> + 
		<input type="text" name="num2" value="${param.num2 }">
		<input type="submit" value="=">
		<input type="text" name="result" value="${result }">  <%-- result는 파라미터값이 아닌 Action 클래스에서 등록한 속성값. --%>
	</form>
</body>
</html>
