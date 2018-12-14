<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- ckeditor -->
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');
  };
 </script>

</head>

<body>
<BR>
<BR>
<div style="width:80%; text-align: center; margin: 0 auto;">
<h2 style="font-style: oblique;"> Q&A게시글 수정</h2>
<br>
 
<FORM name='frm' method='POST' action='./update' onsubmit="return incheck(this)">
<input type="hidden" name="qano" value="${qabbsDTO.qano}"> 
<input type="hidden" name="col" value="${param.col}"> 
<input type="hidden" name="word" value="${param.word}"> 
<input type="hidden" name="nowPage" value="${param.nowPage}"> 
<hr>

<table class="table" style="width:60%; margin: 0 auto;">
	<tr>
		<th>닉네임</th>
		<td>
		<input type="hidden" name="nicname" value="${sessionScope.nicname }"/>
		${sessionScope.nicname }
		</td>
	</tr>
	<tr>
		<th>문의주제</th>
		<td>
		<input type="radio" name="category" value="문의" checked="checked" /> 문의
		<input type="radio" name="category" value="신고" /> 신고
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="subject" size="60"></td>
	</tr>	
	<tr>
		<th>내용</th>
		<td><textarea rows="20" cols="50" name="content"></textarea></td>
	</tr>
	<tr>
		<th>패스워드</th>
		<td><input type="password" name="passwd" size="40"></td>
	</tr>
</table>

  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>

</div>
<BR>
<BR>
</body>
</html>