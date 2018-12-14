<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<c:set var="root" value="${pageContext.request.contextPath }" />

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

th{
text-align: center; margin: 0 auto;
}

</style>
<script type="text/javascript">
function read(qano){
	var url = "read";
	url = url +"?qano=" + qano;
	url = url + "&col=${col}";
	url = url + "&word=${word}";
	url = url + "&nowPage=${nowPage}";	
	location.href = url;
}
function allist(){
	var url = "list";	
	location.href = url;
}
function qalist(){
	var url = "list";
	url = url +"?col=category";
	url = url + "&word=문의";
	location.href = url;
}
function salist(){
	var url = "list";
	url = url +"?col=category";
	url = url + "&word=신고";	
	location.href = url;
}
</script>

</head>
<body>
<BR>
<BR>

<div style="width:80%; text-align: center; margin: 0 auto;">

<h2 style="font-style: oblique;"> Q&A게시판</h2>

<h4>분류</h4>
<div>
<a href="javascript:allist()"><button>전체</button></a>
<a href="javascript:qalist()"><button>문의</button></a>
<a href="javascript:salist()"><button>신고</button></a>

</div>

<hr>
전체글수 : ${totalRecord }
<br>

 <div class="search">
	<form method="post" action="./list">
	<select name="col">
	<option value="category"
	<c:if test="${col=='category'}">selected</c:if>				
	>카테고리</option>
	<option value="nicname"
	<c:if test="${col=='nicname'}">selected</c:if>				
	>닉네임</option>
	<option value="subject"
	<c:if test="${col=='subject'}">selected</c:if>
	>제목</option>
	<option value="content"
	<c:if test="${col=='content'}">selected</c:if>
	>내용</option>
	<option value="total">전체출력</option>
	</select>
	<!-- 입력값 -->
	<input type="text" name="word" value="${word}">
	<input type="submit" value="검색">	
	<input type="button" onclick="location.href='create'" value="글쓰기" />		
	</form>
	</div>
<hr>
		
<table class="table" style="width:60%; margin: 0 auto;">
	<tr>
		<th>글번호</th>
		<th>카테고리</th>
		<th>제목</th>
		<th>닉네임</th>
		<th>날짜</th>
		<th>조회수</th>
	
	</tr>

    <c:choose>
		<c:when test="${empty list}">
		
		<tr>
			<td colspan="6" style="text-align:center">등록된 글이 없습니다.
		</td>
		</tr>		
		</c:when>
		
		<c:otherwise>
			<c:forEach var="qabbsDTO" items="${list }">			
		
			<tr>
				<td>${qabbsDTO.qano }</td>
				<td>[${qabbsDTO.category }]</td>
				<td style="text-align:left;" class="left">
				<c:choose>
				<c:when test ='${empty sessionScope.nicname }'>
				<c:set var="qrcount" value="${util:qrcount(qabbsDTO.qano, qreplyDAO) }"/>	
				<img src='${pageContext.request.contextPath }/images/locked.png'>
				${qabbsDTO.subject }				
				<c:if test="${qrcount>0 }">
            	<span style="color:black;">(${qrcount})</span>
            	</c:if>
				</c:when>
				<c:when test ='${sessionScope.grade == 1}'>
				<c:set var="qrcount" value="${util:qrcount(qabbsDTO.qano, qreplyDAO) }"/>	
				<a href="javascript:read('${qabbsDTO.qano }')">${qabbsDTO.subject }</a>
				<c:if test="${qrcount>0 }">
            	<span style="color:red;">(${qrcount})</span>
          		</c:if>				
				</c:when>
				<c:when test ='${sessionScope.nicname == qabbsDTO.nicname}'>
				<c:set var="qrcount" value="${util:qrcount(qabbsDTO.qano, qreplyDAO) }"/>	
				<a href="javascript:read('${qabbsDTO.qano }')">${qabbsDTO.subject }</a>
				<c:if test="${qrcount>0 }">
            	<span style="color:red;">(${qrcount})</span>
          		</c:if>		
				</c:when>
				<c:otherwise>
				<c:set var="qrcount" value="${util:qrcount(qabbsDTO.qano, qreplyDAO) }"/>	
				<img src='${pageContext.request.contextPath }/images/locked.png'>
				${qabbsDTO.subject }
				<c:if test="${qrcount>0 }">
            	<span style="color:black;">(${qrcount})</span>
          		</c:if>
          		</c:otherwise>
          		</c:choose>
     			</td>
				<td>${qabbsDTO.nicname}</td>
				<td>${qabbsDTO.qadate }</td>
				<td>${qabbsDTO.viewcount }</td>
			
			</tr>
		
		
			</c:forEach>

		</c:otherwise>

		</c:choose>
    
</table>

<p style="text-align:center;">${paging }</p>



</div>

<BR>
<BR>
</body>
</html>