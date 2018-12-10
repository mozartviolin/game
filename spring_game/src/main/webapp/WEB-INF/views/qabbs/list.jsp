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

<h2> Q&A게시판 </h2>

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
	</form>
	</div>
<hr>

		
<table>
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
				<td class="left">
				<c:choose>
				<c:when test ='${empty sessionScope.nicname }'>
				<c:set var="rcount" value="${util:rcount(qabbsDTO.qano, qreplyDAO) }"/>	
				${qabbsDTO.subject }
				<c:if test="${rcount>0 }">
            	<span style="color:red;">(${rcount})</span>
            	</c:if>
				</c:when>
				<c:otherwise>
				<c:set var="rcount" value="${util:rcount(qabbsDTO.qano, qreplyDAO) }"/>	
				<a href="javascript:read('${qabbsDTO.qano }')">${qabbsDTO.subject }</a>
				<c:if test="${rcount>0 }">
            	<span style="color:red;">(${rcount})</span>
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

<button onclick="location.href='create'"> 글쓰기 </button>

<BR>
<BR>
</body>
</html>