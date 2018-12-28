<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
.rlist{
line-height : 1.2em;
font-size : 15px;
font-weight : bold;
text-align: center;
border : 1px solid #AAAAAA;
width : 55%;
padding : 10px;
margin : 20px auto;
}
.rcreate{
font-size : 18px;
font-weight:bold;
text-align: left;
border : 1px solid #AAAAAA;
width : 55%;
padding : 10px;
margin : 20px auto;
}
</style>
<script type="text/javascript">
function ncreate(){
	var url = "create";
	
	location.href=url;
}

function nupdate(){
	var url = "update";
	url +="?col=${param.col}";
	url +="&word=${param.word}";
	url +="&nowPage=${param.nowPage}";
	url +="&n_no=${param.n_no}";
	url +="&oldfile=${dto.filename}";
	
	location.href = url;
}

function ndelete(){
	var url = "delete";
	url +="?col=${param.col}";
	url +="&word=${param.word}";
	url +="&nowPage=${param.nowPage}";
	url +="&n_no=${param.n_no}";
	url +="&oldfile=${dto.filename}";
	
	location.href = url;
}

function nlist(){
	var url = "list";
	url +="?col=${param.col}";
	url +="&word=${param.word}";
	url +="&nowPage=${param.nowPage}";
	
	location.href = url;
}

function fileDown(){
	var url = "${pageContext.request.contextPath}/download";
	
	url += "?filename=${dto.filename}";
	url += "&dir=/notice/storage";
	
	location.href = url;
}

//-------------------------------------------
// function input(f){
// 	if('${sessionScope.nicname}'==''){
// 		if(confirm("로그인이 필요합니다.")){
// 			var url="../member/login";
// 			url += "?n_no=${dto.n_no}";
// 			url += "&nPage=${nPage}";
// 			url += "&col=${param.col}";
// 			url += "&word=${param.word}";
// 			url += "&nowPage=${param.nowPage}";
// 			url += "&flag=../notice/read";
// 			location.href=url;
			
// 			return false;
// 		}else{
// 			return false;
// 		}
// 	}else if(f.content.value==''){
// 		alert("댓글 내용을 입력하세요");
// 		f.content.focus();
// 		return false;
// 	}
// }

function rupdate(nreplyno,content){
	var f = document.rform;
	f.content.value=content;
	f.nreplyno.value=nreplyno;
	f.rbutton.value='수정';
	f.action="./rupdate";
	
}

function rdelete(nreplyno){
	if (confirm("정말 삭제하겠습니까?")){
		var url = "./rdelete";
		url += "?nreplyno="+nreplyno;
		url += "&n_no=${dto.n_no}";
		url += "&nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nPage=${nPage}";
		
		location.href=url;
	}
}

</script>
</head>
<body>

<BR><BR>

<div style="width:80%; text-align: center; margin: 0 auto;">

<div class= title style="text-align:center;"><h3>공지사항 조회</h3></div>
<br>
<div class="content" style="text-align:center;">
<table class="table" style="width:40%; margin: 0 auto;">
<tr style="rows:2;">
<th>제목</th>
<td>${dto.subject}</td>
<tr>
<th>조회수</th>
<td>${dto.viewcnt}</td>
</tr>
<tr>
<th>날짜</th>
<td>${dto.ndate}</td>
</tr>
<tr>
<th>내용</th>
<td>${dto.content}</td>
</tr>
 <tr>
        <th>파일</th>
        <td>
        
        <c:choose>
         <c:when test="${empty dto.filename }">파일없음</c:when>
         <c:otherwise>
          <a href="javascript:fileDown()">${dto.filename}(${dto.filesize})</a>           
         </c:otherwise>
        </c:choose>  
        
        </td>
      </tr>
      <tr>
</table>
</div>
<div class="bottom" style= "text-align:center;">
<input type="button" value = "등록" onclick="ncreate()">
<input type="button" value = "수정" onclick="nupdate()">
<input type="button" value = "삭제" onclick="ndelete()">
<input type="button" value = "목록" onclick="nlist()">
</div>

<hr>
<c:forEach var="rdto" items="${rlist}">
  
<div class=rlist style=text-align:center;>
	${rdto.nicname }<br>
<p>${rdto.content }</p>
${rdto.nreplydate }
<c:if test="${sessionScope.nicname==rdto.nicname }">
<span style="float:right">
<a href="javascript:rupdate('${rdto.nreplyno }','${rdto.content }')">수정</a>
<a href="javascript:rdelete('${rdto.nreplyno }')">삭제</a>
</span>
</c:if>
</div>
  
</c:forEach>
<div style="text-align:center">${paging}</div>
  
<div class=rcreate style=text-align:center;>
<form name="rform" action="./rcreate" method="POST" onsubmit="return input(this)">
<textarea rows="3" cols="34" name="content"></textarea>
<input type="submit" name="rbutton" value="등록">
<input type="hidden" name="nicname" value="${sessionScope.nicname}">
<input type="hidden" name="n_no" value="${dto.n_no }">
<input type="hidden" name="nPage" value="${nPage}">
<input type="hidden" name="nowPage" value="${param.nowPage }">
<input type="hidden" name="col" value="${param.col }">
<input type="hidden" name="word" value="${param.word }">
<input type="hidden" name="nreplyno" value="${0}">
</form>
  </div>

</div>
 <br>
 <br>
</body>
</html>