
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<c:set var="root" value="${pageContext.request.contextPath }" />

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

//댓글
function input(f){
	if('${sessionScope.id}'==''){
		if(confirm("로그인이 필요합니다. ")){
			var url = "../member/login";
			url += "?qano=${qabbsDTO.qano}";
			url += "&nPage=${nPage}";
			url += "&col=${param.col}";
			url += "&word=${param.word}";
			url += "&nowPage=${param.nowPage}";
			url += "&flag=../qabbs/read";
			location.href = url;			
			return false;
		}else{
			return false;			
		}
		
	}else if(f.content.value==''){
		alert("댓글 내용을 입력하세요!");
		f.content.focus();
		return false;
	}
	
}

// 댓글 수정
function rupdate(rnum,content){
	var f = document.rform;
	f.content.value=content;
	f.rnum.value = rnum;
	f.rbutton.value='수정';
	f.action = "./rupdate"
}
//댓글 삭제
function rdelete(rnum){
	if(confirm("정말 삭제하시겠습니까? ")){
		var url = "./rdelete";
		url += "?rnum="+ rnum;
		url += "&qano=${qabbsDTO.qano}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		url += "&nPage=${nPage}";
		location.href = url;
	}
}

</script>

</head>
<body>
<BR>
<BR>

<div style="width:80%; text-align: center; margin: 0 auto;">
<h2 style="font-style: oblique;"> 게시글 읽기</h2>
<br>

<table class="table" style="width:40%; margin: 0 auto;">
	<tr>
		<th>글번호</th>
		<td>${qabbsDTO.qano}</td>
	</tr>
	<tr>
		<th>글쓴이</th>
		<td>${qabbsDTO.nicname}</td>
	</tr>
	 <tr>
      <th>등록일</th>
      <td>${qabbsDTO.qadate }</td>
    <tr>
	
	<tr>
		<th>제목</th>
		<td>${qabbsDTO.subject}</td>
	</tr>	
	<tr>
		<th>내용</th>
		<td height="400" valign="top">${content}</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${qabbsDTO.viewcount }</td>
	</tr>
	
</table>

	<c:choose>
    	<c:when test="${sessionScope.nicname == qabbsDTO.nicname }">
	    	<input type="submit" name="button" value="목록" onclick="blist()">	
		    <input type="button" name="button" value="수정" onclick="mupdate()">	
		    <input type="button" name="button" value="삭제" onclick="mdelete()">	
    	</c:when>
    	<c:otherwise>
		    <input type="submit" name="button" value="목록" onclick="blist()">	
    	</c:otherwise>
    </c:choose>	

<!-- <button onclick="mreply()">답변하기</button> -->
  
</div>

<hr>

<div class="rlist" style="width:40%; text-align: right; margin: 0 auto;">
<h4 style="font-style: oblique;"> 댓글</h4>  
 
   <!-- 댓글들 -->
 <c:forEach var="qreplyDTO" items="${qrlist }">
  <div style="border:1px solid gold;">
  	<p>작성자 : ${qreplyDTO.nicname }  &nbsp;|| &nbsp;  작성일 : ${qreplyDTO.regdate}</p>
  	 
  	<p> ${qreplyDTO.content }</p>
  	<c:if test="${sessionScope.nicname==qreplyDTO.nicname }">
    </c:if>  
    
    <c:if test="${sessionScope.nicname==qreplyDTO.nicname }">
	<span style="float:center;">
		<a href="javascript:rupdate('${qreplyDTO.rnum}','${qreplyDTO.content}')">수정</a>
		<a href="javascript:rdelete('${qreplyDTO.rnum}')">삭제</a>
	</span>
	</c:if>	
  </div>
 </c:forEach>
</div>
 
 <!-- 댓글 페이징 -->
 <div style="text-align: center;">${paging }</div>

 <hr>  
   
 <!-- 댓글 입력 -->
 <div class="rcreate" style="text-align: center; margin: 0 auto;">
 	<h5>댓글 쓰기</h5>
 	<form name="rform" action="./rcreate" method="post" onsubmit="return input(this)">
 	<input type="hidden" name="nicname" value="${sessionScope.nicname }">
 	<input type="hidden" name="qano" value="${qabbsDTO.qano }">
 	<input type="hidden" name="nPage" value="${nPage }">
 	<input type="hidden" name="nowPage" value="${param.nowPage }">
 	<input type="hidden" name="col" value="${param.col}">
 	<input type="hidden" name="word" value="${param.word }">
 	<input type="hidden" name="rnum" value="${0 }">
 	<textarea rows="3" cols="50" name="content"></textarea>
 	<input type="submit" name="rbutton" value="등록">
 	</form>
 	
 <!-- /div rcreate -->
 </div>
 

<BR>
<BR>
</body>
</html>