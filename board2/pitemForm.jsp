<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>포인트 상품 등록</title>
<script type="text/javascript">
	if(f.pass.value == "") {
		alert("비밀번호를 입력하세요.");
		f.pass.focus();
		return;
	}
</script>
</head>
<body>
	<div>
		<form action="pitemadd.do" method="post" enctype="multipart/form-data" name="f">
			<table>
				<tr><td>상품 이미지</td>
					<td><input type="file" name="itemimg" style="width: 300px;"></td>
				</tr>
				<tr>
					<td>상품 이름</td>
					<td><input type="text" name="name" style="width: 300px;"></td>
				</tr>
				<tr>
					<td>상품 포인트</td>
					<td><input type="text" name="point" style="width: 300px;"></td>
				</tr>
				<tr><td colspan="2"><input type="submit" value="상품등록"></td></tr>
				<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
			</table>
		</form>
	</div>
</body>
</html>