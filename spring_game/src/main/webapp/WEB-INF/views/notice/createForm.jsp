<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function nlist(){
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
<h3>공지사항 등록</h3>
</div>
    <div class= content style= text-align:center;>
<form action="./create" method="post" enctype="multipart/form-data">
<table>
<tr>
<th>제목</th>
<td><input type="text" name = "subject"></td>
</tr>
<tr>
<th>닉네임</th>
<td><input type="text" name = "nicname"></td>
</tr>
<tr>
<th>내용</th>
<td><textarea rows="20" cols="50" name="content"></textarea></td>
</tr>
<tr>
<th>파일</th>
<td><input type="file" name = "filenameMF"></td>
</tr>
</table>

<input type="submit" value = "등록"> 
<input type="button" value = "취소" onclick ="history.back()"> 
<input type="button" value = "목록" onclick="nlist()"> 

</form>
</div>
</body>
</html>