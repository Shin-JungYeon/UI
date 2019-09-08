<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/hw_20190409/sessiondel.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("cart");
		int index = Integer.parseInt(request.getParameter("index"));
		list.remove(index-1);
		response.sendRedirect("hw_sessionview.jsp");  //sessionview.jsp 재요청. location.href 말고 이 방법 사용 가능.
	%>
<%-- 
	<script type="text/javascript">
		location.href="hw_sessionview.jsp"
	</script>
--%>
</body>
</html>