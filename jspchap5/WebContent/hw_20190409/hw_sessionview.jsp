<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/hw_20190409/hw_sessionview.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ٱ��� ��� ����</title>
</head>
<body>
	<%
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("cart");
		if(list == null || list.size() == 0) { %>
		<script type="text/javascript">
			alert("��ٱ��Ͽ� ��ǰ�� �����ϴ�.");
			location.href="hw_sessionForm.jsp"  //�� �������� ���ư���.
		</script>
	<%	} %>
	<%
		int cnt=0; %>
	<table border="1" cellspacing="0" cellpadding="0">
	<tr><th>��ȣ</th><th>��ǰ��</th><th>&nbsp;</th></tr>
	<%	for(String p : list) { %>  <%-- list.size() �̿��ؼ� ���൵ ��. -> ��ǰ�� ����� �� list.get(i)�� �ٲ���� ��. --%>
		<tr><td><%=++cnt %></td><td><%=p %></td><td><a href="hw_sessiondel.jsp?index=<%=cnt %>" >��</a></td></tr>  <%-- ?index= ���� index�� �Ķ������ �̸����� ������. --%>
	<%	} %>
	</table>
</body>
</html>