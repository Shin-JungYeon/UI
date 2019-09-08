<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jdbc/hw_20190410/hw_jdbc.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>간단한 sql 구문 조회</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
	<form action="" method="post">
		<textarea rows="10" cols="60" name="content"><%  //파라미터 이름 한글로 설정하면 데이터 이동 과정에서 깨질 수 있음. 영어로 해주는 것이 안정. <textarea> 태그 내에서 탭, 스페이스바 모두 공백으로 인식함.
			if(request.getParameter("content") != null) {  //실행하자마자 현재 페이지로 request 객체 넘어옴.
				out.println(request.getParameter("content"));  //null 이면 아무것도 보여주지 않고 null이 아니면 그 값을 보여줌.
			}
		//<%=content==null?"":content % >
		%></textarea>
		<input type="submit" value="실행">  <%-- 실행 누르면 다시 현재 페이지로 돌아오면서 textarea에 입력한 값을 request 객체에 담아서 가져옴. --%>
	</form>
	<%   
		String sql = request.getParameter("content");  //입력된 값을 content에 String 값으로 저장.
		int cnt = 0;  //레코드 수 저장할 변수.
		if(sql != null) {
			try {
				Class.forName("org.mariadb.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/bigdb", "scott", "tiger");
				PreparedStatement pstmt = conn.prepareStatement(sql);  //db와 연결하고 입력된 값을 sql문으로 입력해줌.
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
				<h3>조회된 컬럼수 : <%=rsmt.getColumnCount() %>&nbsp;&nbsp;&nbsp;조회된 레코드 수 : <%=cnt %></h3>
			</caption>
		</table>
		<%
			} catch(SQLException e) {  //그냥 catch만 해두면 에러가 났는 지 모름. %>
			<script type="text/javascript">
				alert("<%=e.getMessage() %>");
				// 브라우저에 에러가 났다는 알림창 띄워줌.
				location.href="hw_jdbctest.jsp"
			</script>
		<%		e.printStackTrace();  //콘솔에 에러 메세지 출력.
			}
		} %>
</body>
</html>