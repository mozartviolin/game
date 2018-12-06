<%@ include file="/ssi/ssi.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</script>

</head>
<body>
<h2> 1:1 문의게시판 </h2>
<hr>
전체: ${totalRecord }
<br>
<h5>분류</h5>

<table>
	<tr>
		<td>전체</td><td>신고</td><td>문의</td>
	</tr>
</table>

 <div class="search">
	<form action="./list">
	<select name="col">
	<option value="nicname"
	<c:if test="${col=='nicname'}">selected</c:if>				
	>성명</option>
	<option value="category"
	<c:if test="${col=='category'}">selected</c:if>				
	>카테고리</option>
	<option value="subject"
	<c:if test="${col=='subject'}">selected</c:if>
	>제목</option>
	<option value="content"
	<c:if test="${col=='content'}">selected</c:if>
	>내용</option>
	<option value="total">전체출력</option>
	</select>
	<!-- 입력값 -->
	<input type="text" name="word" value='${word}'>
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
				<c:forEach begin="1" end="${qabbsDTO.indent }">&nbsp;&nbsp;</c:forEach>
				<c:if test="${qabbsDTO.indent>0 }"><img src='../images/re.jpg'></c:if>
			
							
				<a href="javascript:read('${qabbsDTO.qano }')">${qabbsDTO.subject }</a>
			       
				<c:if test="${util:newImg(dto.qadate) }"><img src='../images/new.gif'></c:if>
					
     			</td>
				<td>${qabbsDTO.nicname }</td>
				<td>${qabbsDTO.qadate }</td>
				<td>${qabbsDTO.viewcount }</td>
			
			</tr>
		
		
		</c:forEach>

		</c:otherwise>

		</c:choose>
    
</table>

<p style="text-align:center;">${paging }</p>
</body>
</html>