<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* .brick_break { */
/* 	margin: 0px auto; */
/* 	text-align: center; */
/* 	width: 100%; */
/* 	padding: 10px; */
/* } */
</style>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
var w;
 
function startWorker() {
    if(typeof(Worker) !== "undefined") {
        if(typeof(w) == "undefined") {
            w = new Worker("${root}/js/demo_workers.js");
        }
        w.onmessage = function(event) {
            document.getElementById("time_game").innerHTML = event.data;
        };
    } else {
        document.getElementById("time_game").innerHTML = "Sorry, your browser does not support Web Workers...";
    }
}
 
function stopWorker() { 
    w.terminate();
    w = undefined;
}
</script>



<script type="text/javascript">
var timer;
var i=0;
var divide=100;

function game_brick(){
	alert("3초후 게임이 시작됩니다.")
	setTimeout("test()",1000);

}

// function start(){
// 	timer=self.setInterval('check()',(1000));
// }

// function check(){
// 	i++;
// 	$('#time_game').html(i);
// }

// function stop(){
// 	clearInterval(timer);
// 	timer=null;
// }

// function reset(){
// 	stop();
// 	i=0;
// 	$("#time_game").html(i/divide);
// }

function test(){
	setTimeout("brickbreak()",3000);
	
	

	var ctx = document.getElementById("canvas").getContext("2d");
    ctx.arc(75, 75, 10, 0, Math.PI * 2, true);
    ctx.fillStyle = '#03158a';
    ctx.closePath();
    ctx.fill();

    var width, height;
    var x = 150,
        y = 150;
 
    var dx = 2,
   		dy = 4;
    
    //페달 추가
    var paddlex, paddleh, paddlew; 
    
    //마우스, 키보드 추가
    var is_leftPannel=false,
    	is_rightPannel=false;
    var canvasMinX, canvasMaxX;
    
    //블록
    var bricks;
    var nrows; //가로 벽돌갯수
    var ncols; //세로 벽돌 갯수
    var brick_w;
    var brick_h;
    var padding;//벽돌간의 간격
    
    var ctx;
    var anim;
    
    
    function init() {
        var c = document.getElementById("canvas");
        var ctx = c.getContext("2d");
        width = document.getElementById("canvas").width;
        height = document.getElementById("canvas").height;
        
        
        //마우스, 키보드 위한 변수에 대한 초기화
		canvasMinX=document.getElementById("canvas").getContext("offset().left");
        canvasMaxX=canvasMinX +width;
        
        //애니메이션
        anim = window.requestAnimationFrame(draw);

    }


    function draw() {
       clear();
        x=150;
        y=150;
       
        //페달 만들기
        rect(paddlex, height - paddleh, paddlew, paddleh);

        
        //블록
        for(i=0;i<nrows;i++){
        	for(j=0;j<ncols;j++){
        		if(bricks[i][j]==1){
        			rect(j*brick_w, i*brick_h,
        				  brick_w-padding, brick_h-padding);
        		}
        	}
        }
        
                  
        //키보드 마우스 움직임
        if(is_leftPannel && paddlex >0){
        	paddlex= paddlex-5;
        }
        if(is_rightPannel && paddlex +paddlew <width){
        	paddlex=paddlex+5;
        }       
        

       anim = window.requestAnimationFrame(draw);
    }


    function clear() {
        ctx.clearRect(0, 0, width, height);


    }
     
    // 사각형을 그리기 위한 함수 
    // 폐달 뿐 아니라 나중에 벽돌을 그려줄때도 활용 합니다. 
    function rect(x, y, w, h){
      ctx.beginPath();
      ctx.rect(x, y, w, h);
      ctx.closePath();
      ctx.fill();
    }
   
    function init_faddle() {
        paddlex = width/2; 
        paddleh = 10;
        paddlew = 75;
    }
    
    //벽돌 기본값
    function init_bricks(){
    	nrows=5;
    	ncols=5;
    	padding=2;
    	brick_w=(width/ncols);
    	brick_h=18;
    	
    	bricks=new Array(nrows);
    	for(i=0;i<nrows;i++){
    		bricks[i]=new Array(ncols);
    		for(j=0;j<ncols;j++){
    			bricks[i][j]=1;
    		}
    	}
    }
    
    
    init();
    // 폐달에 위치와 크기를 초기화 해 줍니다. 
    init_faddle(); //페달
    //벽돌
    init_bricks();//벽돌
    
    window.onkeydown=function(e){
   //document.getElementById('keydown').onclick=function(e){
    	if(e.which==37){
    		is_leftPannel=true;
    	}else if(e.which==39){
    		is_rightPannel=true;
    	}
    }
    
   window.onkeyup=function(e){
    //document.getElementById('keyup').onclick=function(e){
    	if(e.which==37){
    		is_leftPannel=false;
    	}else if(e.which==39){
    		is_rightPannel=false;
    	}
    }
    
    function onMouseMove(e){
    	if (e.pageX >= canvasMinX && e.pageX <= canvasMaxX) {
            paddlex = e.pageX - canvasMinX - (paddlew/2);
        }
    }
    
    $(document).mousemove(onMouseMove);
    //canvas.onmousemove=onMouseMove();

	
}
  
function end(){
	alert("게임이 종료되었습니다.");
	//reset();
}
   
   
   
function brickbreak(){
	startWorker();
    var ctx = document.getElementById("canvas").getContext("2d");
    ctx.arc(75, 75, 10, 0, Math.PI * 2, true);
    ctx.fillStyle = 'blue';
    ctx.closePath();
    ctx.fill();

    var width, height;
    var x = 150,
        y = 150,
        radius = 10;
    var dx = 3,
        dy = 7;
    
    //페달 추가
    var paddlex, paddleh, paddlew; 
    
    //마우스, 키보드 추가
    var is_leftPannel=false,
    	is_rightPannel=false;
    var canvasMinX, canvasMaxX;
    
    var is_gameover=false;
    
    
    //블록
    var bricks;
    var nrows; //가로 벽돌갯수
    var ncols; //세로 벽돌 갯수
    var brick_w;
    var brick_h;
    var padding;//벽돌간의 간격
    
    var ctx;
    var anim;
    

    function init() {
        var c = document.getElementById("canvas");
        var ctx = c.getContext("2d");
        width = document.getElementById("canvas").width;
        height = document.getElementById("canvas").height;
        
        
        //마우스, 키보드 위한 변수에 대한 초기화
		canvasMinX=document.getElementById("canvas").getContext("offset().left");
        canvasMaxX=canvasMinX +width;
        
        //애니메이션
        anim = window.requestAnimationFrame(draw);

    }


    function draw() {
        clear();
        ball(x, y, radius);
       
        //페달 만들기
        rect(paddlex, height - paddleh, paddlew, paddleh);

        
        //블록
        for(i=0;i<nrows;i++){
        	for(j=0;j<ncols;j++){
        		if(bricks[i][j]==1){
        			rect(j*brick_w, i*brick_h,
        				  brick_w-padding, brick_h-padding);
        		}
        	}
        }
        
                  
        //키보드 마우스 움직임
        if(is_leftPannel && paddlex >0){
        	paddlex= paddlex-5;
        }
        if(is_rightPannel && paddlex +paddlew <width){
        	paddlex=paddlex+5;
        }
        
        
        x += dx;
        y += dy;

     

        //벽돌 깨기
        var row=Math.floor(y/(brick_h+padding));
        var col=Math.floor(x/(brick_w+padding));
        if(row<nrows){
        	if(bricks[row][col]==1){
        		dy= -dy;
        		bricks[row][col]=0;
        	}
        }
        

        if (x >= width - radius || x <= 0 + radius) {
            dx = -dx;
        }
        if (y <= 0 + radius) {
            dy = -dy;
        }else if(y>= height-radius){//페달부분
        	if(x> paddlex && x< paddlex + paddlew){
        		dx= -((paddlex+(paddlew/2)-x)/(paddlew))*10;
        		dy= -dy;
        	}else{
            	//게임 끝
            	is_gameover=true;
            	
            }
        	
        }
        if(is_gameover){
			window.cancelAnimationFrame(anim); 
			stopWorker();
			end();
        }else{
        	anim = window.requestAnimationFrame(draw);            	
        }
    }

    
    function clear() {
        ctx.clearRect(0, 0, width, height);


    }

    function ball(x, y, r) {
        ctx.fillStyle = '#03158a';
        ctx.beginPath();
        ctx.arc(x, y, r, 0, Math.PI * 2, true);
        ctx.closePath();
        ctx.fill();
    }

     
    // 사각형을 그리기 위한 함수 
    // 폐달 뿐 아니라 나중에 벽돌을 그려줄때도 활용 합니다. 
    function rect(x, y, w, h){
      ctx.beginPath();
      ctx.rect(x, y, w, h);
      ctx.closePath();
      ctx.fill();
    }
   
    function init_faddle() {
        paddlex = width/2; 
        paddleh = 10;
        paddlew = 75;
    }
    
    //벽돌 기본값
    function init_bricks(){
    	nrows=5;
    	ncols=5;
    	padding=2;
    	brick_w=(width/ncols);
    	brick_h=18;
    	
    	bricks=new Array(nrows);
    	for(i=0;i<nrows;i++){
    		bricks[i]=new Array(ncols);
    		for(j=0;j<ncols;j++){
    			bricks[i][j]=1;
    		}
    	}
    }
    

    
    init();
    // 폐달에 위치와 크기를 초기화 해 줍니다. 
    init_faddle();
    //벽돌
    init_bricks();
    
    window.onkeydown=function(e){
   //document.getElementById('keydown').onclick=function(e){
    	if(e.which==37){
    		is_leftPannel=true;
    	}else if(e.which==39){
    		is_rightPannel=true;
    	}
    }
    
   window.onkeyup=function(e){
    //document.getElementById('keyup').onclick=function(e){
    	if(e.which==37){
    		is_leftPannel=false;
    	}else if(e.which==39){
    		is_rightPannel=false;
    	}
    }
    
    function onMouseMove(e){
    	if (e.pageX >= canvasMinX && e.pageX <= canvasMaxX) {
            paddlex = e.pageX - canvasMinX - (paddlew/2);
        }
    }
    
    $(document).mousemove(onMouseMove);
    //canvas.onmousemove=onMouseMove();
    
   }  

</script>


</head>
<body>
	<DIV>

		<button id="start" onclick="game_brick()">게임시작</button>
		<br><br>
		<span id="time_game">0.00</span>

		<br><br>
	</div>
	<div>
		<canvas id="canvas" width="350" height="350"></canvas>
	</DIV>
</body>

</html>