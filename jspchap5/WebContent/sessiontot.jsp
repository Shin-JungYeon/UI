<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/sessiontot.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ٱ��� ��� ����</title>
</head>
<body>
	<%
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("cart");  //�Ӽ� ��ȸ. session ��ü�κ��� �̸��� cart�� �Ӽ��� ��ü�� ����. Object Ÿ����. -> ArrayList ��ü�� ����ȯ.
		if(list == null || list.size() == 0) { %>
			<h3>��ٱ��Ͽ� ��ǰ�� �����ϴ�.</h3>
	<% 
		} else {
			for(String p : list) { %>
			<h4><%=p %></h4>
	<% 		}
		} 
		//session�� �Ӽ��� ����. session ��ü ��ü�� ��������.
		//session.removeAttribute("cart");
		
		//session ��ü�� ���� �����ϱ�. ������ session ����ȭ��Ű�� ���ο� session���� �ٲ���. -> �Ӽ��� �������� ����.
		session.invalidate();
	%>
</body>
</html>