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
<title>���̹� �˻� API : �� �̸� �˻�</title>
</head>
<body>
<%
	String clientId = "5Xob8uKhxQ6Ko8uKSzNa";  //���ø����̼� Ŭ���̾�Ʈ ���̵�
	String clientSecret = "ZOwJrtafe9";  //���ø����̼� Ŭ���̾�Ʈ ��ũ����
	try {
    	String text = URLEncoder.encode("������", "UTF-8");
    	//String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text;  //json ���
    	String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;  //xml ���
    	URL url = new URL(apiURL);
    	HttpURLConnection con = (HttpURLConnection)url.openConnection();
    	con.setRequestMethod("GET");
    	con.setRequestProperty("X-Naver-Client-Id", clientId);
    	con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
    	con.setRequestProperty("contentType", "text/html; charset=UTF-8");
    	int responseCode = con.getResponseCode();
    	BufferedReader br;
    	if(responseCode==200) {  //���� ȣ��
        	br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
    	} else {  //���� �߻�
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