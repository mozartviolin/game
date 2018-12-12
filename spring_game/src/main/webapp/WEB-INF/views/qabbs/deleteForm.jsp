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
</script>

</head>
<body>

<BR>
<BR>

<div style="width:80%; text-align: center; margin: 0 auto;">
<BR><BR><BR><BR>
<h2 style="font-style: oblique;"> Q&A게시글 삭제</h2>
	 
	<FORM name='frm' method='POST' action='./delete' onsubmit="return incheck(this)">
		<input type="hidden" name="qano" value="${param.qano}"> 
		<input type="hidden" name="col" value="${param.col}"> 
		<input type="hidden" name="word" value="${param.word}"> 
		<input type="hidden" name="nowPage" value="${param.nowPage}"> 
		
	<h4> 삭제하면 복구할 수 없습니다.</h4>

<hr>

<table class="table" style="width:30%; margin: 0 auto;">
<tr>
<td>
<p>삭제하려면 비밀번호가 필요합니다. <br>
비밀번호를 입력하세요 </p>
<input type="password" name="passwd" size="30">
</td>
</tr>
</table>
		 
		  	<button type="submit">삭제하기</button>
		    <input type='button' value='목록으로 돌아가기' onclick="blist()">
		 
		 </FORM>

 </div>
<BR>
<BR>
<BR>
<BR>

</body>
</html>