<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class=title style= text-align:center;>
<h3>공지사항 수정</h3>
</div>
    <div class= content style= text-align:center;>
<form action="./update" method = "post" enctype="multipart/form-data">
<input type="hidden" name="n_no" value="${param.n_no}">
<input type="hidden" name="oldfile" value="${param.oldfile}">
	<input type="hidden" name="col" value="${param.col}">
	<input type="hidden" name="word" value="${param.word}">
	<input type="hidden" name="nowPage" value="${param.nowPage}">
<table>
<tr>
<th>제목</th>
<td><input type="text" name = "subject" value = "${noticeDTO.subject}"></td>
</tr>
<tr>
<th>닉네임</th>
<td>${noticeDTO.nicname}</td>
</tr>
<tr>
<th>내용</th>
<td><textarea rows="20" cols="50" name="content"></textarea></td>
</tr>
<tr>
<th>파일</th>
<td><input type="file" name = "filenameMF">기존파일 : ${noticeDTO.filename}</td>
</tr>
</table>

<input type="submit" value = "수정"> 
<input type="button" value = "취소" onclick ="history.back()"> 
<input type="button" value = "목록" onclick="nlist()">
</form> 
</div>
</body>
</html>