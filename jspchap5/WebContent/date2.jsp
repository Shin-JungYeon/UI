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
			alert("��ϵ� ��¥�� �����ϴ�.");
			//history.go(-1);  //������������ ���ΰ�ħ ����� ������ ���� ��ϵ�.
			location.href="date1.jsp";  //url�� ���� �̵��� ���̱� ������ �̵��ϸ鼭 ���� ���� ��ϵ�.
		</script>
	<%	} %>
		<h2>��ϵ� ��¥ : <%=date %></h2>
	<%
		session.removeAttribute("date");
	%>
</body>
</html>