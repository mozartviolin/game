<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=utf-8" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/prototype.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/dung.js"></script>
		<script type="text/javascript">
			Event.observe(window, "load", function() {
				new DungGame("screen", 15, "score");
			});
		</script>
		<link rel="stylesheet" media="screen" type="text/css" 
			href="${pageContext.request.contextPath }/js/dung.css" />
	
	<title>똥피하기</title>		
	
	</head>
	<body>
	
		<a href="#" id="screen" onclick="return false;"></a>
		<input type="text" id="score" value="0" readonly="true" size="5">
				
	</body>
</html>