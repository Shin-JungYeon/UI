<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/student.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>학생 데이터 분석</title>
</head>
<body>
	<form action="student.do" method="post"	>
		<table>
			<tr>
				<td><input type="radio" name="wh" value="1">평균몸무게
					<input type="radio" name="wh" value="2">평균키
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="gm" value="1">학년
					<input type="radio" name="gm" value="2">학과
				</td>
			</tr>
			<tr>
				<td><input type="radio" name="gr" value="1">막대 그래프
					<input type="radio" name="gr" value="2">파이 그래프
				</td>
			</tr>
			<tr><td><input type="submit" value="학생정보 분석하기"></td></tr>
		</table>
		<img src="img/student.png" id="graph"><br>
	</form>
</body>
</html>