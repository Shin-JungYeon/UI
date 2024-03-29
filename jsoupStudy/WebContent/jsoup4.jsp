<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/jsoup4.jsp --%>
<%-- jsoup3.jsp 페이지에 통화 국가명 추가하기. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>class 속성으로 조회하기</title>
<style type="text/css">
	table,th,td {border: 2px solid grey;}
</style>
</head>
<body>
<%
	String url = "https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
	Document doc = null;
	List<String> list = new ArrayList<String>();
	List<String> list2 = new ArrayList<String>();
	try {
		doc = Jsoup.connect(url).get();
		Elements e1 = doc.select(".tc");  //class 속성값이 tc인 태그들만 선택. 데이터 분석 필요. 소스가 어떻게 구성되어 있는 지 알아야 원하는 정보 가져올 수 있음.
		Elements e2 = doc.select(".tl2.bdl");  //class 속성값이 tl2, bdl인 태그 선택.
		for(Element ele : e1) {
			list.add(ele.html());
		}
		for(Element ele : e2) {
			list2.add(ele.html());
		}
	} catch(IOException e) {
		e.printStackTrace();
	}
	pageContext.setAttribute("list", list);  //list를 속성으로 등록.
	pageContext.setAttribute("list2", list2);
%>
	<table>		
		<c:forEach items="${list }" var="v" varStatus="stat">
			<c:choose>
				<c:when test="${stat.index % 7 == 0 }">  <%-- 통화코드 --%>
					<tr><td rowspan="6">${v }</td>
						<td rowspan="6">${list2[stat.index/7] }</td>  <%-- ArrayList도 배열과 같은 형태로 나타낼 수 있음.(jstl에서만) --%>
				</c:when>
				<c:when test="${stat.index % 7 == 1 }">
					<td>${v }</td>
				</c:when>
				<c:otherwise>
					<tr><td>${v }</td></tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</table>
</body>
</html>