<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!--부트스트랩-->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <!--제이쿼리-->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
<style>
	#wrapChat{
		width : 800px;
		height: 500px;
		margin:auto;
		padding : 1%;
	}
	input[type="text"]{
		width:700px;
	}
	textarea{
		width:700px;
		background:lavender;
		border: 1px solid lightgray;
	}
</style>
</head>
<body>

    <!-- 웹소켓 테스트... -->
	<div id="wrapChat">
		<p style="font-size: 30px;"> 채팅창 </p>
<textarea rows="7"  id="msgArea">
</textarea>
		<br>
		<br>
		메시지 : <input type="text" class="form-control" id="chatMsg" >
		<br> 상대 아이디 : <input type="text" class="form-control" id="targetUser" >
		<br>
		
		<input type="button" class="btn btn-warning" value="전송" id="btnSend" >
	</div>
	
	<script>
		var ws;
		var userid='${loginUser.userId}';
		
		function connect(){
			//웹소켓 객체 생성하는 부분
			//핸들러 등록(연결 생성, 메시지 수신, 연결 종료)
			
			//url 연결할 서버의 경로
			ws = new WebSocket("ws://localhost:8888/hotspot/chat.go/websocket");
			
			ws.onopen = function(){
				console.log('연결 생성');
				register();
			};
			ws.onmessage = function(e){
				console.log('메시지 받음');
				var data = e.data;
				//alert("받은 메세지:"+data);
				addMsg(data);
			};
			ws.onclose = function(){
				console.log('연결 끊김');
			};
		}
		
		function addMsg(msg){	//원래 채팅 메시지에 방금 받은 메시지 더해서 설정
			var chat = $('#msgArea').val();
			chat = chat + "\n상대방 : " + msg;
			$('#msgArea').val(chat);
		}
		
		function register(){	//메시지 수신을 위한 서버에 id 등록하기
			var msg = {
				type : "register",
				userid : '${loginUser.userId}'
			};
			ws.send(JSON.stringify(msg));
		}
		
		function sendMsg(){
			//var msg = $("#chatMsg").val();
			//ws.send(userid + " : " + msg);
			
			var msg = {
					type : "chat",
					target : $("#targetUser").val(),
					message : $("#chatMsg").val()
			};
			ws.send(JSON.stringify(msg));
		};
		
		//페이지가 로딩되면 connect 실행
		$(function(){
			connect();
			$('#btnSend').on("click", function(){
				var chat = $("#msgArea").val();
				chat = chat + "\n나 : " + $("#chatMsg").val();
				$("#msgArea").val(chat);
				sendMsg();
				$("#chatMsg").val("");
			})
		});
	
	</script>

</body>
</html>