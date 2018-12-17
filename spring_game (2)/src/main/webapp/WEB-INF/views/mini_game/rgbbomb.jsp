<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>

</head>
<body>

<BR><BR>

<div style="width:80%; text-align: center; margin: 0 auto;">

<div>
	 <p>RED, GREEN, BLUE에서 자르고 싶은 선을 세 개 고르시오. </p>
	 <p>한 색을 2번은 쓸 수 있지만 연속해서 3번은 고를 수 없습니다.</p>

	 <!-- ──────────────── 입력 부분 ──────────────── --> 
	 <form >
		 <input type="text" class="text" id="selectColor[0]"/>
		 <input type="text" class="text" id="selectColor[1]"/>
		 <input type="text" class="text" id="selectColor[2]"/>
	 </form>

	 <button onclick="gameStart(); deleteText()">게임 시작</button>
	 <button onclick="bullsAndCows()"> 결과 보기 </button>
	 <button onclick="AnswerAndBomb()">정답 보기</button>
	
	 <p id="check_Correct"></p>
</div>

<table style="width: 1200px" border="1">
	 <thead><tr><th colspan="3"> SCORE </th></tr></thead>

	 <!-- ──────────────── 출력 부분 ──────────────── --> 
	 <tbody id="tbodyArea">
		 <tr><td style="width: 325px;"> 1회 </td><td style="width: 400px;" id=guess1></td>
		 									<td style="width: 325px;" id=answer1></td></tr>
		 <tr><td> 2회 </td>	<td id=guess2></td>	<td id=answer2></td></tr>
		 <tr><td> 3회 </td>	<td id=guess3></td>	<td id=answer3></td></tr>
		 <tr><td> 4회 </td>	<td id=guess4></td>	<td id=answer4></td></tr>
		 <tr><td> 5회 </td>	<td id=guess5></td>	<td id=answer5></td></tr>
 		 <tr><td> 정답/폭탄</td>	<td id=answer>
 							 <td id=bomb></td></tr>
	 </tbody>

</table>
<br><br>
<!-- 남은 덱 -->
<table style="width:400px" border="1">
<thead><tr><th colspan="5"> 남은 덱 </th></tr></thead>
	 <tbody id="tbodyArea">

<tr id="RED">
	<td style="width: 130px;" class="RED1">RED</td>
	<td style="width: 130px;" class="RED2">RED</td>
	<td style="width: 130px;" class="RED3">RED</td>
	<td style="width: 130px;" class="RED4">RED</td>
	<td style="width: 130px;" class="RED5">RED</td></tr>
		 <tr id="GREEN">
		 	<td class="GREEN1">GREEN</td>
		 	<td class="GREEN2">GREEN</td>
		 	<td class="GREEN3">GREEN</td>
		 	<td class="GREEN4">GREEN</td>
		 	<td class="GREEN5">GREEN</td></tr>
		 <tr id="BLUE">
		 	<td class="BLUE1">BLUE</td>
		 	<td class="BLUE2">BLUE</td>
		 	<td class="BLUE3">BLUE</td>
		 	<td class="BLUE4">BLUE</td>
		 	<td class="BLUE5">BLUE</td>
		 	</tr>

		 
		 </tbody>
		 
		 </table>

<!-- ====================플레이어덱====================== -->
<table>
<tbody id="tbodyArea">
 <tr id="Deck"><td></td><td></td></tr>
 
 </tbody>

</table>

</div>
<br>
<br>

</body>

</body>

