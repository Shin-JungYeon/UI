<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/ajax4.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="UTF-8" />
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" url="jdbc:mariadb://localhost:3306/model1" user="model1" password="1234" />

<sql:query var="rs" dataSource="${conn }">
	select * from member where id = ?
	<sql:param>${param.id }</sql:param>
</sql:query>

<c:if test="${!empty rs.rows }">
	<h3 class="t">${param.id }�� �����ϴ� id�Դϴ�.</h3>  <%-- id�� �����ϴ� ���� t��� Ŭ���� �Ӽ� ���� �༭ �տ��� ��� �����ϵ��� ��. --%>
	<script>
		$("#id").val("");
	</script>
</c:if>
<c:if test="${empty rs.rows }">
	<h3 class="f">${param.id }�� ��� ������ id�Դϴ�.</h3>
</c:if>
