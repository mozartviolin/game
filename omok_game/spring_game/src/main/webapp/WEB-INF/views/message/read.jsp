<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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

<BR><BR>

<div style="width:80%; text-align: center; margin: 0 auto;">

<div class= "title" style="text-align:center;"><h3>${dto.nicname}의 쪽지</h3></div>
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
		<c:choose>
		<c:when test="${dto.nicname==meto}">
		<tr>
		<th>닉네임</th>
		<td>${dto.meto}</td>
		</tr>
		</c:when>
		<c:otherwise>
		<tr>
		<th>닉네임</th>
		<td>${dto.nicname}</td>
		</tr>
		</c:otherwise>
		</c:choose>
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

</div>
<br>
<br>

</body>
</html>