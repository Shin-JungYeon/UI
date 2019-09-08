<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/ajax2.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="UTF-8" />
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" url="jdbc:mariadb://localhost:3306/model1" user="model1" password="1234" />

<sql:query var="rs" dataSource="${conn }">  <%-- rs라는 객체는...? --%>
	select * from member where id = ? and pass = ?
	<sql:param>${param.id }</sql:param>
	<sql:param>${param.pass }</sql:param>  <%-- 쿼리문에 pass까지 넣어버리면 둘 다 맞을 경우에만 조회됨. --%>
</sql:query>

<%--
<c:choose>
	<c:when test="${!empty rs.rows }">
		<c:forEach var="data" items="${rs.rows }">
			${data.name }님 반갑습니다.<br>
		</c:forEach>
	</c:when>
	<c:otherwise>
		아이디 또는 비밀번호가 틀렸습니다.<br>
	</c:otherwise>
</c:choose>
--%>

<c:if test="${!empty rs.rows }">
	<c:forEach var="data" items="${rs.rows }">
		${data.name }님 반갑습니다
	</c:forEach>
</c:if>
<c:if test="${empty rs.rows }">
	아이디 또는 비밀번호가 틀렸습니다.
</c:if>
