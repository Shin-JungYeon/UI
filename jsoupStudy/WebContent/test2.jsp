<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/test2.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>네이버 검색 API : 내 이름 검색</title>
</head>
<body>
<%
	String clientId = "5Xob8uKhxQ6Ko8uKSzNa";  //애플리케이션 클라이언트 아이디값
	String clientSecret = "ZOwJrtafe9";  //애플리케이션 클라이언트 시크릿값
	try {
    	String text = URLEncoder.encode("신정연", "UTF-8");
    	//String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text;  //json 결과
    	String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;  //xml 결과
    	URL url = new URL(apiURL);
    	HttpURLConnection con = (HttpURLConnection)url.openConnection();
    	con.setRequestMethod("GET");
    	con.setRequestProperty("X-Naver-Client-Id", clientId);
    	con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
    	con.setRequestProperty("contentType", "text/html; charset=UTF-8");
    	int responseCode = con.getResponseCode();
    	BufferedReader br;
    	if(responseCode==200) {  //정상 호출
        	br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
    	} else {  //에러 발생
        	br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
    	}
    	String inputLine;
    	StringBuffer res = new StringBuffer();
    	while ((inputLine = br.readLine()) != null) {
        	res.append(inputLine);
    	}
    	br.close();
    	System.out.println(res.toString());
    	out.println(res.toString());
	} catch (Exception e) {
    	System.out.println(e);
	}
%>
<hr>
</body>
</html>