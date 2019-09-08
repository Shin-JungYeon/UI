<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/hw_20190409/hw_sessionview.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>장바구니 목록 보기</title>
</head>
<body>
	<%
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("cart");
		if(list == null || list.size() == 0) { %>
		<script type="text/javascript">
			alert("장바구니에 상품이 없습니다.");
			location.href="hw_sessionForm.jsp"  //앞 페이지로 돌아가기.
		</script>
	<%	} %>
	<%
		int cnt=0; %>
	<table border="1" cellspacing="0" cellpadding="0">
	<tr><th>번호</th><th>상품명</th><th>&nbsp;</th></tr>
	<%	for(String p : list) { %>  <%-- list.size() 이용해서 해줘도 됨. -> 상품명 출력할 때 list.get(i)로 바꿔줘야 함. --%>
		<tr><td><%=++cnt %></td><td><%=p %></td><td><a href="hw_sessiondel.jsp?index=<%=cnt %>" >ⓧ</a></td></tr>  <%-- ?index= 에서 index가 파라미터의 이름으로 설정됨. --%>
	<%	} %>
	</table>
</body>
</html>