<script type="text/javascript" >
	
	
	//관련 태그들======================================================

	var Color={
			RED:"RED",
			GREEN:"GREEN",
			BLUE:"BLUE"
	}
	
	var count = 1;
	var Answer = new Array(Color.RED,Color.RED,Color.RED);
	var Bomb = new Array(Color.RED,Color.RED,Color.RED);
	var _ANSWER = new Array(Color.RED,Color.RED,Color.RED);
	var _BOMB = new Array(Color.RED,Color.RED,Color.RED);
	var red=5;
	var green=5;
	var blue=5;
	

	
	var PlayerDeck = new Array(
			Color.RED,Color.RED,Color.RED,Color.RED,Color.RED,
			Color.GREEN,Color.GREEN,Color.GREEN,Color.GREEN,Color.GREEN,
			Color.BLUE,Color.BLUE,Color.BLUE,Color.BLUE,Color.BLUE	); //플레이어가 받는 덱

		var selectColor = new Array(document.getElementById( "selectColor[0]" ).value,
					document.getElementById( "selectColor[1]" ).value,
					document.getElementById( "selectColor[2]" ).value
				);
			
			
	//====================================================================
	//랜덤덱(정답,폭탄) 발생
	
	function Random(){
		return Math.floor(Math.random()*3);
	}
	function RandomDeck(){
		var Deck = new Array(Color.RED,Color.RED,Color.RED);			//리턴 대상
		var NumDeck = new Array(Color.RED,Color.RED,Color.RED);		//저장용 덱
	
		
		do
        {
            for (var i = 0; i < 3; i++)
            {
				
                NumDeck[i] = Random();
            }
           
        }
        while ((NumDeck[0] == NumDeck[1] && NumDeck[1] == NumDeck[2] && NumDeck[2] == NumDeck[0]));
		
		for (var j = 0; j < 3; j++)
        {
            
                	if(NumDeck[j]==0)
                    	Deck[j] =Color.RED;
               		if(NumDeck[j]==1)
                		Deck[j] =Color.GREEN;
                	if(NumDeck[j]==2)
                		Deck[j] =Color.BLUE;
            
        }
		
		return Deck;
        
	}
	


	//정답,폭탄 만들기==============================================================
	function MakeAnswerBomb(Answer, Bomb)
    {
        do
        {
            Bomb = RandomDeck();
            Answer = RandomDeck();
        } while ((Answer[0] == Bomb[0] && Answer[1] == Bomb[1] && Answer[2] == Bomb[2]));
        _BOMB = Bomb;
        _ANSWER = Answer;
    }
	
	
	
	function gameStart(){
		MakeAnswerBomb(_ANSWER,_BOMB);
		alert("게임이 시작되었습니다. 새로운 정답과 폭탄 덱이 주어집니다.");
		red=5;
		green=5;
		blue=5;
		deleteText();
		alert("RED:"+red+" GREEN:"+green+" BLUE:"+blue);
		count = 1;
	}
	//플레이 함수===================================================================
	function bullsAndCows(){
		
		var selectColor = new Array(document.getElementById( "selectColor[0]" ).value,
			document.getElementById( "selectColor[1]" ).value,
			document.getElementById( "selectColor[2]" ).value
		);
		
		
		if(selectColor[0]==selectColor[1]&&selectColor[2]==selectColor[1]&&selectColor[0]==selectColor[2]){
			alert("3번 연속해서 같은 색을 고를 수는 없습니다.");
			return false;
		}
		
		
		//색깔이 1개/0개 남아있을 때 경고===================================
			//레드======================================
		if(red==1){
				var check_red=0;
				for(var i=0;i<3;i++){
					if(document.getElementById("selectColor["+i+"]").value=="RED"){
						check_red+=1;
					}
				}
				if(check_red==2){
					alert("덱에 RED가 없습니다");
					return false;
				}
		}else if(red==0)
		{
			var check_red=0;
			for(var i=0;i<3;i++){
				if(document.getElementById("selectColor["+i+"]").value=="RED"){
					check_red+=1;
				}
			}
			if(check_red>0){
				alert("덱에 RED가 없습니다");
				return false;
			}
		}
		 //GREEN========================================
		if(green==1){
				var check_green=0;
				for(var i=0;i<3;i++){
					if(document.getElementById( "selectColor["+i+"]" ).value=="GREEN"){
						check_green+=1;
					}
				}
				if(check_green==2){
					alert("덱에 GREEN이 없습니다");
					return false;
				}
		}else if(green==0){
			var check_green=0;
			for(var i=0;i<3;i++){
				if(document.getElementById( "selectColor["+i+"]" ).value=="GREEN"){
					check_green+=1;
				}
			}
			if(check_green>0){
				alert("덱에 GREEN이 없습니다");
				return false;
			}
		}
		 //BLUE=========================================
		if(blue==1){
				var check_blue=0;
				for(var i=0;i<3;i++){
					if(document.getElementById( "selectColor["+i+"]" ).value=="BLUE"){
						check_blue+=1;
					}
				}
				if(check_blue==2){
					alert("덱에 BLUE가 없습니다");
					return false;
				}
		}else if(blue==0){
			var check_blue=0;
			for(var i=0;i<3;i++){
				if(document.getElementById( "selectColor["+i+"]" ).value=="BLUE"){
					check_blue+=1;
				}
			}
			if(check_blue>0){
				alert("덱에 BLUE가 없습니다");
				return false;
			}
		}

		//한 종류의 색만 3개 남은 경우======================================================
		if((red==0&&green==0&&blue==3)||(blue==0&&green==0&&red==3)||(red==0&&blue==0&&green==3)){
			alert("한 가지 색만 3개 남았으므로 더 이상 게임 진행이 불가능 합니다.");
			deleteText();
			return false;
		}
		
		var strike = ball_color = dead = 0; 
		
		var mark_ball_j = new Array();
		var mark_ball_i = new Array();
		
		
		
			//strike,ball적용========================
			for (var i = 0; i < 3; i++)
			{
				for (var j = 0; j < 3; j++)
				{
					    while (i == j)
					    {
					        if (selectColor[i] == _ANSWER[j])
					            strike++;
					        break;
					    }
				
					    while (i != j)
					    {
					        if (selectColor[0] == _ANSWER[0] && (i == 0 || j == 0))
					            break;
					        else if (selectColor[1] == _ANSWER[1] && (i == 1 || j == 1))
					            break;
					        else if (selectColor[2] == _ANSWER[2] && (i == 2 || j == 2))
					            break;
					        if (mark_ball_j.includes(j) || mark_ball_i.includes(i))
					            break;
					        if (selectColor[i] == _ANSWER[j])
					        {
					            ball_color++;
					            mark_ball_j.push(j);
					            mark_ball_i.push(i);
					        }
					        break;
					
					    }
				
				}
			}
		
			//dead 적용=========================================
			for (var i = 0; i < 3; i++)
			{
				for (var j = 0; j < 3; j++)
				{
				    if (i == j)
				    {
				        if (_BOMB[i] == selectColor[j])
				        {
				            dead++;
				        }
				    }
				}
			}
		
		
		//메세지=================================================
		var roundScore = (strike+"S "+ball_color+"B "+dead+"D");
		var guess = (selectColor[0]+" "+selectColor[1]+" "+selectColor[2]);
		
     
		switch(count){
		case 1:
			document.getElementById( "guess1" ).innerHTML=guess;
			document.getElementById( "answer1" ).innerHTML=roundScore;
			
			 break;
		case 2:
			document.getElementById( "guess2" ).innerHTML=guess;
			document.getElementById( "answer2" ).innerHTML=roundScore;
			break;
		case 3:
			document.getElementById( "guess3" ).innerHTML=guess;
			document.getElementById( "answer3" ).innerHTML=roundScore;
			break;
		case 4:
			document.getElementById( "guess4" ).innerHTML=guess;
			document.getElementById( "answer4" ).innerHTML=roundScore;
			break;
		case 5:
			document.getElementById( "guess5" ).innerHTML=guess;
			document.getElementById( "answer5" ).innerHTML=roundScore;
			break;
		case 6:
			document.getElementById( "guess6" ).innerHTML=guess;
			document.getElementById( "answer6" ).innerHTML=roundScore;
			break;
		case 7:
			document.getElementById( "guess7" ).innerHTML=guess;
			document.getElementById( "answer7" ).innerHTML=roundScore;
			break;
		case 8:
			document.getElementById( "guess8" ).innerHTML=guess;
			document.getElementById( "answer8" ).innerHTML=roundScore;
			break;
		case 9:
			document.getElementById( "guess9" ).innerHTML=guess;
			document.getElementById( "answer9" ).innerHTML=roundScore;
			break;
		case 10:
			alert("게임이 끝났습니다. 새로 시작해주세요");
			count=0;
			deleteText();
			break;
		}
		 

		
		if (strike == 3)
        {
            alert("축하합니다! 폭탄을 해제했어요!");
            alert("정답:"+_ANSWER[0]+" "+_ANSWER[1]+" "+ _ANSWER[2]);
            alert("폭탄:"+_BOMB[0]+" "+_BOMB[1]+" "+ _BOMB[2]);
        }
        else if (dead == 3 )
        {
            alert("망했습니다! 폭탄이 터졌어요!");
            alert("정답:"+_ANSWER[0]+" "+_ANSWER[1]+" "+ _ANSWER[2]);
            alert("폭탄:"+_BOMB[0]+" "+_BOMB[1]+" "+ _BOMB[2]);
        }
		
		deleteDeck(selectColor);
		
		count++;
      
		
	}
	
	
	//정답보기===================================================================
		function AnswerAndBomb(){
		
		var answer = (_ANSWER[0]+" / "+_ANSWER[1]+" / "+_ANSWER[2]);
			document.getElementById( "answer" ).innerHTML=answer;
		var bomb = (_BOMB[0]+" / "+_BOMB[1]+" / "+_BOMB[2]);	
			document.getElementById( "bomb" ).innerHTML=bomb;

	}
	
	//텍스트 삭제===========================================================================
		function deleteText () { 

			document.getElementById( "selectColor[0]" ).focus(); 
	
			document.getElementById( "guess1" ).innerHTML="&nbsp;";
			document.getElementById( "answer1" ).innerHTML="&nbsp;";
			document.getElementById( "guess2" ).innerHTML="&nbsp;";
			document.getElementById( "answer2" ).innerHTML="&nbsp;";
			document.getElementById( "guess3" ).innerHTML="&nbsp;";
			document.getElementById( "answer3" ).innerHTML="&nbsp;";
			document.getElementById( "guess4" ).innerHTML="&nbsp;";
			document.getElementById( "answer4" ).innerHTML="&nbsp;";
			document.getElementById( "guess5" ).innerHTML="&nbsp;";
			document.getElementById( "answer5" ).innerHTML="&nbsp;";

			
			document.getElementById( "answer" ).innerHTML="&nbsp;";
			document.getElementById( "bomb" ).innerHTML="&nbsp;";
			
		} 

	
	//덱 삭제에 필요한 덱 확인용====================================================
