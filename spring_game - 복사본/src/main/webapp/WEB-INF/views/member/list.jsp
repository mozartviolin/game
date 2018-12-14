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

<script type="text/javascript">

function read(id){
	var url = "${root}/member/read";
	url = url + "?id=" + id;
	url = url + "&col=${col}";
	url = url + "&word=${word}";
	url = url + "&nowPage=${nowPage}";
	
	location.href = url;
}

</script>

</head>
<body>
<br><BR>

<div style="width:80%; text-align: center; margin: 0 auto;">

<h2 style="font-style: oblique;"> 회원 목록</h2>
<br>
  
  <div>
  	<form method="post" action="./list">
  		<select name="col">
  			<option value="id"
  			<c:if test="${col=='id' }">selected</c:if>
  			>아이디</option>
  			<option value="nicname"
  			<c:if test="${col=='nicname' }">selected</c:if>
  			>닉네임</option>
  			<option value="total">전체</option>
  		</select>
  		<input type="text" name="word" value="${word }">
  		<button>검색</button>
  	</form>
  </div>            

<BR>  

<c:forEach var="memberDTO" items="${list }">

<table class="table" style="width:60%; margin: 0 auto;">
    <TR>
      <TH style="width: 20%">아이디</TH>
      <TD style="width: 55%">
      <a href="javascript:read('${memberDTO.id}')">${memberDTO.id}</a>
      </TD>
    </TR>
    <tr>
    	<th>닉네임</th>
    	<td>${memberDTO.nicname}</td>
    </tr>
    <tr>
    	<th>성명</th>
    	<td>${memberDTO.mname}</td>
    </tr>
    <tr>
    	<th>게임횟수</th>
    	<td>${memberDTO.playnum}</td>
    </tr>
    <tr>
    	<th>이긴횟수</th>
    	<td>${memberDTO.win}</td>
    </tr>
    <tr>
    	<th>등급</th>
    	<td>${memberDTO.grade}</td>
    </tr>
    <tr>
    	<th>가입일자</th>
    	<td>${memberDTO.mdate}</td>
    </tr>
  </TABLE>
 
<BR><BR>  
</c:forEach>
  
   ${paging }

 </div>
<BR><BR>

</body>
</html>