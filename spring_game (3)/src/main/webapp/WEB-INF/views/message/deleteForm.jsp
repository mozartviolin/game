<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="title" style = text-align:center;><h3>쪽지 삭제</h3></div>

<div class="content" style = "text-align:center;= ">
<form action="./delete" method="post">
<input type="hidden" name="mno" value="${param.mno}">
	<input type="hidden" name="col" value="${param.col}">
	<input type="hidden" name="word" value="${param.word}">
	<input type="hidden" name="nowPage" value="${param.nowPage}">
	
삭제하면 복구가 어렵습니다.
정말로 삭제하시겠습니까?


<br><input type="submit" value = "삭제"> 
<input type="button" value = "취소" onclick ="history.back()">

</form>
</div>
</body>
</html>