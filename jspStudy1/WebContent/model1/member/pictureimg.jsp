<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/pictureimg.jsp --%>
<%--
	1. ���� ���ε� �ϱ�.
		- ���ε� ��ġ : model1/member/img/ �� ����.
	2. ���� ���ε� �Ϸ� �� ������ ������ opener�� ����ϰ� ���� ������� close ��.
--%>
<%
	String path = application.getRealPath("/") + "model1/member/img/";
	String filename = null;
	try {
		MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");  //��ü �����ϸ� ���� ���ε� �Ϸ�.
		filename = multi.getFilesystemName("picture");  //picture : <input type="file" name="picture"> �� name�� ���ƾ� ��.
	} catch(IOException e) {
		e.printStackTrace();
	}
%>
<script>
	img = opener.document.getElementById("pic");  //opener : joinForm.jsp �� id�� pic�� �±׸� �����ؼ� ������.
	img.src = "img/<%=filename%>";  //���ε� �� �̹����� ȸ������ ȭ�鿡 ���.
	opener.document.f.picture.value = "<%=filename %>";  //�Ķ���Ϳ� �����̸� ����.
	self.close();  //���� ������â �ݱ�.
</script>