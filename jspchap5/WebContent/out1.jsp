<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/out1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>out 내장 객체 예제</title>
</head>
<body>
	<h3>out 내장 객체 : response 출력 버퍼에 출력할 수 있는 출력 스트림 객체</h3>
	<h3>1부터 10까지의 합 구하기</h3>
	<% 
		int sum = 0;
		for(int i=1; i<=10; i++) {
			sum += i;
	%>
			1부터 <%=i %>까지의 부분합 : <%=sum %><br>
	<%	} %>
		1부터 10까지의 합 : <%=sum %><br>
		
	<hr>
	
	<h3>1부터 10까지의 합 구하기 : out 객체 이용하기</h3>
	<% 
		sum = 0;
		for(int i=1; i<=10; i++) {
			sum += i;
			out.println("1부터" + i + "까지의 부분함 : " + sum +"<br>");  //<% 열고 닫을 필요 없이 작성 가능.
		} 
		out.println("1부터 10까지의 합 : " + sum);
	%>
		
</body>
</html>