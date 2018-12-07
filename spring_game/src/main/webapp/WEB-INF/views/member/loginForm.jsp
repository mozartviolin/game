<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>


</head>
<!-- *********************************************** -->
<body>

<BR><BR>

<div style="width:80%; margin: 0 auto;">
<h2 style="font-style: oblique; text-align: center">로그인  &nbsp;&nbsp;&nbsp;&nbsp; </h2>
<br><br>

	<FORM name='frm' method='POST' action='${root }/member/loginc'>
	
		<TABLE class="table" style="width:35%; margin: 0 auto;">
			<TR>
				<TH>아이디</TH>
				<TD><input type="text" size="25" name="id">
	  &nbsp;&nbsp;
	  <c:choose>
	  	<c:when test="${c_id_val=='Y' }">
	  	<input type='checkbox' size="25" name='c_id' value='Y' checked='checked'> ID 저장 
	  	</c:when>
	  	<c:otherwise>
	  	 <input type='checkbox' size="25" name='c_id' value='Y' > ID 저장 
	  	</c:otherwise>
	  </c:choose>
	  			
				</TD>
			</TR>
			<TR>
				<TH>비밀번호</TH>
				<TD>
				<input type="password" size="25" name="passwd">
				</TD>
				
			</TR>
		</TABLE>

		<div style="text-align: center;">
		<BR><BR>
			<input type='submit' value='로그인'> 
			<input type='button' value='회원가입' onclick="location.href='agree'">
			<input type='button' value='ID/Password 찾기' onclick="location.href='idpwfind'">
		 &nbsp;&nbsp;&nbsp;&nbsp;<br>
		 
		 <!-- 네이버아이디로로그인 버튼 노출 영역 -->
		 <div id="naverIdLogin"></div>
		 <!-- //네이버아이디로로그인 버튼 노출 영역 -->
		 
		 <!-- 네이버아디디로로그인 초기화 Script -->
			<script type="text/javascript">
				var naverLogin = new naver.LoginWithNaverId(
					{
						clientId: "JDzSdswkTtUR8xk3MIXo",
						callbackUrl: "http://localhost:8000/game/member/callback",
						isPopup: false, /* 팝업을 통한 연동처리 여부 */
						loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
					}
				);
				
				/* 설정정보를 초기화하고 연동을 준비 */
				naverLogin.init();
				
			</script>
		<!-- // 네이버아이디로로그인 초기화 Script -->
		 
		</div>
	
	<!-- 댓글 처리 -->
	<input type="hidden" name="flag" value="${param.flag }">
	<input type="hidden" name="nPage" value="${param.nPage }">
	<input type="hidden" name="bbsno" value="${param.bbsno }">
	<input type="hidden" name="breplyno" value="${param.breplyno }">
	<input type="hidden" name="col" value="${param.col }">
	<input type="hidden" name="word" value="${param.word }">
	<input type="hidden" name="nowPage" value="${param.nowPage }">
	
	</FORM>
</div>
<BR><BR><BR><BR>
</body>

</html>