/* 			var i;
	function index(i){
		if(!(PlayerDeck.indexOf(i)=="")	){
			return true;
		}else{
			return false;
		}
	} */
	
	
	//덱 삭제=======================================================================
		function deleteDeck(selectColor){
			var selectColor = new Array(document.getElementById( "selectColor[0]" ).value,
					document.getElementById( "selectColor[1]" ).value,
					document.getElementById( "selectColor[2]" ).value
				);
			
		
			
			
			for(var i=0;i<3;i++){
				
				if(selectColor[i]=="RED"){

					for(var n=1;n<6;n++){
						if($("#RED").find(".RED"+n).text()=="RED"){
							  $("#RED").find(".RED"+n).text("");
						  n=6;
						  
						  red--;
					  }
					}
					
					}
				
				else if(selectColor[i]=="GREEN"){
					for(var n=1;n<6;n++){
						if($("#GREEN").find(".GREEN"+n).text()=="GREEN"){
							  $("#GREEN").find(".GREEN"+n).text("");
						  n=6;
						  
						 green--;
					  }
					}
					
					
				 }
				else if(selectColor[i]=="BLUE"){
			
					for(var n=1;n<6;n++){
						if($("#BLUE").find(".BLUE"+n).text()=="BLUE"){
							  $("#BLUE").find(".BLUE"+n).text("");
						  n=6;
						  
						  blue--;
					  }
					}
				 }//BLUE끝
				 
				 alert("RED:"+red+" GREEN:"+green+" BLUE"+blue);
			 }//for끝
		
			}//FUNCTION끝
			
	
//남은덱 보기==================================================================================
	
	

	
</script>

</html>