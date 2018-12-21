<%@ include file="/ssi/ssi.jsp"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>

<%--@elvariable id="pendingGames" type="java.util.Map<long, java.Lang.String>"--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Game Site :: Tic Tac Toe</title>
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    </head>
    <body>
        <h2>Tic Tac Toe</h2>
        <a href="javascript:void 0;" onclick="startGame();">Start a Game</a><br />
        <br />
        <c:choose>
            <c:when test="${fn:length(pendingGames) == 0}">
                <i>There are no existing games to join.</i>
            </c:when>
            <c:otherwise>
                Join a game waiting for a second player:<br />
                <c:forEach items="${pendingGames}" var="e">
                    <a href="javascript:void 0;" onclick="joinGame(${e.key});">User: ${e.value}</a><br />
                </c:forEach>
            </c:otherwise>
        </c:choose>

<!-- --------------------------------------------------------------------------------------------------------- -->
        <script type="text/javascript" language="javascript">
            var startGame, joinGame;
            $(document).ready(function() {
                var url = '<c:url value="/ticTacToe"/>';

                startGame = function() {
                    var username = prompt('Enter a username to start a game.', '${sessionScope.nicname}');
                    if(username != null && username.trim().length > 0 &&
                            validateUsername(username))
                        post({action: 'start', username: username}); //ë¬¸ì ë¶ë¶ ìì
                };

                joinGame = function(gameId) {
                    var username =
                            prompt('Enter a username to join this game.', '${sessionScope.nicname}');
                    if(username != null && username.trim().length > 0 &&
                            validateUsername(username))
                        post({action: 'join', username: username, gameId: gameId});
                };

                var validateUsername = function(username) {
                    var valid = username.match(/^[a-zA-Z0-9_]+$/) != null;
                    if(!valid)
                        alert('User names can only contain letters, numbers ' +
                                'and underscores.');
                    return valid;
                };

                var post = function(fields) {
                    var form = $('<form id="mapForm" method="post"></form>')
                            .attr({ action: url, style: 'display: none;' });
                    for(var key in fields) {
                        if(fields.hasOwnProperty(key))
                            form.append($('<input type="hidden">').attr({
                                name: key, value: fields[key]
                            }));
                    }
                    $('body').append(form);
                    form.submit();
                };
            });
        </script>
        
                    <!-- 로그인한 상태일 경우와 비로그인 상태일 경우의 chat_id설정 -->
    <c:choose>
    <c:when test="${empty sessionScope.nicname }">
        <input type="hidden" value='<%=session.getId().substring(0, 6)%>'
            id='chat_id' />
    </c:when>
    <c:otherwise>
        <input type="hidden" value='${sessionScope.nicname }' id='chat_id' />
    </c:otherwise>    
    </c:choose>
    <!--     채팅창 -->
    <div id="_chatbox" style="display: inline">
        <fieldset>
            <div id="messageWindow"  style="overflow:auto; width:1000px; height:350px; 
            padding:10px; background-color:gold;"></div>
            <br /> <input id="inputMessage" type="text" onkeyup="enterkey()" />
            <input type="submit" value="send" onclick="send()" />
        </fieldset>
    </div>
    <img class="chat" src="./img/chat.png" />

<!-- 챗 스타트 -->
<!-- 말풍선아이콘 클릭시 채팅창 열고 닫기 -->
	<script>
	    $(".chat").on({
	        "click" : function() {
	            if ($(this).attr("src") == "./img/chat.png") {
	                $(".chat").attr("src", "./img/chathide.png");
	                $("#_chatbox").css("display", "block");
	            } else if ($(this).attr("src") == "./img/chathide.png") {
	                $(".chat").attr("src", "./img/chat.png");
	                $("#_chatbox").css("display", "none");
	            }
	        }
	    });
	</script>
	<script type="text/javascript">
	    var textarea = document.getElementById("messageWindow");
	    var webSocket = new WebSocket('ws://172.16.3.13:8000/game/ticTacToe');
	    var inputMessage = document.getElementById('inputMessage');
	    webSocket.onerror = function(event) {
	        onError(event)
	    };
	    webSocket.onopen = function(event) {
	        onOpen(event)
	    };
	    webSocket.onmessage = function(event) {
	        onMessage(event)
	    };
	    function onMessage(event) {
	        var message = event.data.split("|");
	        var sender = message[0];
	        var content = message[1];
	        if (content == "") {
	            
	        } else {
	            if (content.match("/")) {
	                if (content.match(("/" + $("#chat_id").val()))) {
	                    var temp = content.replace("/" + $("#chat_id").val(), "(귓속말) :").split(":");
	                    if (temp[1].trim() == "") {
	                    } else {
	                        $("#messageWindow").html($("#messageWindow").html() + "<p class='whisper'>"
	                            + sender + content.replace("/" + $("#chat_id").val(), "(귓속말) :") + "</p>");
	                    }
	                } else {
	                }
	            } else {
	                if (content.match("!")) {
	                    $("#messageWindow").html($("#messageWindow").html()
	                        + "<p class='chat_content'><b class='impress'>" + sender + " : " + content + "</b></p>");
	                } else {
	                    $("#messageWindow").html($("#messageWindow").html()
	                        + "<p class='chat_content'>" + sender + " : " + content + "</p>");
	                }
	            }
	        }
	    }
	    function onOpen(event) {
	        $("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다.</p>");
	    }
	    function onError(event) {
	        alert(event.data);
	    }
	    function send() {
	        if (inputMessage.value == "") {
	        } else {
	            $("#messageWindow").html($("#messageWindow").html()
	                + "<p class='chat_content'>나(" + $("#chat_id").val() + ") : " +  inputMessage.value + "</p>");
	        }
	        webSocket.send($("#chat_id").val() + "|" + inputMessage.value);
	        inputMessage.value = "";
	    }
	    //     엔터키를 통해 send함
	    function enterkey() {
	        if (window.event.keyCode == 13) {
	            send();
	        }
	    }
	    //     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
	    window.setInterval(function() {
	        var elem = document.getElementById('messageWindow');
	        elem.scrollTop = elem.scrollHeight;
	    }, 0);
	</script>

        <!-- 쳇 끝 -->
        
        
    </body>
</html>
