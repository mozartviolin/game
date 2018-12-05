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

<div style="width:80%;text-align:center;">
<h2>아이디 및 이메일 중복확인</h2>

${str }
<br><BR>
<input type="button" value="다시시도" onclick="history.back()">
</div>

</body>
</html>