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

<script type="text/javascript">

function update(){
	var url = "update";
	url = url + "?id=${memberDTO.id}";
	url = url + "&col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	
	location.href = url;
}

function mdel(){
	var url = "delete";
	url = url + "?id=${memberDTO.id}";
	url = url + "&col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	
	location.href = url;
}

</script>
</head>

<body>
<BR><BR>

<div style="width:80%; text-align: center; margin: 0 auto;">
<h2 style="font-style: oblique;"> 내 정보</h2>
<br>

	<table class="table" style="width:40%; margin: 0 auto;">
			<TR>
				<TD rowspan='8' style="width: 30%;text-align:left">
					플레이횟수:${memberDTO.playnum }<br>이긴횟수:${memberDTO.win }
					<br>승률:${per }
					
				</TD>
				<TH style="width: 20%">아이디</TH>
				<TD style="width: 50%">${memberDTO.id }</TD>
			</tr>
			<tr>
				<TH>성명</TH>
				<TD>${memberDTO.mname}</TD>
			</tr>
			<tr>
				<TH>닉네임</TH>
				<TD>${memberDTO.nicname}</TD>
			</tr>
			<tr>
				<TH>가입일</TH>
				<TD>${memberDTO.mdate}</TD>
			</tr>
			<tr>
				<TH>등급</TH>
				<TD>일반회원
				</TD>
			</tr>
		</table>
	
	<br><Br>
	<button type="button" onclick="update()">정보수정</button>
	<button type="button" onclick="mdel()">회원탈퇴</button>
	
</div>

<BR><BR>
</body>
</html>