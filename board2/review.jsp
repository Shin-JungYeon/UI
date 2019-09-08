<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- /WebContent/project1/board/review.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �Խ���</title>
<script type="text/javascript">
	function commentadd() {
		
	}
	function like() {
		
	}
</script>
<link rel="stylesheet" href="/project1/css/project.css">
</head>
<body>
<div>
	<table>
		<tr><td>�帣</td><td>���� ����</td><td>���� ��¥</td><td>����</td></tr>
		<tr><td>${b.genre }</td><td>${b.watchloc }</td><td>${b.watchdate }</td>
			<td>
				<c:choose>
					<c:when test="${b.grade == 5 }">�ڡڡڡڡ�</c:when>
					<c:when test="${b.grade == 4 }">�ڡڡڡڡ�</c:when>
					<c:when test="${b.grade == 3 }">�ڡڡڡ١�</c:when>
					<c:when test="${b.grade == 2 }">�ڡڡ١١�</c:when>
					<c:otherwise>�ڡ١١١�</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr><td width="30%">�۾���</td><td colspan="3" width="80%" style="text-align: left">${b.id }</td></tr>
		<tr><td>����</td><td style="text-align: left">${b.subject }</td></tr>
		<tr><td>����</td>
			<td colspan="3">
				<table style="width: 100%; height: 250px;">
					<tr><td style="border-width: 0px; vertical-align: top; text-align: left;">${b.content }</td></tr>
				</table>
			</td></tr>
		<tr><td>÷������</td>
			<td colspan="3" style="text-align: left">
			<c:if test="${!empty b.file }">
				<a href="file/${b.file }">${b.file }</a>
			</c:if>
			<c:if test="${empty b.file }">
				&nbsp;&nbsp;&nbsp;
			</c:if>
			</td></tr>
		
	</table>
	<table>
		<tr><td>���[${commcnt }]</td><td>��ȸ�� ${b.readcnt }</td><td>��õ�� ${likecnt }</td></tr>
	</table>
		<table>
			<tr><td></td></tr>
		</table>
		<form action="" method="post" name="commf">
			<table>
				<tr><td><input type="text" name="comment"></td>
					<td><input type="button" value="�Է�" id="commentadd"></td>
					<td><input type="button" value="��õ" onclick="like()"></td></tr>
			</table>
		</form>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$("#commentadd").click(function() {
				var data = "id=" + $("#id").val();
				$.ajax({
					url : "overlapChk.jsp",
					type : "post",
					data : {
						id: $("#id").val(),
						content: $("#content").val(),
						num: $(param.num)
					},
					success : function(data) {
						
					},
					error : function(xhr) {
						alert("�������� : " + xhr.status);
					}
				})
			})
		})
	</script>
	
	<table>
		<tr><td></td></tr>
		<tr><td colspan="3">
			<c:if test="${login == b.id }">
				<a href="updateForm.do?num=${b.num }">[����]</a>
				<a href="deleteForm.do?num=${b.num }">[����]</a>
			</c:if>
				<a href="reviewlist.do?bclass=2">[���]</a>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>