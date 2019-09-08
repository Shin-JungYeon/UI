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
	<h3 class="t">${param.id }는 존재하는 id입니다.</h3>  <%-- id가 존재하는 경우는 t라는 클래스 속성 값을 줘서 앞에서 사용 가능하도록 함. --%>
	<script>
		$("#id").val("");
	</script>
</c:if>
<c:if test="${empty rs.rows }">
	<h3 class="f">${param.id }는 사용 가능한 id입니다.</h3>
</c:if>
