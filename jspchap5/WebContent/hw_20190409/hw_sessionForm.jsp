<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/hw_20190409/hw_sessionForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>세션을 이용한 장바구니 예제</title>
</head>
<body>
	<h2>상품 선택</h2>
	<form name="f" method="post" action="hw_sessionadd.jsp">
		<select name="product">
			<option>사과</option><option>배</option><option>귤</option>
			<option>자몽</option><option>감</option><option>딸기</option>
		</select>
		<input type="submit" value="장바구니추가">
	</form>
	<a href="hw_sessionview.jsp">장바구니보기</a>  <%-- 파라미터 값 없음. 페이지만 넘겨줌. -> 브라우저가 살아있으므로 session 객체는 남아있음. --%>
</body>
</html>