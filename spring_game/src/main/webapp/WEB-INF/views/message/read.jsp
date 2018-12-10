<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function mcreate(){
	var url = "create";
	
	location.href=url;
}

function mdelete(){
	var url = "delete";
	url +="?col=${param.col}";
	url +="&word=${param.word}";
	url +="&nowPage=${param.nowPage}";
	url +="&mno=${param.mno}";
	
	location.href = url;
}

function mlist(){
	var url = "list";
	url +="?col=${param.col}";
	url +="&word=${param.word}";
	url +="&nowPage=${param.nowPage}";
	
	location.href = url;
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class= "title"><h3>${dto.meto}의 쪽지</h3></div>
<div class="content">
<table table width=500 border=2 bordercolor=red align=center>
		<tr width="300">
			<th>제목</th>
			<td>${dto.subject}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td height="200">${dto.content}</td>
		</tr>
		<tr>
		<th>보낸이</th>
		<td>${dto.mefrom}</td>
		</tr>
		<tr>
			<th>발신일</th>
			<td>${dto.mdate}</td>
		</tr>
	</table>
</div>
<div class="bottom" style= "text-align:center;">
<input type="button" value = "등록" onclick="mcreate()">
<input type="button" value = "삭제" onclick="mdelete()">
<input type="button" value = "목록" onclick="mlist()">
</div>
</body>
</html>