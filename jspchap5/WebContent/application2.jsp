<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/application2.jsp --%>
<%-- 
	jsp의 4가지 영역
	  1. page 영역 : 하나 하나의 jsp 페이지. pageContext 객체가 관여. 페이지 각각의 자원을 가지고 있음. 
	  2. request 영역 : 한 번의 요청 후 응답까지 호출되는 모든 jsp 페이지.
	  				  request 객체를 공유함.
	  3. session 영역 : 같은 브라우저에서 호출되는 모든 jsp 페이지.
	  				  session 객체를 공유함. -> session 영역에 있는 모든 jsp 는 같은 session 객체를 공유.
	  4. application 영역 : 가장 넓은 영역. 웹 어플리케이션에 속한 모든 jsp 페이지.
	  					  application 객체를 공유함.
	  					     웹 어플리케이션 : jspchap5 프로젝트의 모든 jsp는 같은 application 영역임.
	
	영역 담당 객체는 속성 관련 메서드를 멤버로 가진다.
	  1. 속성 등록 : setAtrribute(키(key), 객체(value)) : 키는 반드시 String, 객체는 Object 타입이어야 함.
	  			 setAtrribute(String, Object)
	  2. 속성 조회 : getAtrribute(String)
	  3. 속성 제거 : removeAtrribute(String)
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>application 속성 조회</title>
</head>
<body>
	application 객체의 test 속성값 : <%=application.getAttribute("test") %>
</body>
</html>