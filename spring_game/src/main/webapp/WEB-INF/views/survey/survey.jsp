<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<div>
			<h1 class="text-center">게임 만족도 설문조사</h1>
			<p class="text-center">
				게임만족도에 관한 간단한 설문조사입니다.<br>답변해주시면 감사하겠읍니다.
			</p>
			
		</div>
		
		<section>
			
	<FORM name='frm' method='POST' action='./updatepoll' onsubmit="return incheck(this)">
				
				<h5>오목
				</h5>
				<h6>만족도</h6>
				
						<label><input type="radio" name="choise"
					value="1">불만족</label><br>
						
						<label><input type="radio" name="choise"
					value="2">보통</label><br>
						
						<label><input type="radio" name="choise"
					value="3">만족</label><br>
												
<br>
			
				<input type="submit" value="제출하기">
				<br>
				<input type="hidden" name="sno" value="1">
	</FORM>
		
		</section>
				
</div>

</body>
</html>