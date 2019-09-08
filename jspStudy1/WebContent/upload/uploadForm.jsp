<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/upload/uploadForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>파일 업로드창</title>
<link rel="stylesheet" href="/jspStudy1/css/main.css">
</head>
<body>
	<form action="uplaod.jsp" method="post" enctype="multipart/form-data">
	<%--
		파일 업로드시 반드시 enctype="multipart/form-data" 설정해야 함.
		  -> 내가 선택한 파라미터 정보와 파일의 내용까지 서버로 전송할 수 있도록 해줌.
		  -> 반드시 method="post" 여야 함.
		  -> uplaod.jsp 에서는 request 객체를 직접 사용할 수 없음. utility들이 필요.
		  	 cos.jar 파일을 classpath로 설정하여 MultipartRequest 객체를 사용해야 함.
	--%>
		<table>
			<tr><td>올린사람</td><td><input type="text" name="name"></td></tr>
			<tr><td>제목</td><td><input type="text" name="title"></td></tr>
			<tr><td>파일</td><td><input type="file" name="file1"></td></tr>
			<tr><td colspan="2"><input type="submit" value="전송"></td></tr>
		</table>
	</form>
</body>
</html>