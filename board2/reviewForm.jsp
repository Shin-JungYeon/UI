<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/project1/board/reviewForm.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리뷰 글쓰기</title>
<script type="text/javascript">
	function board_submit() {
		f = document.f;
		if(f.pass.value == "") {
			alert("비밀번호를 입력하세요.");
			f.pass.focus();
			return;
		}
		if(f.subject.value == "") {
			alert("제목을 입력하세요.");
			f.subject.focus();
			return;
		}
		if(f.content.value == "") {
			alert("내용을 입력하세요.");
			f.content.focus();
			return;
		}
		f.submit();
	}
</script>
</head>
<body>
	<form action="write.do" method="post" enctype="multipart/form-data" name="f">
		<input type="hidden" name="bclass" value="${param.bclass }">
		<div>
			<select name="genre">
				<option>장르</option>
				<option value="로맨스">로맨스</option>
				<option value="공포">공포</option>
				<option value="드라마">드라마</option>
				<option value="판타지">판타지</option>
				<option value="추리스릴러">추리스릴러</option>
			</select>
			<select name="watchdate">
				<option>관람날짜</option>
				
			</select>
			<select name="watchloc">
				<option>관람지역</option>
				<option value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="인천">인천</option>
				<option value="부산">부산</option>
			</select>
			<select name="grade">
				<option>평점</option>
				<option value="1">★☆☆☆☆</option>
				<option value="2">★★☆☆☆</option>
				<option value="3">★★★☆☆</option>
				<option value="4">★★★★☆</option>
				<option value="5">★★★★★</option>
			</select>
		</div><br>
		<div>작성자</div><div><input type="text" name="id" value="${sessionScope.login }"></div>
		<div>비밀번호</div><div><input type="password" name="pass"></div>
		<div>제목</div><div><input type="text" name="subject"></div>
		<div>내용</div><div><textarea rows="15" name="content"></textarea></div>
		<div>첨부파일</div><div><input type="file" name="file"></div>
		<div><a href="javascript:board_submit()">[게시물 등록]</a></div>
	</form>
</body>
</html>