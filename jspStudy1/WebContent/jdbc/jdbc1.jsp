<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--WebContent/jdbc/jdbc1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jdbc 예제 1</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
	<%
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/bigdb", "scott", "tiger");
		PreparedStatement pstmt = conn.prepareStatement("select * from professor");
		ResultSet rs = pstmt.executeQuery();
		ResultSetMetaData rsmt = rs.getMetaData();
	%>
	<table>
		<tr><% for(int i=1; i<=rsmt.getColumnCount(); i++) { %>
			<th><%=rsmt.getColumnName(i) %></th>
			<% } %>
		</tr>
		<% while(rs.next()) { %>
		<tr><% for(int i=1; i<=rsmt.getColumnCount(); i++) { %>
			<td><%=rs.getString(i) %></td>
			<% } %>
		</tr>
		<% } %>
	</table>
</body>
</html>