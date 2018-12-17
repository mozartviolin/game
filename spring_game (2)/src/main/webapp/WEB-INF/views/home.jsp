<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${not empty sessionScope.id && sessionScope.grade == '0' }">
		<c:set var="str" value="${sessionScope.nicname }님 접속하였습니다."/>
	</c:when>
	<c:when test="${not empty sessionScope.id && sessionScope.grade == '1' }">
		<c:set var="str" value="관리자 페이지"/>
	</c:when>
</c:choose>

<html>
<head>

<title>Home</title>
</head>
<body>

<div style="width:80%; text-align: center; margin: 0 auto;">
<BR><BR>

<h3 style="font-style: oblique; text-align: center;"> ${str }</h3>


<c:if test="${not empty sessionScope.id && sessionScope.grade == '0' }">
<a href="${pageContext.request.contextPath }/member/read" class="btn btn-link">나의 정보</a> &nbsp;&nbsp;&nbsp;
<a href="${pageContext.request.contextPath }/message/list" class="btn btn-link">쪽지함</a>
<br>
<br>
	<c:choose>
	<c:when test="${not empty list }">
	<c:forEach  var="dto" items="${list }" varStatus="status">
	   접속자 _ ${dto.nicname } &nbsp;&nbsp;
	</c:forEach>
	</c:when>
	</c:choose>

</c:if>
</div>

<!-- Page content -->
	<div class="w3-content" style="max-width: 2000px; margin-top: 46px">

		<!-- Automatic Slideshow Images -->
		<div class="mySlides w3-display-container w3-center">
			<img src="${pageContext.request.contextPath }/images/black.jpg" style="width: 80%">
			<div
				class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
			</div>
		</div>
		<div class="mySlides w3-display-container w3-center">
			<img src="${pageContext.request.contextPath }/images/bomb.jpg" style="width: 60%">
			<div
				class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
			</div>
		</div>
		<div class="mySlides w3-display-container w3-center">
			<img src="${pageContext.request.contextPath }/images/block.jpg" style="width: 80%">
			<div
				class="w3-display-bottommiddle w3-container w3-text-white w3-padding-32 w3-hide-small">
			</div>
		</div>



<!-- The Band Section -->
		<div class="w3-container w3-content w3-center w3-padding-64"
			style="max-width: 800px" id="band">
			<h2 class="w3-wide">THE Game</h2>
			<p class="w3-opacity">
				<i>We love game</i>
			</p>
			
			<p class="w3-justify">
			함께 또는 혼자서 할 수 있는 게임을 모아놓은 사이트입니다. <br>
			둘이서 함께 오목을 즐겨보세요! 그리고 오목 외에 다른 게임을 하고 싶으면 혼자서 할 수 있는
			숫자 야구, 폭탄 해체, 벽돌깨기를 할 수 있습니다. <br>
			자유 게시판을 이용하여 본인의 게임 내역을 올리거나 하고 싶은 말을 자유롭게 올릴 수 있으며
			파일을 업로드하여 주고 받을 수 있습니다.<br>
		   	문의 내역이 있다면 1:1 게시판을 이용하여 주세요.
			</p>
			
		</div>


		<!-- End Page Content -->
	</div>


</body>
</html>