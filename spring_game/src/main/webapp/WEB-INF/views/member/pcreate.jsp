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
<br><BR><br><BR>
<div style="width:80%; text-align:center; margin: 0 auto;">
<h2 style="font-style: oblique;">아이디 및 이메일 중복확인</h2>

${str }
<br><BR><br><BR>
<input type="button" value="다시시도" onclick="history.back()">
</div>
<br><BR><br><BR>
</body>
</html>