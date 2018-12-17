<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<div class='title' style='width:80%; text-align:center'>

  <h2>회원 목록</h2>
  
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
  
  <div class="container">

<c:forEach var="memberDTO" items="${list }">

  <TABLE class="table table-hover">
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
  
</c:forEach>
  
   ${paging }


 </div>

</div>

</body>
</html>