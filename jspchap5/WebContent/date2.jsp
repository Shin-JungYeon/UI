<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/date2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String date = (String)session.getAttribute("date");
		if(date == null) { %>
		<script type="text/javascript">
			alert("등록된 날짜가 없습니다.");
			//history.go(-1);  //앞페이지에서 새로고침 해줘야 세션이 새로 등록됨.
			location.href="date1.jsp";  //url을 통해 이동한 것이기 때문에 이동하면서 세션 새로 등록됨.
		</script>
	<%	} %>
		<h2>등록된 날짜 : <%=date %></h2>
	<%
		session.removeAttribute("date");
	%>
</body>
</html>