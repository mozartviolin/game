<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

<h2>Q&A게시판 수정하기</h2>
 
<FORM name='frm' method='POST' action='./update' onsubmit="return incheck(this)">
<input type="hidden" name="qano" value="${qabbsDTO.qano}"> 
<input type="hidden" name="col" value="${param.col}"> 
<input type="hidden" name="word" value="${param.word}"> 
<input type="hidden" name="nowPage" value="${param.nowPage}"> 
<hr>

<table>
	<tr>
		<th>닉네임</th>
		<td><input type="text" name="nicname" size="30"></td>
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

<BR>
<BR>
</body>
</html>