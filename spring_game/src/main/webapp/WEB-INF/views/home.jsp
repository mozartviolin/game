<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>

<c:set var="title" value="엥.."/>
<c:if test="${not empty sessionScope.id && sessionScope.grade == '1' }">
<c:set var="title" value="관리자 페이지"/>
</c:if>

<c:choose>
	<c:when test="${empty sessionScope.id }">
		<c:set var="str" value="기본 페이지입니다."/>
	</c:when>
	<c:otherwise>
		<c:set var="str" value="안녕하세요 ${sessionScope.id }님 "/>		
	</c:otherwise>
</c:choose>

<html>
<head>
	<title>Home</title>
</head>
<body>


	<div class="container">
<P>  The time on the server is ${serverTime}. </P>

	<h2>${title}</h2>

		<h1>${str}</h1>

		<img src="${pageContext.request.contextPath }/images/main1.jpg" width="30%"><br>

		<c:choose>
			<c:when test="${empty sessionScope.id }">
			<button onclick="location.href='member/login'">로그인</button>
			</c:when>
			<c:otherwise>
			<button onclick="location.href='member/logout'">로그아웃</button>
			</c:otherwise>
		</c:choose>

	</div>
	
</body>
</html>
