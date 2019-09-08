<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/ajax2.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="UTF-8" />
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" url="jdbc:mariadb://localhost:3306/model1" user="model1" password="1234" />

<sql:query var="rs" dataSource="${conn }">  <%-- rs��� ��ü��...? --%>
	select * from member where id = ? and pass = ?
	<sql:param>${param.id }</sql:param>
	<sql:param>${param.pass }</sql:param>  <%-- �������� pass���� �־������ �� �� ���� ��쿡�� ��ȸ��. --%>
</sql:query>

<%--
<c:choose>
	<c:when test="${!empty rs.rows }">
		<c:forEach var="data" items="${rs.rows }">
			${data.name }�� �ݰ����ϴ�.<br>
		</c:forEach>
	</c:when>
	<c:otherwise>
		���̵� �Ǵ� ��й�ȣ�� Ʋ�Ƚ��ϴ�.<br>
	</c:otherwise>
</c:choose>
--%>

<c:if test="${!empty rs.rows }">
	<c:forEach var="data" items="${rs.rows }">
		${data.name }�� �ݰ����ϴ�
	</c:forEach>
</c:if>
<c:if test="${empty rs.rows }">
	���̵� �Ǵ� ��й�ȣ�� Ʋ�Ƚ��ϴ�.
</c:if>
