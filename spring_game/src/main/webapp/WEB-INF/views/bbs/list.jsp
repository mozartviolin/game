<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function read(bbsno){
	url = "${root}/bbs/read";
	url = url + "?bbsno=" + bbsno;
	url = url + "&col=${col}";
	url = url + "&word=${word}";
	url = url + "&nowPage=${nowPage}";
	
	location.href = url;
}

function fileDown(filename){
	url = "${root}/download";
	url = url + "?filename=" + filename;
	url = url + "&dir=/bbs/storage";
	
	location.href = url;
}

</script>

</head>
<body>


<div style="width:80%; text-align: center;">
<div id="search">
<form action="./list" method="post">
	
	<select name="col">
		
		<option value="nicname"
		<c:if test="${col=='nicname' }">selected</c:if>
		>작성자</option>
		<option value="title"
		<c:if test="${col=='title' }">selected</c:if>
		>제목</option>
		<option value="total">전체</option>
	</select>
	<input type="text" name="word" value="${word }">
	
	<button>검색</button>
	<input type="button" value="글쓰기" onclick="location.href='create.do'">
	
</form>
</div>


<table style="width:60%; text-align: center;">
<thead>
	<tr>
		<th>글번호</th>
		<th>말머리</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>파일명</th>
		<th>작성일</th>
	</tr>
</thead>

<c:choose>
	<c:when test="${empty list }">
		<tbody>
			<tr>
				<td colspan="7">등록된 글이 없습니다.</td>
			</tr>
		</tbody>
	</c:when>
	<c:otherwise>
	
<c:forEach var="bbsDTO" items="${list }">

<tbody>
	<tr>
		<td>${bbsDTO.bbsno }</td>
		<td>${util:codeName(bbsDTO.code) }</td>
		<td>
		<c:set var="rcount" value="${util:rcount(bbsDTO.bbsno,breplyDAO) }"/>
		
		<a href="javascript:read('${bbsDTO.bbsno }')">${bbsDTO.subject }</a>
		
		<c:if test="${rcount>0 }">
			<span style="color:red;">(${rcount })</span>
		</c:if>
		
		<c:if test="${util:newImg(bbsDTO.bdate) }">
		<img src='${root }/images/new.png' style='width:20px; height:20px'>
		</c:if>
		</td>
		<td>${bbsDTO.nicname }</td>
		<td>${bbsDTO.viewcnt }</td>
		<td>
		<c:choose>
			<c:when test="${not empty bbsDTO.filename }">
			<a href="javascript:fileDown('${bbsDTO.filename}')">
			${bbsDTO.filename }		
			</a>
			</c:when>
			<c:otherwise>파일없음</c:otherwise>
		</c:choose>
		</td>
		<td>${bbsDTO.bdate }</td>
	</tr>	
</tbody>

</c:forEach>

</c:otherwise>
</c:choose>
	
</table>

${paging }

</div>

</body>
</html>