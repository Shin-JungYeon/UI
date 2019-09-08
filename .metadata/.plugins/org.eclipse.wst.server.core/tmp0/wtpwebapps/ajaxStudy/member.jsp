<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/member.jsp : 파라미터 name의 값을 포함하는 member 목록 전송 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="UTF-8" />
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" url="jdbc:mariadb://localhost:3306/model1" user="model1" password="1234" />
<%-- sql:setDataSource : Connection 객체 생성. --%>
<sql:query var="rs" dataSource="${conn }">  <%-- rs : ResultSet 객체. 결과 저장 객체. --%>
	select * from member where name like ?
	<sql:param>%${param.name}%</sql:param>  <%-- ?는 파라미터로 전달받아 입력해줘야함. --%>
</sql:query>
<table border="1" style="border-collapse: collapse;">
	<tr><th>아이디</th><th>이름</th><th>전화</th><th>이메일</th><th>성별</th></tr>
	<c:forEach var="data" items="${rs.rows }">
		<tr><td>${data.id }</td><td>${data.name }</td><td>${data.tel }</td>
			<td>${data.email }</td><td>${data.gender==1?'남자':'여자' }</td>
		</tr>
	</c:forEach>
</table>