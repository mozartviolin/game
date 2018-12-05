<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function blist(){
	var url = "list";
	url = url + "?col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	
	location.href = url;
}

function bupdate(){
	var url = "update";
	url = url + "?bbsno=${bbsDTO.bbsno}";
	url = url + "&col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	url = url + "&oldfile=${bbsDTO.filename}";
	
	location.href = url;
}

function bdelete(){
	var url = "delete";
	url = url + "?bbsno=${bbsDTO.bbsno}";
	url = url + "&col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	url = url + "&oldfile=${bbsDTO.filename}";
	
	location.href = url;
}

function fileDown(){
	var url = "${root}/download";
	url = url + "?filename=${bbsDTO.filename}";
	url = url + "&dir=/bbs/storage";
	
	location.href = url;
}

function input(f){
	if('${sessionScope.nicname}'==''){
		if(confirm("로그인을 해주세요.")){
			var url = "../member/login";
			url = url + "?bbsno=${bbsDTO.bbsno}";
			url = url + "&nPage=${nPage}";
			url = url + "&col=${param.col}";
			url = url + "&word=${param.word}";
			url = url + "&nowPage=${param.nowPage}";
			url = url + "&flag=../bbs/read";
			
			location.href = url;
			return false;
		}else{
			return false;
		}
	}else if(f.content.value==''){
		alert("댓글을 입력하세요.");
		f.content.focus();
		return false;
	}
}

function rupdate(breplyno,content){
	var f = document.rform;
	f.content.value = content;
	f.breplyno.value = breplyno;
	f.rbutton.value='수정';
	f.action = "./rupdate";
}

function rdelete(breplyno){
	if(confirm("정말 삭제하시겠습니까?")){
		var url = "./rdelete";
		url = url + "?breplyno=" + breplyno;
		url = url + "&bbsno=${bbsDTO.bbsno}";
		url = url + "&nowPage=${param.nowPage}";
		url = url + "&col=${param.col}";
		url = url + "&word=${param.word}";
		url = url + "&nPage=${nPage}";
		
		location.href = url;
	}
}

</script>

</head>
<body>


<div style="width:80%; text-align: center;">
    <table style="width:60%; text-align: center;">

        <tr>
            <th>말머리</th>
            <td>
              ${util:codeName(bbsDTO.code) } 
            </td>
        </tr>
        <tr>
            <th>글번호</th>
            <td>${bbsDTO.bbsno }</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${bbsDTO.viewcnt }</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${bbsDTO.subject }</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${bbsDTO.nicname }</td>
        </tr>
        <tr>
            <td colspan="2">${content }</td>
        </tr>
        <tr>
            <th>등록일</th>
            <td>${bbsDTO.bdate }</td>
        </tr>
          <tr>
            <th>파일</th>
            <td>
            <c:choose>
            	<c:when test="${not empty bbsDTO.filename }">
            	<a href="javascript:fileDown('${bbsDTO.filename }')">${bbsDTO.filename }</a>
            	</c:when>
            	<c:otherwise>파일없음</c:otherwise>
            </c:choose>
            </td>
        </tr>

    </table>
    	
    	
    <input type="submit" name="button" value="목록" onclick="blist()">	
    <input type="button" name="button" value="수정" onclick="bupdate()">	
    <input type="button" name="button" value="삭제" onclick="bdelete()">	
</div>

<hr>

<c:forEach var="breplyDTO" items="${rlist }">
	
	<div class="rlist" style="text-align: center;">
	${breplyDTO.nicname }<br>
	<p>${breplyDTO.content }</p>
	${breplyDTO.breplydate }
	
	<c:if test="${sessionScope.nicname==breplyDTO.nicname }">
	<span style="float:right;">
		<a href="javascript:rupdate('${breplyDTO.breplyno }','${breplyDTO.content }')">수정</a>
		<a href="javascript:rdelete('${breplyDTO.breplyno }')">삭제</a>
	</span>
	</c:if>
	</div>

</c:forEach>

<div style="text-align: center">${paging }</div>

<br><BR>
    <div class="rcreate" style="text-align: center;">
    	<form name="rform" action="./rcreate" method="post" onsubmit="return input(this)">
    	
    	<input type="hidden" name="nicname" value="${sessionScope.nicname }">
    	<input type="hidden" name="bbsno" value="${bbsDTO.bbsno}">
    	<input type="hidden" name="nPage" value="${nPage }">
    	<input type="hidden" name="col" value="${param.col }">
    	<input type="hidden" name="word" value="${param.word }">
    	<input type="hidden" name="nowPage" value="${param.nowPage }">
    	<input type="hidden" name="breplyno" value="${0 }">
    	
    	<textarea cols="20" rows="5" name="content"></textarea>
    		
   	    <input type="submit" name="rbutton" value="등록">
   	    </form>
    </div>
    	<br>
</body>
</html>