<%@ page contentType="text/html; charset=UTF-8" %>
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


function idfind(){
	var f = document.frm;
	var mname = f.mname.value.trim();
	var nicname = f.nicname.value.trim();
	var url = "./idfind";
	
	$.ajax({
		url:url,
		dataType:"text",
		type:"get",
		data:{"mname":mname,
			"nicname":nicname},
		success:function(data){
			$("#idresult").text(data.trim()).css("color","red");
		}
	});
}

function pwfind(){
	var f = document.frm2;
	var mname = f.mname.value.trim();
	var id = f.id.value.trim();
	var url = "./pwfind";
	
	$.ajax({
		url:url,
		dataType:"text",
		type:"get",
		data:{"id":id,
			"mname":mname},
		success:function(data){
			$("#pwresult").text(data.trim()).css("color","red");
		}
	});
}

</script>
</head>
<body>
<BR><BR>

<div style="width:80%; text-align: center; margin: 0 auto;">
<h2 style="font-style: oblique;"> 아아디 찾기</h2>
<br><BR>
	
<form name="frm" method="post">
<table class="table" style="width:30%; margin: 0 auto;">

<tr>
	<th>이름</th>
	<td><input type="text" name="mname" required="required"></td>
</tr>
<tr>
	<th>닉네임</th>
	<td><input type="text" name="nicname" required="required"></td>
</tr>		

</table>

<input type="button" value="찾기" onclick="idfind()">
<input type="reset" value="취소">

</form>
<div id="idresult"></div>
<hr><br><BR>


<h2 style="font-style: oblique;"> 비밀번호 찾기</h2>
<br><BR>

<form name="frm2" method="post">

<table class="table" style="width:30%; margin: 0 auto;">

<tr>
	<th>아이디</th>
	<td><input type="text" name="id" required="required"></td>
</tr>
<tr>
	<th>이름</th>
	<td><input type="text" name="mname" required="required"></td>
</tr>	 	

</table>


<input type="button" value="찾기" onclick="pwfind()">
<input type="reset" value="취소">

</form>

<div id="pwresult"></div>
</div>
<br><BR><br><BR>
</body>
</html>