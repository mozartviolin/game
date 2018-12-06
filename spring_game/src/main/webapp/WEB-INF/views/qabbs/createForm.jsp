<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>등록</h2>
 
<FORM name='frm' method='POST' action='./create' onsubmit="return incheck(this)">
  <TABLE>
    <TR>
      <TH>닉네임</TH>
      <TD>     
		<input type="text" name="nicname" size="20" placeholder="이름을 입력하세요">
	</TR>
    <TR>
      <TH>카테고리</TH>
      <TD>     
		<input type="radio" name="category" value="문의" checked="checked" /> 문의
		<input type="radio" name="category" value="신고" /> 신고
	</TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" size="90"  name="subject"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD>
      <textarea rows="10" cols="45" name="content"></textarea>
      </TD>
    </TR>
       <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
        
  </TABLE>
   
  <DIV class='bottom'>
    <input type='submit' value='게시글 등록'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
</body>
</html>