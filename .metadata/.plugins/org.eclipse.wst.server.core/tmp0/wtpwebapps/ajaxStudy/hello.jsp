<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/hello.jsp --%>
<% request.setCharacterEncoding("UTF-8");  //ajax 인코딩 방식은 브라우저와 상관없이 UTF-8 %>
<h3>안녕하세요 <font color="blue">${param.name }</font>입니다.</h3>