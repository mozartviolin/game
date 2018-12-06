<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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


function blist(){
	
	url = "list";
	url = url + "?col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	
	location.href = url;
}


</script>

</head>
<body>

<div style="width:80%; text-align: center;">

<form name="frm" method="post" enctype="multipart/form-data" action="./update"
	onsubmit="return incheck(this)">
	
	<input type="hidden" name="bbsno" value="${bbsDTO.bbsno }">
	<input type="hidden" name="col" value="${param.col }">
	<input type="hidden" name="word" value="${param.word }">
	<input type="hidden" name="nowPage" value="${param.nowPage }">
	<input type="hidden" name="oldfile" value="${bbsDTO.filename }">

<table style="width:60%; text-align: center;">
	
<tr>
	<th>말머리</th>
	<td>
	<select name="code">
	<option value="0">말머리를 선택하세요</option>
	<option value="A01"
	<c:if test="${bbsDTO.code=='A01' }">selected</c:if>
	>오목</option>
	<option value="A02"
	<c:if test="${bbsDTO.code=='A02' }">selected</c:if>
	>숫자야구</option>
	<option value="A03"
	<c:if test="${bbsDTO.code=='A03' }">selected</c:if>
	>벽돌깨기</option>
	<option value="A10"
	<c:if test="${bbsDTO.code=='A10' }">selected</c:if>
	>기타</option>
	</select>
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
	<input type="text" name="subject" size="15" value="${bbsDTO.subject }" required="required">
	</td>
</tr>
<tr>
	<th>작성자</th>
	<td>${bbsDTO.nicname }</td> 
</tr>
<tr>
	<th>내용</th>
	<td>
	<textarea name="content" cols="50" rows="20">
	${bbsDTO.content }
	</textarea>
	</td>
</tr>
<tr>
	<th>파일</th>
	<td><input type="file" name="filenameMF"></td>
</tr>
<tr>
	<th>비밀번호</th>
	<td><input type="password" name="passwd" required="required"></td>
</tr>
	
</table>

<div style="text-align: center">

<input type="submit" value="수정">
<input type="button" value="목록" onclick="blist()">

</div>
</form>

</div>

</body>
</html>