<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/requestForm2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>입력된 숫자까지의 합 구하기</title>
<script type="text/javascript">
	function calcsum(k, f) {
		f.kind.value = k;
		f.submit();  //submit 버튼 클릭 효과 발생. 단 onsubmit 이벤트 발생 안됨.
	}
</script>
</head>
<body>
	<form action="request2.jsp" method="post">
		<input type="hidden" name="kind" value="0">
		<input type="text" name="num">까지의 합계 구하기
		<input type="submit" value="합계구하기">
		<input type="button" value="홀수합구하기" onclick="calcsum(1, this.form)">  <!-- submit이 아니기 때문에 함수를 이용해 강제로 보내줘야 함. -->
		<input type="button" value="짝수합구하기" onclick="calcsum(2, this.form)">
	</form>
</body>
</html>