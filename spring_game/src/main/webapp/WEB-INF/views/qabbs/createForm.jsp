<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- ckeditor -->
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');
  };
 </script>
</head>
<body>
<BR>
<BR>
<h2> Q&A게시판 등록</h2>
 
<FORM name='frm' method='POST' action='./create' onsubmit="return incheck(this)">
  <TABLE>
    <TR>
      <TH>닉네임</TH>
      <TD>     
		<c:choose>
		<c:when test="${not empty sessionScope.nicname }">
		<input type="hidden" name="wname" size="20" value="${sessionScope.nicname }">
		${sessionScope.nicname }
		</c:when>
		<c:otherwise>
		  <input type="text" name="wname" size="20" placeholder="닉네임을 입력하세요">
		</c:otherwise>
	  </c:choose>
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

<BR>
<BR>
</body>
</html>