<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/request1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>요청 파라미터 정보 출력하기</title>
</head>
<body>
	<h2>요청 파라미터 정보</h2>
	<%
		//setCharacterEncoding() : 요청 파라미터의 인코딩 방식 설정. -> method=post 인 경우만 처리 됨.
		//기본 인코딩 방식 : iso-8859, 8859_1 -> 스페인어
		//euc-kr로 인코딩 방식 변경.
		request.setCharacterEncoding("euc-kr");  //한글 깨지지 않게 하기 위함.
		String name = request.getParameter("name");  //<input type="text" name="name"> 태그가 넘어옴. name의 속성값이 파라미터 이름임. id속성 X
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String hobby = request.getParameter("hobby");  //파라미터 한 개만 가져올 수 있음.
		String year = request.getParameter("year");
	%>
	이름 : <%=name %><br>
	나이 : <%=age %><br>
	성별 : <%=gender.equals("1")?"남":"여" %><br>
	취미 : <%=hobby %><br>
	출생년도 : <%=year %><br>
	<h2>요청 파라미터에 저장된 모든 값 조회하기</h2>
	<h3>취미 : </h3>
	<%
		String[] hobbies = request.getParameterValues("hobby");  //getParameterValues() : 파라미터에 저장 된 모든 값을 배열로 저장. -> checkbox, select, ...
		for(String h : hobbies) { %>
		<%=h %>&nbsp;&nbsp;
	<% } %><br>
	<h2>모든 요청 파라미터의 모든 값 조회하기(파라미터 이름 모름)</h2>
	<table>
		<tr>
			<th>파라미터 이름</th><th>파라미터 값</th>		
		</tr>
		<% 
			//Enumeration : Iterator의 구버전. 반복자. Hashtable Map객체. -> key : 파라미터 이름, value : 파라미터 값.
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