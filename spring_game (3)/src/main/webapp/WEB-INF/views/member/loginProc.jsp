<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 

</head> 
<!-- *********************************************** -->
<body>

<div class='title' style='width:80%; text-align:center'>
 
<h2>로그인 처리</h2>
 
<c:choose>
	<c:when test="${flag }">
	로그인 되었습니다.<br><BR>
	<input type='button' value='홈' onclick="location.href='${root}/'">
	</c:when>
	<c:otherwise>
	아이디/비밀번호를 잘못 입력하셨거나<br>회원이 아닙니다.<br><BR>
	<input type='button' value='홈' onclick="location.href='${root}/'">
    <input type='button' value='다시시도' onclick="history.back()">
	</c:otherwise>
</c:choose>


  </DIV>
</body>
<!-- *********************************************** -->
</html> 
