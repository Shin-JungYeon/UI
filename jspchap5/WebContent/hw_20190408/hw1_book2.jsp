<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/hw1_book2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	%>
	<table border="1">
		<caption>방명록</caption>
		<%
			Enumeration e = request.getParameterNames();
			while(e.hasMoreElements()) {
				String paramName = (String) e.nextElement();
				String[] paramValues = request.getParameterValues(paramName);
		%>
		<tr><td><%=paramName %></td>
			<td><% for(String v : paramValues) { %>
					<%=v %>
				<% } %>
			</td>
		<% } %>
		</tr>
		<tr><td>등록일</td>
			<td><%
					Date today = new Date();
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				%>
				<%=df.format(today) %>
			</td>
		</tr>
	</table>
</body>
</html>
