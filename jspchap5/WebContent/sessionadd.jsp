<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/sessionadd.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>session을 이용한 장바구니</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		String product = request.getParameter("product");
		
		//session.getAttribute("cart") : 속성 조회. session 객체에 등록된 속성 중 이름이 cart인 객체를 리턴. 속성 : 브라우저와 상관없이 서버 안에서 값을 주고받을 수 있음.
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("cart");  //cart 라는 속성을 우선 조회해봄.
		
		if(list == null) {  //조회했을 때 없으면 list에 새로운 객체 생성하고 아래에서 setAttribute로 등록. cart라는 속성이 존재하면 그대로 사용.
			list = new ArrayList<String>();
			
			//session.setAttribute("cart", list) : 속성 등록. session 객체의 cart 이름을 가진 속성에 list 객체를 저장.
			session.setAttribute("cart", list);
		}
		
		list.add(product);
	%>
	<script type="text/javascript">
		alert("<%=product %>이(가) 추가 되었습니다.");
		history.go(-1);  //앞 페이지로 돌아가기.
	</script>
</body>
</html>