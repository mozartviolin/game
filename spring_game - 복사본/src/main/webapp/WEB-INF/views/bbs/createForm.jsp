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

<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
  
</script>

<script type="text/javascript">

  if (CKEDITOR.instances['content'].getData() == '') {
    window.alert('내용을 입력해 주세요.');
    CKEDITOR.instances['content'].focus();
    
    return false;
  }

</script>

<script type="text/javascript">


function incheck(f){
	 if(f.code.value==0){
		 alert("말머리를 선택하세요.");
		 f.code.focus();
		 
		 return false;
	}
} 


</script>

</head>
<body>
<BR><BR>

<div style="width:80%; text-align: center; margin: 0 auto;">
<h2 style="font-style: oblique;"> 게시글 작성</h2>
<br>

<form name="frm" method="post" enctype="multipart/form-data" action="./create"
	onsubmit="return incheck(this)">

<table class="table" style="width:60%; margin: 0 auto;">
	
<tr>
	<th>말머리</th>
	<td>
	<select name="code">
	<option value="0">말머리를 선택하세요</option>
	<option value="A01">오목</option>
	<option value="A02">숫자야구</option>
	<option value="A03">벽돌깨기</option>
	<option value="A04">폭탄해체</option>
	<option value="A10">기타</option>
	</select>
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
	<input type="text" name="subject" size="25" required="required">
	</td>
</tr>
<tr>
	<th>작성자</th>
	<td>${sessionScope.nicname }</td> 
</tr>
<tr>
	<th>내용</th>
	<td><textarea name="content" cols="50" rows="20"></textarea></td>
</tr>
<tr>
	<th>파일</th>
	<td><input type="file" name="filenameMF"></td>
</tr>
<tr>
	<th>비밀번호</th>
	<td><input type="password" name="passwd" size="25" required="required"></td>
</tr>
	
</table>

<div style="text-align: center">

<input type="submit" value="등록">
<input type="reset" value="취소">

</div>
</form>

</div>
<BR><BR>
</body>
</html>