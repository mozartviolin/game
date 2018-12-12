<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<div style="width:80%; text-align: center; margin: 0 auto;">
<h2 style="font-style: oblique;"> 만족도 설문조사</h2>
<br>
		<div>
			<p> 사이트 만족도에 관한 간단한 설문조사입니다.	</p>
			
		</div>
		
		<section>
			
				
		<h5>1. 게임 만족도</h5>
		
	<br>							
		<FORM name='frm' method='POST' action='./updatepoll' onsubmit="return incheck(this)">
				<label><input type="radio" name="choise"
			value="1" required="required">불만족</label><br>
				
				<label><input type="radio" name="choise"
			value="2">보통</label><br>
				
				<label><input type="radio" name="choise"
			value="3">만족</label><br>
	<br>
			
			<input type="submit" value="제출하기">
			<input type="button" value="결과보기"
			onclick="location.href='${pageContext.request.contextPath }/survey/result'">
			<br>
			<input type="hidden" name="sno" value="1">
			
		</FORM>
		
		<br>
		
		<h5>2. 게임을 다시 할 의향이 있습니까?</h5>
		
	<br>							
		<FORM name='frm2' method='POST' action='./updatepoll2' onsubmit="return incheck(this)">
				<label><input type="radio" name="choise"
			value="1" required="required">다시 안 하고싶다</label><br>
				
				<label><input type="radio" name="choise"
			value="2">생각해 보겠다</label><br>
				
				<label><input type="radio" name="choise"
			value="3">다시 해보고싶다</label><br>
	<br>		
			<input type="submit" value="제출하기">		
			<input type="button" value="결과보기"
			onclick="location.href='${pageContext.request.contextPath }/survey/result2'">		
			<br>
			<input type="hidden" name="sno" value="2">
		</FORM>
	
	
		
		</section>
				
</div>

</body>
</html>