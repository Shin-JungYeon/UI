<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/sessionadd.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>session�� �̿��� ��ٱ���</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		String product = request.getParameter("product");
		
		//session.getAttribute("cart") : �Ӽ� ��ȸ. session ��ü�� ��ϵ� �Ӽ� �� �̸��� cart�� ��ü�� ����. �Ӽ� : �������� ������� ���� �ȿ��� ���� �ְ���� �� ����.
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("cart");  //cart ��� �Ӽ��� �켱 ��ȸ�غ�.
		
		if(list == null) {  //��ȸ���� �� ������ list�� ���ο� ��ü �����ϰ� �Ʒ����� setAttribute�� ���. cart��� �Ӽ��� �����ϸ� �״�� ���.
			list = new ArrayList<String>();
			
			//session.setAttribute("cart", list) : �Ӽ� ���. session ��ü�� cart �̸��� ���� �Ӽ��� list ��ü�� ����.
			session.setAttribute("cart", list);
		}
		
		list.add(product);
	%>
	<script type="text/javascript">
		alert("<%=product %>��(��) �߰� �Ǿ����ϴ�.");
		history.go(-1);  //�� �������� ���ư���.
	</script>
</body>
</html>