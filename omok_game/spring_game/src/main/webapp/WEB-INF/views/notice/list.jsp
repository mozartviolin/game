<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>

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
	function read(n_no) {
		var url = "read";
		url = url + "?n_no=" + n_no;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url;
	}
</script>
<style type="text/css">
div{
text-align:center;
}
th{
text-align: center; margin: 0 auto;
}
</style>
</head>

<body>
<BR>
<BR>


<div style="width:80%;margin: 0 auto;">


	<div class="title">
		<h3>공지사항</h3>
		<h5>공지사항 게시판입니다.</h5>
	</div>
	
	<br>

	<div class="content" style="width:80%;margin: 0 auto;">
		<form method="post" action="./list">

			<select name="col">
				<option value="subject" <c:if test="${col=='subject'}"></c:if>>제목</option>
				<option value="total">전체출력</option>
			</select> <input type="text" name="word" value="${word}">
			<button>검색</button>
	<button type="button" onclick="location.href='create'">등록</button>
	</form>
	
	<BR>
	
		<table class="table" style="width:60%; margin: 0 auto;">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>등록날짜</th>
			</tr>
			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.n_no}</td>
						<td><a href="javascript:read('${dto.n_no}')">${dto.subject}</a>
						</td>
						<td>${dto.nicname}</td>
						<td>${dto.viewcnt}</td>
						<td>${dto.ndate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		${paging}
	</div>
	
</div>

<BR>
<BR>
</body>
</html>