<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="width:80%; text-align: center;">

<p>삭제하시면 복구할 수 없습니다.<br>삭제를 원하시면 비밀번호를 입력하세요.</p>

<form name="frm" method="post" action="./delete">

<input type="hidden" name="bbsno" value="${param.bbsno }">
<input type="hidden" name="col" value="${param.col }">
<input type="hidden" name="word" value="${param.word }">
<input type="hidden" name="nowPage" value="${param.nowPage }">
<input type="hidden" name="oldfile" value="${param.oldfile }">

	<table style="width:50%; text-align: center;">
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="passwd" required="required"></td>
		</tr>
	</table>
	<input type="submit" value="확인">
	<input type="button" value="취소" onclick="history.back()">
</form>	
</div>

</body>
</html>