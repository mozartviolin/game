<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="./jquery.js"></script>
<script type="text/javascript">

</script>
</head>
<body>

<div style="width:80%;text-align:Center" >
<h1>회원탈퇴</h1><br><br>

<form name="frm" method="post" action="./delete">
<input type="hidden" name="id" value="${id }">
<input type="hidden" name="col" value="${param.col }">
<input type="hidden" name="word" value="${param.word }">
<input type="hidden" name="nowPage" value="${param.nowPage }">

주의*<br>
탈퇴시 가입 정보 및 활동 권한이 삭제되며 복구할 수 없습니다<br>
탈퇴를 원하시면 아래 비밀번호를 입력 해 주세요<br><br>


<input type="password" name="passwd" />
<br><br>
<input type="submit" value="탈퇴">
<input type="button" value="취소" onclick="history.back()">

</form>
</div>

</body>
</html>