<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/naver1.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>네이버 검색 API</title>
</head>
<body>
<%
	String clientId = "5Xob8uKhxQ6Ko8uKSzNa";  //애플리케이션 클라이언트 아이디값. 해쉬 값으로 전달. 한 자도 틀리면 안됨. 네이버가 제공.
	String clientSecret = "ZOwJrtafe9";  //애플리케이션 클라이언트 시크릿값.
	try {
    	String text = URLEncoder.encode("자바", "UTF-8");  //검색하고자 하는 키워드 입력. 한글은 UTF-8로 인식(영문도 인식 가능).
    	String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text;  //json 결과. .json 생략 가능.
    	//String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;  //xml 결과.
    	URL url = new URL(apiURL);
    	HttpURLConnection con = (HttpURLConnection)url.openConnection();  //URLConnection 객체. http형태로 저장.
    	con.setRequestMethod("GET");
    	con.setRequestProperty("X-Naver-Client-Id", clientId);
    	con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
    	con.setRequestProperty("contentType", "text/html; charset=UTF-8");  //검색된 내용에서 한글을 인식시키기 위함.
    	int responseCode = con.getResponseCode();  //에러 코드 저장.
    	BufferedReader br;
    	if(responseCode==200) {  //정상 호출.
        	br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
    	} else {  //에러 발생.
        	br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
    	}
    	String inputLine;
    	StringBuffer res = new StringBuffer();
    	while ((inputLine = br.readLine()) != null) {
        	res.append(inputLine);
    	}
    	br.close();
    	System.out.println(res.toString());  //console창에 출력.
    	out.println(res.toString());  //web화면에 출력.
	} catch (Exception e) {
    	System.out.println(e);
	}
%>
</body>
</html>