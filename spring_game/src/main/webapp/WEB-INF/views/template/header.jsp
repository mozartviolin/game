<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="sc" class="spring.sts.game.SessionChecker" scope="application" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Game</title>

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

<SCRIPT LANGUAGE="javaScript"> 
function CenterWin(url,winname,features) 
{ 

features = features.toLowerCase(); 
len = features.length; 
sumchar= ""; 
for (i=1; i <= len; i++) // 빈칸 제거 
{ 
onechar = features.substr(i-1, 1); 
if (onechar != " ") sumchar += onechar; 
} 

features = sumchar; 
sp = new Array(); 
sp = features.split(',', 10); // 배열에 옵션을 분리해서 입력 
splen = sp.length; // 배열 갯수 
for (i=0; i < splen; i++) // width, height 값을 구하기 위한 부분 
{ 
if (sp[i].indexOf("width=") == 0) // width 값일때 
{ 
width = Number(sp[i].substring(6)); 
} else if (sp[i].indexOf("height=") == 0) // height 값일때 
{ 
height = Number(sp[i].substring(7)); 
} 
} 
sleft = (screen.width - width) / 2; 
stop = (screen.height - height) / 2; 
features = features + ",left=" + sleft + ",top=" + stop; 
popwin = window.open(url,winname,features); 
} 
//
</SCRIPT> 


</head>
<body>

<!-- 창 닫을때 로그아웃 처리 시작 -->
<script language="javascript"> 

</script> 

<!-- 창 닫을때 로그아웃처리 끝 -->


<!-- 상단 메뉴 -->

	<!-- Navbar -->
	<div class="w3-top">
		<div class="w3-bar w3-black w3-card">
			<a
				class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right"
				href="javascript:void(0)" onclick="myFunction()"
				title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a> 
				
			<a href="${root}" class="w3-bar-item w3-button w3-padding-large">홈</a> 		
			<a href="${root}/notice/list" class="w3-bar-item w3-button w3-padding-large w3-hide-small">공지사항</a>
			<div class="w3-dropdown-hover">
		    
		    <button class="w3-button w3-padding-large">게임<i class="fa fa-caret-down"></i></button>
			    <div class="w3-dropdown-content w3-bar-block w3-card-4">
			      <a href="${root}/ticTacToe/omok_index" class="w3-bar-item w3-button">오목게임</a>
			      <a href="${root}/mini_game/baseball" class="w3-bar-item w3-button">숫자야구</a>
			      <a href="${root}/mini_game/brick" class="w3-bar-item w3-button">블록깨기</a>
			      <a href="${root}/mini_game/rgbbomb" class="w3-bar-item w3-button">폭탄 해체</a>
			      <a href="javascript:CenterWin('${root}/mini_game/dung',''
			      ,'width=380, height=460')" class="w3-bar-item w3-button">
			      똥피하기</a>
			    </div>
		  	</div>			
<%-- 		<a href="${root}/ticTacToe/omok_index" class="w3-bar-item w3-button w3-padding-large w3-hide-small">오목게임</a>
			<a href="${root}/mini_game/baseball" class="w3-bar-item w3-button w3-padding-large w3-hide-small">숫자야구</a>
			<a href="${root}/mini_game/brick" class="w3-bar-item w3-button w3-padding-large w3-hide-small">블록깨기</a>
			<a href="${root}/mini_game/rgbbomb" class="w3-bar-item w3-button w3-padding-large w3-hide-small">폭탄 해체</a>
			<a href="${root}/mini_game/dung" class="w3-bar-item w3-button w3-padding-large w3-hide-small">똥피하기</a> --%>
			<a href="${root}/bbs/list" class="w3-bar-item w3-button w3-padding-large w3-hide-small">자유게시판</a>
			<a href="${root}/qabbs/list" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Q&A게시판</a>
			<a href="#contact" class="w3-bar-item w3-button w3-padding-large w3-hide-small">CONTACT</a>
			<a href="${root}/survey/survey" class="w3-bar-item w3-button w3-padding-large w3-hide-small">설문조사</a>
			
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
				     <a class="w3-bar-item w3-button" href="${root}/message/list">받은 쪽지함</a> 
				     <a class="w3-bar-item w3-button" href="${root}/message/fromlist">보낸 쪽지함</a> 
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
			<%
    	session.setMaxInactiveInterval(120); // 걍 결과가 빨리 보고싶어서여.. 120초
    	sc.setSession(session);
	 	out.println("<p>&nbsp;&nbsp;온라인&nbsp; : &nbsp;" + sc.getNowUser() + "<p>");
		%> 
		</div>
		
		
	</div>
	
	<!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
	<div id="navDemo"
		class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top"
		style="margin-top: 46px">
		<a href="${root}/notice/list" class="w3-bar-item w3-button w3-padding-large"
			>공지사항</a> 
		<a href="${root}/bbs/list" class="w3-bar-item w3-button w3-padding-large"
			>자유게시판</a> 
		<a href="${root}/qabbs/list" class="w3-bar-item w3-button w3-padding-large"
			>Q&A게시판</a> 
		<a href="${root}/survey/survey" class="w3-bar-item w3-button w3-padding-large"
			>설문조사</a> 
		
			<c:choose>
			  	<c:when test="${empty id }">
			      <a class="w3-bar-item w3-button" href="${root}/member/agree">회원가입</a>
			      <a class="w3-bar-item w3-button" href="${root}/member/login">로그인</a>
			  	</c:when>
			  	<c:otherwise>
			  		<c:if test="${grade!='1' }">
				     <a class="w3-bar-item w3-button" href="${root}/message/list">받은 쪽지함</a> 
				     <a class="w3-bar-item w3-button" href="${root}/message/fromlist">보낸 쪽지함</a> 
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

<!-- 상단 메뉴 끝 -->
<BR><BR>
 
 
<!-- 내용 시작 -->