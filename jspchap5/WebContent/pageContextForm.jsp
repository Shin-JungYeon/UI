<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/pageContextForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>pageContext 객체를 이용하여 forward 연습하기</title>
<script type="text/javascript">
	function city_select(c) {
		location.href = 'city.jsp?c=' + c;
	}
</script>
</head>
<body>
	<select id="city">
		<option>seoul</option>
		<option>busan</option>
	</select>
	<input type="button" value="도시조회" onclick="city_select(city.value)">
	<input type="button" value="전체 도시조회" onclick="location.href='cityAll.jsp'">
</body>
</html>