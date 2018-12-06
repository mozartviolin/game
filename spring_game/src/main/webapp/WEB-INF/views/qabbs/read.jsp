<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function blist(){
	var url = "list";
		url = url + "?col=${param.col}";
		url = url + "&word=${param.word}";
		url = url + "&nowPage=${param.nowPage}";
		
		location.href=url;
}
function mupdate(){
	var url = "update";
		url = url + "?qano=${qabbsDTO.qano}";
		url = url + "&col=${param.col}";
		url = url + "&word=${param.word}";
		url = url + "&nowPage=${param.nowPage}";
		
		location.href=url;
}
function mdelete(){
	var url = "delete";
		url = url + "?qano=${qabbsDTO.qano}";
		url = url + "&col=${param.col}";
		url = url + "&word=${param.word}";
		url = url + "&nowPage=${param.nowPage}";
		
		location.href=url;
}
function mreply(){
	var url="reply";
	url = url + "?qano=${qabbsDTO.qano}";
	url = url + "&word=${param.word}";
	url = url + "&col=${param.col}";
	url = url + "&nowPage=${param.nowPage}";
	
	location.href=url;
	
}
</script>
</head>
<body>

<h2>읽기</h2>

<hr>

<table>
	<tr>
		<th>글번호</th>
		<td>${qabbsDTO.qano}</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${qabbsDTO.nicname}</td>
	</tr>
	
	<tr>
		<th>제목</th>
		<td>${qabbsDTO.subject}</td>
	</tr>	
	<tr>
		<th>내용</th>
		<td height="400" valign="top">${content}</td>
	</tr>
	
</table>

<button onclick="blist()">목록</button>
<button onclick="mupdate()">수정하기</button>
<button onclick="mdelete()">삭제하기</button>
<button onclick="mreply()">답변하기</button>
  

</body>
</html>