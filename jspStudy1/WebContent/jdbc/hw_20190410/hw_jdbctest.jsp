<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jdbc/hw_20190410/hw_jdbc.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ sql ���� ��ȸ</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
	<form action="" method="post">
		<textarea rows="10" cols="60" name="content"><%  //�Ķ���� �̸� �ѱ۷� �����ϸ� ������ �̵� �������� ���� �� ����. ����� ���ִ� ���� ����. <textarea> �±� ������ ��, �����̽��� ��� �������� �ν���.
			if(request.getParameter("content") != null) {  //�������ڸ��� ���� �������� request ��ü �Ѿ��.
				out.println(request.getParameter("content"));  //null �̸� �ƹ��͵� �������� �ʰ� null�� �ƴϸ� �� ���� ������.
			}
		//<%=content==null?"":content % >
		%></textarea>
		<input type="submit" value="����">  <%-- ���� ������ �ٽ� ���� �������� ���ƿ��鼭 textarea�� �Է��� ���� request ��ü�� ��Ƽ� ������. --%>
	</form>
	<%   
		String sql = request.getParameter("content");  //�Էµ� ���� content�� String ������ ����.
		int cnt = 0;  //���ڵ� �� ������ ����.
		if(sql != null) {
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/bigdb", "scott", "tiger");
				PreparedStatement pstmt = conn.prepareStatement(sql);  //db�� �����ϰ� �Էµ� ���� sql������ �Է�����.
				ResultSet rs = pstmt.executeQuery();
				ResultSetMetaData rsmt = rs.getMetaData();
		%>
		<table>
			<tr><% for(int i=1; i<=rsmt.getColumnCount(); i++) { %>
				<th><%=rsmt.getColumnName(i) %></th>
				<% } %>
			</tr>
			<%
				while(rs.next()) { 
					cnt++;
			%>
			<tr><% for(int i=1; i<=rsmt.getColumnCount(); i++) { %>
				<td><%=rs.getString(i) %></td>
				<% } %>
			</tr>
			<% } %>
			<caption style="text-align: left;">
				<h3>��ȸ�� �÷��� : <%=rsmt.getColumnCount() %>&nbsp;&nbsp;&nbsp;��ȸ�� ���ڵ� �� : <%=cnt %></h3>
			</caption>
		</table>
		<%
			} catch(SQLException e) {  //�׳� catch�� �صθ� ������ ���� �� ��. %>
			<script type="text/javascript">
				alert("<%=e.getMessage() %>");
				// �������� ������ ���ٴ� �˸�â �����.
				location.href="hw_jdbctest.jsp"
			</script>
		<%		e.printStackTrace();  //�ֿܼ� ���� �޼��� ���.
			}
		} %>
</body>
</html>