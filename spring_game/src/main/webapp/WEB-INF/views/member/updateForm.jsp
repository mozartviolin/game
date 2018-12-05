<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript" src="./jquery.js"></script>
<script type="text/javascript">

$.ajaxSetup({
    error: function(jqXHR, exception) {
        if (jqXHR.status === 0) {
            alert('Not connect.\n Verify Network.');
        }
        else if (jqXHR.status == 400) {
            alert('Server understood the request, but request content was invalid. [400]');
        }
        else if (jqXHR.status == 401) {
            alert('Unauthorized access. [401]');
        }
        else if (jqXHR.status == 403) {
            alert('Forbidden resource can not be accessed. [403]');
        }
        else if (jqXHR.status == 404) {
            alert('Requested page not found. [404]');
        }
        else if (jqXHR.status == 500) {
            alert('Internal server error. [500]');
        }
        else if (jqXHR.status == 503) {
            alert('Service unavailable. [503]');
        }
        else if (exception === 'parsererror') {
            alert('Requested JSON parse failed. [Failed]');
        }
        else if (exception === 'timeout') {
            alert('Time out error. [Timeout]');
        }
        else if (exception === 'abort') {
            alert('Ajax request aborted. [Aborted]');
        }
        else {
            alert('Uncaught Error.n' + jqXHR.responseText);
        }
    }
});


function nicCheck(nicname){
	if(nicname==""){
		alert("닉네임을 입력하세요.");
		document.frm.nicname.focus();
	
	}else{
		var url = "nicCheck";
		
		$.ajax({
			url:url,
			type:"GET",
			dataType:'text',
			data:{"nicname":nicname},
			success:function(data){
				$("#nicCheck").text(data.trim()).css("color","red");
			}
		});
	}
}


</script>
<style type="text/css">

</style>
</head>
<body>
<div class="content" style="width:80%;text-align:center;align:center">
	<h2><span class="glyphicon glyphicon-pencil"></span>
	회원수정</h2>
	
		<form name="frm" method="post" action="./update" onsubmit="return incheck(this)">
		
			<input type="hidden" name="id" value="${memberDTO.id }">
			<input type="hidden" name="col" value="${param.col }">
			<input type="hidden" name="word" value="${param.word }">
			<input type="hidden" name="nowPage" value="${param.nowPage }">
		
			<table>
				<tr>
					<th>아이디</th>
					<td style=text-align:left>${memberDTO.id }</td>
					<td style=text-align:center>아이디</td>
				</tr>
			
					<tr>
					<th>이름</th>
					<td style=text-align:left>${memberDTO.mname }
					<td style=text-align:center>실명</td>
				</tr>
					<tr>
					<th>닉네임</th>
					<td style=text-align:left>
					<input type="text" name="nicname" size="10" value="${memberDTO.nicname }" required autofocus>
					<button type="button" onclick="nicCheck(document.frm.nicname.value)">중복확인</button>
					<div id="nicCheck"></div>
					<td style=text-align:center>게임내에서 사용하실 별명을 적어주세요</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td style=text-align:left><input type="password" name="passwd" size="20" required>
					<td style=text-align:center>패스워드를 적어주세요.</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td style=text-align:left><input type="password" name="repasswd" size="20" required>
					<td style=text-align:center>패스워드를 확인합니다.</td>
				</tr>
			
			
			</table>

		<input type="submit" value="회원수정">
		<input type="button" value="취소" onclick="history.back()">

	
	</form>
		</div>

</body>
</html>