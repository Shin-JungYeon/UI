<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/request2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�հ� ��� ����</title>
</head>
<body>
	<%
		//http://localhost:8080/jspchap5/request2.jsp?num=10&kind=2  -> �Ķ���� ���� ��� �� �ϳ�.
		int num = Integer.parseInt(request.getParameter("num"));  //�Էµ� ����
		String kind = request.getParameter("kind");  //0: ��ü��, 1: Ȧ����, 2: ¦����
		int sum=0;
		if(kind.equals("0")) {  //��ü��
			for(int i=1; i<=num; i++) {
				sum += i;
			}
		} else if(kind.equals("1")) {  //Ȧ����
			for(int i=1; i<=num; i++) {
				if(i%2 == 0) continue;
				sum += i;
			}
		} else {
			for(int i=1; i<=num; i++) {  //¦����
				if(i%2 == 1) continue;
				sum += i;
			}
		}
		
		/*
			for(int i=1; i<=num; i++) {
				switch(kind) {
					case "0" : sum += i; break;
					case "1" : if(i%2==1) sum += i; break;
					case "2" : if(i%2==0) sum += i; break;
				}
			}
		*/
	%>
	<h2><%=num %>������ <%=(kind.equals("0")?"��ü":(kind.equals("1")?"Ȧ��":"¦��")) %>�� :<%=sum %></h2>
</body>
</html>