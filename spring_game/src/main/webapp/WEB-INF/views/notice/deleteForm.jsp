<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<BR><BR>

<div style="width:80%; text-align: center; margin: 0 auto;">

<div class="title" style = text-align:center;><h3>공지사항 삭제</h3></div>

<div class="content" style = "text-align:center;= ">
<form action="./delete" method="post">
<input type="hidden" name="n_no" value="${param.n_no}">
	<input type="hidden" name="oldfile" value="${param.oldfile}">
	<input type="hidden" name="col" value="${param.col}">
	<input type="hidden" name="word" value="${param.word}">
	<input type="hidden" name="nowPage" value="${param.nowPage}">
	
삭제하면 복구가 어렵습니다.
정말로 삭제하시겠습니까?

<br>
<br><input type="submit" value = "삭제"> 
<input type="button" value = "취소" onclick ="history.back()">

</form>
</div>


</div>
<br>
<br>

</body>
</html>