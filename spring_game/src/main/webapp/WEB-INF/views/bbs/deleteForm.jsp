<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<BR><BR>

<div style="width:80%; text-align: center; margin: 0 auto;">
<BR><BR><BR><BR>
<h2 style="font-style: oblique;"> 게시글 삭제</h2>
<br>
<p>삭제하시면 복구할 수 없습니다.<br>삭제를 원하시면 비밀번호를 입력하세요.</p>



<form name="frm" method="post" action="./delete">

<input type="hidden" name="bbsno" value="${param.bbsno }">
<input type="hidden" name="col" value="${param.col }">
<input type="hidden" name="word" value="${param.word }">
<input type="hidden" name="nowPage" value="${param.nowPage }">
<input type="hidden" name="oldfile" value="${param.oldfile }">

<BR>
<table class="table" style="width:30%; margin: 0 auto;">
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="passwd" size="25" required="required"></td>
		</tr>
	</table>
	<input type="submit" value="확인">
	<input type="button" value="취소" onclick="history.back()">
</form>	
</div>
<BR><BR><BR><BR>

</body>
</html>