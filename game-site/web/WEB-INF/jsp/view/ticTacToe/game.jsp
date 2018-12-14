<%--@elvariable id="action" type="java.lang.String"--%>
<%--@elvariable id="gameId" type="long"--%>
<%--@elvariable id="username" type="java.lang.String"--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Game Site :: Tic Tac Toe</title>
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/css/bootstrap.min.css" />
        <link rel="stylesheet"
              href="<c:url value="/resource/stylesheet/ticTacToe.css" />" />
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <h2>Tic Tac Toe</h2>
        <span class="player-label">You:</span> ${username}<br />
        <span class="player-label">Opponent:</span>
        <span id="opponent"><i>Waiting</i></span>
        <div id="status">&nbsp;</div>
        <div id="gameContainer">
            <div class="row">    
                <div id="r4c4" class="game-cell" onclick="move(4, 4);">&nbsp;</div>
                <div id="r4c5" class="game-cell" onclick="move(4, 5);">&nbsp;</div>
                <div id="r4c6" class="game-cell" onclick="move(4, 6);">&nbsp;</div>
                <div id="r4c7" class="game-cell" onclick="move(4, 7);">&nbsp;</div>
                <div id="r4c8" class="game-cell" onclick="move(4, 8);">&nbsp;</div>
                <div id="r4c9" class="game-cell" onclick="move(4, 9);">&nbsp;</div>
                <div id="r4c10" class="game-cell" onclick="move(4, 10);">&nbsp;</div>
                <div id="r4c11" class="game-cell" onclick="move(4, 11);">&nbsp;</div>
                <div id="r4c12" class="game-cell" onclick="move(4, 12);">&nbsp;</div>
                <div id="r4c13" class="game-cell" onclick="move(4, 13);">&nbsp;</div>
                <div id="r4c14" class="game-cell" onclick="move(4, 14);">&nbsp;</div>
                <div id="r4c15" class="game-cell" onclick="move(4, 15);">&nbsp;</div>
                <div id="r4c16" class="game-cell" onclick="move(4, 16);">&nbsp;</div>
                <div id="r4c17" class="game-cell" onclick="move(4, 17);">&nbsp;</div>
                <div id="r4c18" class="game-cell" onclick="move(4, 18);">&nbsp;</div>
            </div>
            <div class="row">
                <div id="r5c4" class="game-cell" onclick="move(5, 4);">&nbsp;</div>
                <div id="r5c5" class="game-cell" onclick="move(5, 5);">&nbsp;</div>
                <div id="r5c6" class="game-cell" onclick="move(5, 6);">&nbsp;</div>
                <div id="r5c7" class="game-cell" onclick="move(5, 7);">&nbsp;</div>
                <div id="r5c8" class="game-cell" onclick="move(5, 8);">&nbsp;</div>
                <div id="r5c9" class="game-cell" onclick="move(5, 9);">&nbsp;</div>
                <div id="r5c10" class="game-cell" onclick="move(5, 10);">&nbsp;</div>
                <div id="r5c11" class="game-cell" onclick="move(5, 11);">&nbsp;</div>
                <div id="r5c12" class="game-cell" onclick="move(5, 12);">&nbsp;</div>
                <div id="r5c13" class="game-cell" onclick="move(5, 13);">&nbsp;</div>
                <div id="r5c14" class="game-cell" onclick="move(5, 14);">&nbsp;</div>
                <div id="r5c15" class="game-cell" onclick="move(5, 15);">&nbsp;</div>
                <div id="r5c16" class="game-cell" onclick="move(5, 16);">&nbsp;</div>
                <div id="r5c17" class="game-cell" onclick="move(5, 17);">&nbsp;</div>
                <div id="r5c18" class="game-cell" onclick="move(5, 18);">&nbsp;</div>
            </div>
            <div class="row">
                <div id="r6c4" class="game-cell" onclick="move(6, 4);">&nbsp;</div>
                <div id="r6c5" class="game-cell" onclick="move(6, 5);">&nbsp;</div>
                <div id="r6c6" class="game-cell" onclick="move(6, 6);">&nbsp;</div>
                <div id="r6c7" class="game-cell" onclick="move(6, 7);">&nbsp;</div>
                <div id="r6c8" class="game-cell" onclick="move(6, 8);">&nbsp;</div>
                <div id="r6c9" class="game-cell" onclick="move(6, 9);">&nbsp;</div>
                <div id="r6c10" class="game-cell" onclick="move(6, 10);">&nbsp;</div>
                <div id="r6c11" class="game-cell" onclick="move(6, 11);">&nbsp;</div>
                <div id="r6c12" class="game-cell" onclick="move(6, 12);">&nbsp;</div>
                <div id="r6c13" class="game-cell" onclick="move(6, 13);">&nbsp;</div>
                <div id="r6c14" class="game-cell" onclick="move(6, 14);">&nbsp;</div>
                <div id="r6c15" class="game-cell" onclick="move(6, 15);">&nbsp;</div>
                <div id="r6c16" class="game-cell" onclick="move(6, 16);">&nbsp;</div>
                <div id="r6c17" class="game-cell" onclick="move(6, 17);">&nbsp;</div>
                <div id="r6c18" class="game-cell" onclick="move(6, 18);">&nbsp;</div>
            </div>
                 <div class="row">    
                <div id="r7c4" class="game-cell" onclick="move(7, 4);">&nbsp;</div>
                <div id="r7c5" class="game-cell" onclick="move(7, 5);">&nbsp;</div>
                <div id="r7c6" class="game-cell" onclick="move(7, 6);">&nbsp;</div>
                <div id="r7c7" class="game-cell" onclick="move(7, 7);">&nbsp;</div>
                <div id="r7c8" class="game-cell" onclick="move(7, 8);">&nbsp;</div>
                <div id="r7c9" class="game-cell" onclick="move(7, 9);">&nbsp;</div>
                <div id="r7c10" class="game-cell" onclick="move(7, 10);">&nbsp;</div>
                <div id="r7c11" class="game-cell" onclick="move(7, 11);">&nbsp;</div>
                <div id="r7c12" class="game-cell" onclick="move(7, 12);">&nbsp;</div>
                <div id="r7c13" class="game-cell" onclick="move(7, 13);">&nbsp;</div>
                <div id="r7c14" class="game-cell" onclick="move(7, 14);">&nbsp;</div>
                <div id="r7c15" class="game-cell" onclick="move(7, 15);">&nbsp;</div>
                <div id="r7c16" class="game-cell" onclick="move(7, 16);">&nbsp;</div>
                <div id="r7c17" class="game-cell" onclick="move(7, 17);">&nbsp;</div>
                <div id="r7c18" class="game-cell" onclick="move(7, 18);">&nbsp;</div>
            </div>
                 <div class="row">    
                <div id="r8c4" class="game-cell" onclick="move(8, 4);">&nbsp;</div>
                <div id="r8c5" class="game-cell" onclick="move(8, 5);">&nbsp;</div>
                <div id="r8c6" class="game-cell" onclick="move(8, 6);">&nbsp;</div>
                <div id="r8c7" class="game-cell" onclick="move(8, 7);">&nbsp;</div>
                <div id="r8c8" class="game-cell" onclick="move(8, 8);">&nbsp;</div>
                <div id="r8c9" class="game-cell" onclick="move(8, 9);">&nbsp;</div>
                <div id="r8c10" class="game-cell" onclick="move(8, 10);">&nbsp;</div>
                <div id="r8c11" class="game-cell" onclick="move(8, 11);">&nbsp;</div>
                <div id="r8c12" class="game-cell" onclick="move(8, 12);">&nbsp;</div>
                <div id="r8c13" class="game-cell" onclick="move(8, 13);">&nbsp;</div>
                <div id="r8c14" class="game-cell" onclick="move(8, 14);">&nbsp;</div>
                <div id="r8c15" class="game-cell" onclick="move(8, 15);">&nbsp;</div>
                <div id="r8c16" class="game-cell" onclick="move(8, 16);">&nbsp;</div>
                <div id="r8c17" class="game-cell" onclick="move(8, 17);">&nbsp;</div>
                <div id="r8c18" class="game-cell" onclick="move(8, 18);">&nbsp;</div>
            </div>
                 <div class="row">    
                <div id="r9c4" class="game-cell" onclick="move(9, 4);">&nbsp;</div>
                <div id="r9c5" class="game-cell" onclick="move(9, 5);">&nbsp;</div>
                <div id="r9c6" class="game-cell" onclick="move(9, 6);">&nbsp;</div>
                <div id="r9c7" class="game-cell" onclick="move(9, 7);">&nbsp;</div>
                <div id="r9c8" class="game-cell" onclick="move(9, 8);">&nbsp;</div>
                <div id="r9c9" class="game-cell" onclick="move(9, 9);">&nbsp;</div>
                <div id="r9c10"class="game-cell" onclick="move(9, 10);">&nbsp;</div>
                <div id="r9c11"class="game-cell" onclick="move(9, 11);">&nbsp;</div>
                <div id="r9c12"class="game-cell" onclick="move(9, 12);">&nbsp;</div>
                <div id="r9c13"class="game-cell" onclick="move(9, 13);">&nbsp;</div>
                <div id="r9c14" class="game-cell" onclick="move(9, 14);">&nbsp;</div>
                <div id="r9c15" class="game-cell" onclick="move(9, 15);">&nbsp;</div>
                <div id="r9c16" class="game-cell" onclick="move(9, 16);">&nbsp;</div>
                <div id="r9c17" class="game-cell" onclick="move(9, 17);">&nbsp;</div>
                <div id="r9c18" class="game-cell" onclick="move(9, 18);">&nbsp;</div>
            </div>
                 <div class="row">    
                <div id="r10c4" class="game-cell" onclick="move(10, 4);">&nbsp;</div>
                <div id="r10c5" class="game-cell" onclick="move(10, 5);">&nbsp;</div>
                <div id="r10c6" class="game-cell" onclick="move(10, 6);">&nbsp;</div>
                <div id="r10c7" class="game-cell" onclick="move(10, 7);">&nbsp;</div>
                <div id="r10c8" class="game-cell" onclick="move(10, 8);">&nbsp;</div>
                <div id="r10c9" class="game-cell" onclick="move(10, 9);">&nbsp;</div>
                <div id="r10c10"class="game-cell" onclick="move(10, 10);">&nbsp;</div>
                <div id="r10c11"class="game-cell" onclick="move(10, 11);">&nbsp;</div>
                <div id="r10c12"class="game-cell" onclick="move(10, 12);">&nbsp;</div>
                <div id="r10c13"class="game-cell" onclick="move(10, 13);">&nbsp;</div>
                <div id="r10c14" class="game-cell" onclick="move(10, 14);">&nbsp;</div>
                <div id="r10c15" class="game-cell" onclick="move(10, 15);">&nbsp;</div>
                <div id="r10c16" class="game-cell" onclick="move(10, 16);">&nbsp;</div>
                <div id="r10c17" class="game-cell" onclick="move(10, 17);">&nbsp;</div>
                <div id="r10c18" class="game-cell" onclick="move(10, 18);">&nbsp;</div>
            </div>
                 <div class="row">    
                <div id="r11c4" class="game-cell" onclick="move(11, 4);">&nbsp;</div>
                <div id="r11c5" class="game-cell" onclick="move(11, 5);">&nbsp;</div>
                <div id="r11c6" class="game-cell" onclick="move(11, 6);">&nbsp;</div>
                <div id="r11c7" class="game-cell" onclick="move(11, 7);">&nbsp;</div>
                <div id="r11c8" class="game-cell" onclick="move(11, 8);">&nbsp;</div>
                <div id="r11c9" class="game-cell" onclick="move(11, 9);">&nbsp;</div>
                <div id="r11c10"class="game-cell" onclick="move(11, 10);">&nbsp;</div>
                <div id="r11c11"class="game-cell" onclick="move(11, 11);">&nbsp;</div>
                <div id="r11c12"class="game-cell" onclick="move(11, 12);">&nbsp;</div>
                <div id="r11c13"class="game-cell" onclick="move(11, 13);">&nbsp;</div>
                <div id="r11c14" class="game-cell" onclick="move(11, 14);">&nbsp;</div>
                <div id="r11c15" class="game-cell" onclick="move(11, 15);">&nbsp;</div>
                <div id="r11c16" class="game-cell" onclick="move(11, 16);">&nbsp;</div>
                <div id="r11c17" class="game-cell" onclick="move(11, 17);">&nbsp;</div>
                <div id="r11c18" class="game-cell" onclick="move(11, 18);">&nbsp;</div>
            </div>
                 <div class="row">    
                <div id="r12c4" class="game-cell" onclick="move(12, 4);">&nbsp;</div>
                <div id="r12c5" class="game-cell" onclick="move(12, 5);">&nbsp;</div>
                <div id="r12c6" class="game-cell" onclick="move(12, 6);">&nbsp;</div>
                <div id="r12c7" class="game-cell" onclick="move(12, 7);">&nbsp;</div>
                <div id="r12c8" class="game-cell" onclick="move(12, 8);">&nbsp;</div>
                <div id="r12c9" class="game-cell" onclick="move(12, 9);">&nbsp;</div>
                <div id="r12c10"class="game-cell" onclick="move(12, 10);">&nbsp;</div>
                <div id="r12c11"class="game-cell" onclick="move(12, 11);">&nbsp;</div>
                <div id="r12c12"class="game-cell" onclick="move(12, 12);">&nbsp;</div>
                <div id="r12c13"class="game-cell" onclick="move(12, 13);">&nbsp;</div>
                <div id="r12c14" class="game-cell" onclick="move(12, 14);">&nbsp;</div>
                <div id="r12c15" class="game-cell" onclick="move(12, 15);">&nbsp;</div>
                <div id="r12c16" class="game-cell" onclick="move(12, 16);">&nbsp;</div>
                <div id="r12c17" class="game-cell" onclick="move(12, 17);">&nbsp;</div>
                <div id="r12c18" class="game-cell" onclick="move(12, 18);">&nbsp;</div>
            </div>
                 <div class="row">    
                <div id="r13c4" class="game-cell" onclick="move(13, 4);">&nbsp;</div>
                <div id="r13c5" class="game-cell" onclick="move(13, 5);">&nbsp;</div>
                <div id="r13c6" class="game-cell" onclick="move(13, 6);">&nbsp;</div>
                <div id="r13c7" class="game-cell" onclick="move(13, 7);">&nbsp;</div>
                <div id="r13c8" class="game-cell" onclick="move(13, 8);">&nbsp;</div>
                <div id="r13c9" class="game-cell" onclick="move(13, 9);">&nbsp;</div>
                <div id="r13c10"class="game-cell" onclick="move(13, 10);">&nbsp;</div>
                <div id="r13c11"class="game-cell" onclick="move(13, 11);">&nbsp;</div>
                <div id="r13c12"class="game-cell" onclick="move(13, 12);">&nbsp;</div>
                <div id="r13c13"class="game-cell" onclick="move(13, 13);">&nbsp;</div>
                <div id="r13c14" class="game-cell" onclick="move(13, 14);">&nbsp;</div>
                <div id="r13c15" class="game-cell" onclick="move(13, 15);">&nbsp;</div>
                <div id="r13c16" class="game-cell" onclick="move(13, 16);">&nbsp;</div>
                <div id="r13c17" class="game-cell" onclick="move(13, 17);">&nbsp;</div>
                <div id="r13c18" class="game-cell" onclick="move(13, 18);">&nbsp;</div>
            </div>
                 <div class="row">    
                <div id="r14c4" class="game-cell" onclick="move(14, 4);">&nbsp;</div>
                <div id="r14c5" class="game-cell" onclick="move(14, 5);">&nbsp;</div>
                <div id="r14c6" class="game-cell" onclick="move(14, 6);">&nbsp;</div>
                <div id="r14c7" class="game-cell" onclick="move(14, 7);">&nbsp;</div>
                <div id="r14c8" class="game-cell" onclick="move(14, 8);">&nbsp;</div>
                <div id="r14c9" class="game-cell" onclick="move(14, 9);">&nbsp;</div>
                <div id="r14c10"class="game-cell" onclick="move(14, 10);">&nbsp;</div>
                <div id="r14c11"class="game-cell" onclick="move(14, 11);">&nbsp;</div>
                <div id="r14c12"class="game-cell" onclick="move(14, 12);">&nbsp;</div>
                <div id="r14c13"class="game-cell" onclick="move(14, 13);">&nbsp;</div>
                <div id="r14c14" class="game-cell" onclick="move(14, 14);">&nbsp;</div>
                <div id="r14c15" class="game-cell" onclick="move(14, 15);">&nbsp;</div>
                <div id="r14c16" class="game-cell" onclick="move(14, 16);">&nbsp;</div>
                <div id="r14c17" class="game-cell" onclick="move(14, 17);">&nbsp;</div>
                <div id="r14c18" class="game-cell" onclick="move(14, 18);">&nbsp;</div>
            </div>
                 <div class="row">    
                <div id="r15c4" class="game-cell" onclick="move(15, 4);">&nbsp;</div>
                <div id="r15c5" class="game-cell" onclick="move(15, 5);">&nbsp;</div>
                <div id="r15c6" class="game-cell" onclick="move(15, 6);">&nbsp;</div>
                <div id="r15c7" class="game-cell" onclick="move(15, 7);">&nbsp;</div>
                <div id="r15c8" class="game-cell" onclick="move(15, 8);">&nbsp;</div>
                <div id="r15c9" class="game-cell" onclick="move(15, 9);">&nbsp;</div>
                <div id="r15c10"class="game-cell" onclick="move(15, 10);">&nbsp;</div>
                <div id="r15c11"class="game-cell" onclick="move(15, 11);">&nbsp;</div>
                <div id="r15c12"class="game-cell" onclick="move(15, 12);">&nbsp;</div>
                <div id="r15c13"class="game-cell" onclick="move(15, 13);">&nbsp;</div>
                <div id="r15c14" class="game-cell" onclick="move(15, 14);">&nbsp;</div>
                <div id="r15c15" class="game-cell" onclick="move(15, 15);">&nbsp;</div>
                <div id="r15c16" class="game-cell" onclick="move(15, 16);">&nbsp;</div>
                <div id="r15c17" class="game-cell" onclick="move(15, 17);">&nbsp;</div>
                <div id="r15c18" class="game-cell" onclick="move(15, 18);">&nbsp;</div>
            </div>
                 <div class="row">    
                <div id="r16c4" class="game-cell" onclick="move(16, 4);">&nbsp;</div>
                <div id="r16c5" class="game-cell" onclick="move(16, 5);">&nbsp;</div>
                <div id="r16c6" class="game-cell" onclick="move(16, 6);">&nbsp;</div>
                <div id="r16c7" class="game-cell" onclick="move(16, 7);">&nbsp;</div>
                <div id="r16c8" class="game-cell" onclick="move(16, 8);">&nbsp;</div>
                <div id="r16c9" class="game-cell" onclick="move(16, 9);">&nbsp;</div>
                <div id="r16c10"class="game-cell" onclick="move(16, 10);">&nbsp;</div>
                <div id="r16c11"class="game-cell" onclick="move(16, 11);">&nbsp;</div>
                <div id="r16c12"class="game-cell" onclick="move(16, 12);">&nbsp;</div>
                <div id="r16c13"class="game-cell" onclick="move(16, 13);">&nbsp;</div>
               	<div id="r16c14"class="game-cell" onclick="move(16, 14);">&nbsp;</div>
                <div id="r16c15" class="game-cell" onclick="move(16, 15);">&nbsp;</div>
                <div id="r16c16" class="game-cell" onclick="move(16, 16);">&nbsp;</div>
                <div id="r16c17" class="game-cell" onclick="move(16, 17);">&nbsp;</div>
                <div id="r16c18" class="game-cell" onclick="move(16, 18);">&nbsp;</div>
            </div>
                 <div class="row">    
                <div id="r17c4" class="game-cell" onclick="move(17, 4);">&nbsp;</div>
                <div id="r17c5" class="game-cell" onclick="move(17, 5);">&nbsp;</div>
                <div id="r17c6" class="game-cell" onclick="move(17, 6);">&nbsp;</div>
                <div id="r17c7" class="game-cell" onclick="move(17, 7);">&nbsp;</div>
                <div id="r17c8" class="game-cell" onclick="move(17, 8);">&nbsp;</div>
                <div id="r17c9" class="game-cell" onclick="move(17, 9);">&nbsp;</div>
                <div id="r17c10"class="game-cell" onclick="move(17, 10);">&nbsp;</div>
                <div id="r17c11"class="game-cell" onclick="move(17, 11);">&nbsp;</div>
                <div id="r17c12"class="game-cell" onclick="move(17, 12);">&nbsp;</div>
                <div id="r17c13"class="game-cell" onclick="move(17, 13);">&nbsp;</div>
                <div id="r17c14" class="game-cell" onclick="move(17, 14);">&nbsp;</div>
                <div id="r17c15" class="game-cell" onclick="move(17, 15);">&nbsp;</div>
                <div id="r17c16" class="game-cell" onclick="move(17, 16);">&nbsp;</div>
                <div id="r17c17" class="game-cell" onclick="move(17, 17);">&nbsp;</div>
                <div id="r17c18" class="game-cell" onclick="move(17, 18);">&nbsp;</div>
            </div>
                 <div class="row">    
                <div id="r18c4" class="game-cell" onclick="move(18, 4);">&nbsp;</div>
                <div id="r18c5" class="game-cell" onclick="move(18, 5);">&nbsp;</div>
                <div id="r18c6" class="game-cell" onclick="move(18, 6);">&nbsp;</div>
                <div id="r18c7" class="game-cell" onclick="move(18, 7);">&nbsp;</div>
                <div id="r18c8" class="game-cell" onclick="move(18, 8);">&nbsp;</div>
                <div id="r18c9" class="game-cell" onclick="move(18, 9);">&nbsp;</div>
                <div id="r18c10"class="game-cell" onclick="move(18, 10);">&nbsp;</div>
                <div id="r18c11"class="game-cell" onclick="move(18, 11);">&nbsp;</div>
                <div id="r18c12"class="game-cell" onclick="move(18, 12);">&nbsp;</div>
                <div id="r18c13"class="game-cell" onclick="move(18, 13);">&nbsp;</div>
                <div id="r18c14" class="game-cell" onclick="move(18, 14);">&nbsp;</div>
                <div id="r18c15" class="game-cell" onclick="move(18, 15);">&nbsp;</div>
                <div id="r18c16" class="game-cell" onclick="move(18, 16);">&nbsp;</div>
                <div id="r18c17" class="game-cell" onclick="move(18, 17);">&nbsp;</div>
                <div id="r18c18" class="game-cell" onclick="move(18, 18);">&nbsp;</div>
            </div>
        </div>
        <div id="modalWaiting" class="modal hide fade">
            <div class="modal-header"><h3>Please Wait...</h3></div>
            <div class="modal-body" id="modalWaitingBody">&nbsp;</div>
        </div>
        <div id="modalError" class="modal hide fade">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;
                </button>
                <h3>Error</h3>
            </div>
            <div class="modal-body" id="modalErrorBody">A blah error occurred.
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
        <div id="modalGameOver" class="modal hide fade">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;
                </button>
                <h3>Game Over</h3>
            </div>
            <div class="modal-body" id="modalGameOverBody">&nbsp;</div>
            <div class="modal-footer">
                <button class="btn btn-primary" data-dismiss="modal">OK</button>
            </div>
        </div>
        <script type="text/javascript" language="javascript">
            var move;
            var send;
            $(document).ready(function() {
                var modalError = $("#modalError");
                var modalErrorBody = $("#modalErrorBody");
                var modalWaiting = $("#modalWaiting");
                var modalWaitingBody = $("#modalWaitingBody");
                var modalGameOver = $("#modalGameOver");
                var modalGameOverBody = $("#modalGameOverBody");
                var opponent = $("#opponent");
                var status = $("#status");
                var opponentUsername;
                var username = '<c:out value="${username}" />';
                var myTurn = false;

                $('.game-cell').addClass('span1');

                if(!("WebSocket" in window))
                {
                    modalErrorBody.text('WebSockets are not supported in this ' +
                            'browser. Try Internet Explorer 10 or the latest ' +
                            'versions of Mozilla Firefox or Google Chrome.');
                    modalError.modal('show');
                    return;
                }

                modalWaitingBody.text('Connecting to the server.');
                modalWaiting.modal({ keyboard: false, show: true });

                var server;
                try {
                    server = new WebSocket('ws://' + window.location.host +
                            '<c:url value="/ticTacToe/${gameId}/${username}">
                                <c:param name="action" value="${action}" />
                            </c:url>');
                } catch(error) {
                    modalWaiting.modal('hide');
                    modalErrorBody.text(error);
                    modalError.modal('show');
                    return;
                }

                server.onopen = function(event) {
                    modalWaitingBody
                            .text('Waiting on your opponent to join the game.');
                    modalWaiting.modal({ keyboard: false, show: true });
                };

                window.onbeforeunload = function() {
                    server.close();
                };

                server.onclose = function(event) {
                    if(!event.wasClean || event.code != 1000) {
                        toggleTurn(false, 'Game over due to error!');
                        modalWaiting.modal('hide');
                        modalErrorBody.text('Code ' + event.code + ': ' +
                                event.reason);
                        modalError.modal('show');
                    }
                };

                server.onerror = function(event) {
                    modalWaiting.modal('hide');
                    modalErrorBody.text(event.data);
                    modalError.modal('show');
                };

                server.onmessage = function(event) {
                    var message = JSON.parse(event.data);
                    if(message.action == 'gameStarted') {
                        if(message.game.player1 == username)
                            opponentUsername = message.game.player2;
                        else
                            opponentUsername = message.game.player1;
                        opponent.text(opponentUsername);
                        toggleTurn(message.game.nextMoveBy == username);
                        modalWaiting.modal('hide');
                    } else if(message.action == 'opponentMadeMove') {
                        $('#r' + message.move.row + 'c' + message.move.column)
                                .unbind('click')
                                .removeClass('game-cell-selectable')
                                .addClass('game-cell-opponent game-cell-taken');
                        toggleTurn(true);
                    } else if(message.action == 'gameOver') {
                        toggleTurn(false, 'Game Over!');
                        if(message.winner) {
                            modalGameOverBody.text('Congratulations, you won!');
                        } else {
                            modalGameOverBody.text('User "' + opponentUsername +
                                    '" won the game.');
                        }
                        modalGameOver.modal('show');
                    } else if(message.action == 'gameIsDraw') {
                        toggleTurn(false, 'The game is a draw. ' +
                                'There is no winner.');
                        modalGameOverBody.text('The game ended in a draw. ' +
                                'Nobody wins!');
                        modalGameOver.modal('show');
                    } else if(message.action == 'gameForfeited') {
                        toggleTurn(false, 'Your opponent forfeited!');
                        modalGameOverBody.text('User "' + opponentUsername +
                                '" forfeited the game. You win!');
                        modalGameOver.modal('show');
                    }
                };

                var toggleTurn = function(isMyTurn, message) {
                    myTurn = isMyTurn;
                    if(myTurn) {
                        status.text(message || 'It\'s your move!');
                        $('.game-cell:not(.game-cell-taken)')
                                .addClass('game-cell-selectable');
                    } else {
                        status.text(message ||'Waiting on your opponent to move.');
                        $('.game-cell-selectable')
                                .removeClass('game-cell-selectable');
                    }
                };

                move = function(row, column) {
                    if(!myTurn) {
                        modalErrorBody.text('It is not your turn yet!');
                        modalError.modal('show');
                        return;
                    }
                    if(server != null) {
                        server.send(JSON.stringify({ row: row, column: column }));
                        $('#r' + row + 'c' + column).unbind('click')
                                .removeClass('game-cell-selectable')
                                .addClass('game-cell-player game-cell-taken');
                        toggleTurn(false);
                    } else {
                        modalErrorBody.text('Not connected to came server.');
                        modalError.modal('show');
                    }
                };
                
            });
        </script>
    </body>
</html>
