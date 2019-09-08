<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/request1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��û �Ķ���� ���� ����ϱ�</title>
</head>
<body>
	<h2>��û �Ķ���� ����</h2>
	<%
		//setCharacterEncoding() : ��û �Ķ������ ���ڵ� ��� ����. -> method=post �� ��츸 ó�� ��.
		//�⺻ ���ڵ� ��� : iso-8859, 8859_1 -> �����ξ�
		//euc-kr�� ���ڵ� ��� ����.
		request.setCharacterEncoding("euc-kr");  //�ѱ� ������ �ʰ� �ϱ� ����.
		String name = request.getParameter("name");  //<input type="text" name="name"> �±װ� �Ѿ��. name�� �Ӽ����� �Ķ���� �̸���. id�Ӽ� X
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String hobby = request.getParameter("hobby");  //�Ķ���� �� ���� ������ �� ����.
		String year = request.getParameter("year");
	%>
	�̸� : <%=name %><br>
	���� : <%=age %><br>
	���� : <%=gender.equals("1")?"��":"��" %><br>
	��� : <%=hobby %><br>
	����⵵ : <%=year %><br>
	<h2>��û �Ķ���Ϳ� ����� ��� �� ��ȸ�ϱ�</h2>
	<h3>��� : </h3>
	<%
		String[] hobbies = request.getParameterValues("hobby");  //getParameterValues() : �Ķ���Ϳ� ���� �� ��� ���� �迭�� ����. -> checkbox, select, ...
		for(String h : hobbies) { %>
		<%=h %>&nbsp;&nbsp;
	<% } %><br>
	<h2>��� ��û �Ķ������ ��� �� ��ȸ�ϱ�(�Ķ���� �̸� ��)</h2>
	<table>
		<tr>
			<th>�Ķ���� �̸�</th><th>�Ķ���� ��</th>		
		</tr>
		<% 
			//Enumeration : Iterator�� ������. �ݺ���. Hashtable Map��ü. -> key : �Ķ���� �̸�, value : �Ķ���� ��.
			Enumeration e = request.getParameterNames();
			while(e.hasMoreElements()) {
				String paramName = (String) e.nextElement();
				String[] paramValues = request.getParameterValues(paramName);
		%>
		<tr><td><%=paramName %></td>
			<td><% for(String v : paramValues) { %>
					<%=v %>&nbsp;&nbsp;
				<% } %>
			</td>
		<% } %>
		</tr>
	</table>
</body>
</html>