<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<style>
body {
	font-family: "Lato", sans-serif
}

.mySlides {
	display: none
}
</style>


</head>
<body>

<!-- 상단 메뉴 -->

	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-black w3-card">
			<a
				class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right"
				href="javascript:void(0)" onclick="myFunction()"
				title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a> 
				
			<a href="${root}" class="w3-bar-item w3-button w3-padding-large">홈</a> 
			<a href="${root}/bbs/list" class="w3-bar-item w3-button w3-padding-large w3-hide-small">자유게시판</a>
			<a href="#tour" class="w3-bar-item w3-button w3-padding-large w3-hide-small">TOUR</a>
			<a href="#contact" class="w3-bar-item w3-button w3-padding-large w3-hide-small">CONTACT</a>
			
			<div class="w3-dropdown-hover w3-hide-small">
				<button class="w3-padding-large w3-button" title="More">
					MORE <i class="fa fa-caret-down"></i>
				</button>
				<div class="w3-dropdown-content w3-bar-block w3-card-4">
				
				<c:choose>
			  	<c:when test="${empty id }">
			      <a class="w3-bar-item w3-button" href="${root}/member/agree">회원가입</a>
			      <a class="w3-bar-item w3-button" href="${root}/member/login">로그인</a>
			  	</c:when>
			  	<c:otherwise>
			  		<c:if test="${grade!='1' }">
				     <a class="w3-bar-item w3-button" href="${root}/member/read">나의 정보</a> 
				     <a class="w3-bar-item w3-button" href="${root}/member/delete">회원탈퇴</a>
			  		</c:if>
				     <a class="w3-bar-item w3-button" href="${root}/member/logout">로그아웃</a>
			  	</c:otherwise>
			  </c:choose> 
			  
			  <c:if test="${not empty id && grade=='1' }">
				   <a class="w3-bar-item w3-button" href="${root }/admin/list">회원목록</a>
			  </c:if>
				
				</div>
				
			</div>
			
		</div>
		
	</div>
	
	<!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
	<div id="navDemo"
		class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top"
		style="margin-top: 46px">
		<a href="${root}/bbs/list" class="w3-bar-item w3-button w3-padding-large"
			onclick="myFunction()">자유게시판</a> 
			
		<a href="${root}/omok/index" class="w3-bar-item w3-button w3-padding-large"
			onclick="myFunction()">오목게임</a> 
		
		<a href="#tour"	class="w3-bar-item w3-button w3-padding-large"
			onclick="myFunction()">TOUR</a>
			
		<a href="#contact" class="w3-bar-item w3-button w3-padding-large"
			onclick="myFunction()">CONTACT</a> 
		
		<a href="#"	class="w3-bar-item w3-button w3-padding-large" 
			onclick="myFunction()">MERCH</a>
	</div>

<!-- 상단 메뉴 끝 -->
<BR><BR>
 
 
<!-- 내용 시작 -->