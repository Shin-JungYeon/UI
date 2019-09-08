<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/sessiontot.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>장바구니 목록 보기</title>
</head>
<body>
	<%
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("cart");  //속성 조회. session 객체로부터 이름이 cart인 속성의 객체를 리턴. Object 타입임. -> ArrayList 객체로 형변환.
		if(list == null || list.size() == 0) { %>
			<h3>장바구니에 상품이 없습니다.</h3>
	<% 
		} else {
			for(String p : list) { %>
			<h4><%=p %></h4>
	<% 		}
		} 
		//session의 속성을 제거. session 객체 자체는 남아있음.
		//session.removeAttribute("cart");
		
		//session 객체를 새로 설정하기. 기존의 session 무력화시키고 새로운 session으로 바꿔줌. -> 속성이 존재하지 않음.
		session.invalidate();
	%>
</body>
</html>