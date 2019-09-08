<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>포인트 상품 신청</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div>
		<form action="pointask.do" method="post">
			<input type="hidden" name="reqid" id="id" value="${mp.id }">
			<input type="hidden" name="itemimg" value="${pb.itemimg }">
			<input type="hidden" name="itemname" value="${pb.name }">
			<input type="hidden" name="itemno" value="${param.no }">
			<table>
				<tr><td rowspan="4"><img src="file/${pd.itemimg }" width="100" height="120"></td></tr>
				<tr><td>보유 포인트</td><td><input type="text" name="usablepoint" value="${mp.point }"></td></tr>
				<tr><td>사용 포인트</td><td><input type="text" name="itempoint" value="${pb.point }"></td></tr>
				<tr><td>잔여 포인트</td><td><input type="text" name="restpoint" value="${restpoint }"></td></tr>
				<tr><td colspan="3"><input type="checkbox" id="infoup">가입 시 입력한 정보 불러오기.</td></tr>
				<tr><td colspan="3"><input type="text" id="tel" name="reqtel" placeholder="Phon Number"></td></tr>
				<tr><td colspan="3"><input type="text" id="email" name="reqemail" placeholder="E-mail"></td></tr>
				<tr><td colspan="3"><input type="checkbox" id="agree"> 정보 제공에 동의합니다.</td></tr>
				<tr><td colspan="3">
						<input type="submit" value="신청">
						<a href="pointlist.do?bclass=1"><input type="button" value="취소"></a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#infoup").click(function() {
				$.ajax({
					url : "telmail.jsp",
					type : "post",
					data : {
						id : $("#id")
					},
					success : function(data) {
						$('#message').html(data);
					},
					error : function(xhr) {
						alert("서버오류 : " + xhr.status);
					}
				})
			})
		})
	</script>
	<div id="message"></div>
</body>
</html>