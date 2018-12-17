<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function nlist() {
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}
</script>
</head>
<body>

<br>
<br>

<div style="width:80%; text-align: center; margin: 0 auto;">

	<div class=title style="text-align: center;">
		<h3>공지사항 등록</h3>
	</div>
	<div class=content style="text-align: center;">
		<form action="./create" method="post" enctype="multipart/form-data">
			<table class="table" style="width:60%; margin: 0 auto;">
				<tr>
					<th>제목</th>
					<td><input type="text" name="subject"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name = "nicname" value="${nicname}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="20" cols="50" name="content"></textarea></td>
				</tr>
				<tr>
					<th>파일</th>
					<td><input type="file" name="filenameMF"></td>
				</tr>
			</table>

			<input type="submit" value="등록"> <input type="button"
				value="취소" onclick="history.back()"> <input type="button"
				value="목록" onclick="nlist()">
		</form>
	</div>

</div>
<br>
<br>
</body>
</html>