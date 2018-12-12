<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function mlist(){
	var url = "list";
	url +="?col=${param.col}";
	url +="&word=${param.word}";
	url +="&nowPage=${param.nowPage}";
	
	location.href = url;
}
</script>
</head>
<body>
<div class=title style= text-align:center;>
<h3>쪽지 보내기</h3>
</div>

<div class= content style= text-align:center;>
<form action="./create" method="post">
<table border=2 bordercolor=red align=center>
<tr>
<th style="width:auto">제목</th>
<td><input type="text" name="subject" size=28 /></td>
</tr>
<tr>
<th style="width:auto">보내는이</th>
<td><input type="text" name="nicname" size=28 value="${nicname}"/></td>
</tr>
<tr>
<th style="width:auto">받는이</th>
<td><input type="text" name="meto" size=28 /></td>
</tr>
<tr>
<th>내용</th>
<td><textarea rows="10" cols="30" name="content"></textarea></td>
</tr>
</table>

<input type="submit" value = "등록"> 
<input type="button" value = "취소" onclick ="history.back()"> 
<input type="button" value = "목록" onclick="mlist()"><br> 
</form>

</div>
</body>
</html>