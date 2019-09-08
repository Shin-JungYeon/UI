<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/pictureimg.jsp --%>
<%--
	1. 파일 업로드 하기.
		- 업로드 위치 : model1/member/img/ 로 설정.
	2. 파일 업로드 완료 후 파일의 내용을 opener에 출력하고 현재 윈도우는 close 함.
--%>
<%
	String path = application.getRealPath("/") + "model1/member/img/";
	String filename = null;
	try {
		MultipartRequest multi = new MultipartRequest(request, path, 10*1024*1024, "euc-kr");  //객체 생성하면 파일 업로드 완료.
		filename = multi.getFilesystemName("picture");  //picture : <input type="file" name="picture"> 의 name과 같아야 함.
	} catch(IOException e) {
		e.printStackTrace();
	}
%>
<script>
	img = opener.document.getElementById("pic");  //opener : joinForm.jsp 의 id가 pic인 태그를 선택해서 보여줘.
	img.src = "img/<%=filename%>";  //업로드 된 이미지를 회원가입 화면에 출력.
	opener.document.f.picture.value = "<%=filename %>";  //파라미터에 파일이름 설정.
	self.close();  //현재 윈도우창 닫기.
</script>