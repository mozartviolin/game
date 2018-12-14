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
<br><BR>
<div style="width:80%;text-align:center; margin: 0 auto;">

<h2 style="font-style: oblique;">회원가입 처리</h2>
<br><BR>

<c:choose>
	<c:when test="${flag }">
	회원가입이 완료되었습니다.<br><BR>
	<input type="button" value="로그인" onclick="location.href='login'">
	<input type="button" value="홈" onclick="location.href='${root}/'">
	</c:when>
	
	<c:otherwise>
	회원가입을 실패했습니다.<br><BR>
	<input type="button" value="다시시도" onclick="history.back()">
	<input type="button" value="홈" onclick="location.href='${root}/'">
	</c:otherwise>

</c:choose>

</div>
<br><BR>
</body>
</html>