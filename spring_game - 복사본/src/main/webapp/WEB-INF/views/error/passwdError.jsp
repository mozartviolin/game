<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error</title>
</head>
<body>
<div class="container">


<p>잘못된 패스워드를 입력하셨습니다.<br>

<p>다시 시도하시거나 회원 가입을 하시기 바랍니다.</p>

<hr>
<button onclick="history.back()">다시 시도</button>
<button onclick="location.href='${pageContext.request.contextPath}/member/agree'">회원가입</button>
</div>

</body>
</html>