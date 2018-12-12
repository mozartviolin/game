<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<BR>
<BR>

<h2>Q&A게시판 답변등록</h2>
 
<FORM name='frm' method='POST' action='./reply' onsubmit="return incheck(this)">
<!-- 답변있는 부모글의 삭제를 못하게 하기 위해서 -->
 <input type="hidden" name="qano" value="${qabbsDTO.qano}">
 
<!-- 답변에 필요한 부모자료들 -->
<input type="hidden" name="grpno" value="${qabbsDTO.grpno}">
<input type="hidden" name="indent" value="${qabbsDTO.indent}">
<input type="hidden" name="ansnum" value="${qabbsDTO.ansnum}">

<!-- 페이지 및 검색 유지를 위한 값 -->
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">

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
		<input type="radio" name="category" value="답변" /> 답변
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