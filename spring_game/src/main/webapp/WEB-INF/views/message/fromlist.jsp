<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function read(mno) {
		var url = "read";
		url = url + "?mno=" + mno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url;
	}
</script>
</head>
<body>

<BR><BR>

<div style="width:80%; text-align: center; margin: 0 auto;">

<div style="width:80%; text-align:center" >
<h1>보낸쪽지함</h1>
 <form method="post" action="./list.do">
  <select name="col">
  	<option value="meto" 
  	<c:if test="${col=='meto'}">selected</c:if>
  	>받는이</option>
  	<option value="subject"
  	<c:if test="${col=='subject'}">selected</c:if>
  	>제목</option>
  	<option value="total">전체출력</option>
  </select>
  <input type="text" name="word" value="${word}">
  <button>검색</button>
  <button type="button" onclick="location.href='create'">쪽지 보내기</button>
  </form>
  <br>
<table width=500 border=2 bordercolor=red align=center>
		<tr>
			<th>수신일</th>
			<th>제목</th>
			<th>받는이</th>
			<th>보낸이</th>
			<th>수신확인</th>
		</tr>
		<c:choose>
		<c:when test="${empty list}"> 
<tbody>
	<tr>
		<td colspan="6">등록된 글이 없습니다.</td>
	</tr>
  </tbody>
  </c:when>
  <c:otherwise>
		<tbody>
		<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.mdate}</td>
			<td><a href="javascript:read('${dto.mno}')" class="link">${dto.subject}</a></td>
			<td>${dto.meto}</td>
			<td>${dto.nicname}</td>
			<td>
			<c:choose>
			<c:when test ="${dto.viewcnt>0}">
			<img src='../icon/open message.png' style = "width:25px; height:25px;">
			</c:when>
			<c:otherwise>
			<img src='../icon/close message.png' style = "width:25px; height:25px;">
			</c:otherwise>
			</c:choose>
			</td> 
		</tr>
		</c:forEach>
		</tbody>
		</c:otherwise>
		</c:choose>
	</table>
	${paging}
	</div>
	
</div>
<br>
<br>
</body>
<br>
</html>