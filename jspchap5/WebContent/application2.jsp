<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/application2.jsp --%>
<%-- 
	jsp�� 4���� ����
	  1. page ���� : �ϳ� �ϳ��� jsp ������. pageContext ��ü�� ����. ������ ������ �ڿ��� ������ ����. 
	  2. request ���� : �� ���� ��û �� ������� ȣ��Ǵ� ��� jsp ������.
	  				  request ��ü�� ������.
	  3. session ���� : ���� ���������� ȣ��Ǵ� ��� jsp ������.
	  				  session ��ü�� ������. -> session ������ �ִ� ��� jsp �� ���� session ��ü�� ����.
	  4. application ���� : ���� ���� ����. �� ���ø����̼ǿ� ���� ��� jsp ������.
	  					  application ��ü�� ������.
	  					     �� ���ø����̼� : jspchap5 ������Ʈ�� ��� jsp�� ���� application ������.
	
	���� ��� ��ü�� �Ӽ� ���� �޼��带 ����� ������.
	  1. �Ӽ� ��� : setAtrribute(Ű(key), ��ü(value)) : Ű�� �ݵ�� String, ��ü�� Object Ÿ���̾�� ��.
	  			 setAtrribute(String, Object)
	  2. �Ӽ� ��ȸ : getAtrribute(String)
	  3. �Ӽ� ���� : removeAtrribute(String)
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>application �Ӽ� ��ȸ</title>
</head>
<body>
	application ��ü�� test �Ӽ��� : <%=application.getAttribute("test") %>
</body>
</html>