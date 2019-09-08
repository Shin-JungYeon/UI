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
<title>���̹� �˻� API</title>
</head>
<body>
<%
	String clientId = "5Xob8uKhxQ6Ko8uKSzNa";  //���ø����̼� Ŭ���̾�Ʈ ���̵�. �ؽ� ������ ����. �� �ڵ� Ʋ���� �ȵ�. ���̹��� ����.
	String clientSecret = "ZOwJrtafe9";  //���ø����̼� Ŭ���̾�Ʈ ��ũ����.
	try {
    	String text = URLEncoder.encode("�ڹ�", "UTF-8");  //�˻��ϰ��� �ϴ� Ű���� �Է�. �ѱ��� UTF-8�� �ν�(������ �ν� ����).
    	String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text;  //json ���. .json ���� ����.
    	//String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text;  //xml ���.
    	URL url = new URL(apiURL);
    	HttpURLConnection con = (HttpURLConnection)url.openConnection();  //URLConnection ��ü. http���·� ����.
    	con.setRequestMethod("GET");
    	con.setRequestProperty("X-Naver-Client-Id", clientId);
    	con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
    	con.setRequestProperty("contentType", "text/html; charset=UTF-8");  //�˻��� ���뿡�� �ѱ��� �νĽ�Ű�� ����.
    	int responseCode = con.getResponseCode();  //���� �ڵ� ����.
    	BufferedReader br;
    	if(responseCode==200) {  //���� ȣ��.
        	br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
    	} else {  //���� �߻�.
        	br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
    	}
    	String inputLine;
    	StringBuffer res = new StringBuffer();
    	while ((inputLine = br.readLine()) != null) {
        	res.append(inputLine);
    	}
    	br.close();
    	System.out.println(res.toString());  //consoleâ�� ���.
    	out.println(res.toString());  //webȭ�鿡 ���.
	} catch (Exception e) {
    	System.out.println(e);
	}
%>
</body>
</html>