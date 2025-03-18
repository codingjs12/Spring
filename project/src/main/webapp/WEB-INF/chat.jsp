<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>



    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        #chatBox {
            width: 80%;
            max-width: 600px;
            height: 300px;
            border: 1px solid #ccc;
            overflow-y: auto;
            margin: 20px auto;
            padding: 10px;
            background: #f9f9f9;
        }
        input {
            width: 70%;
            padding: 10px;
            margin: 10px;
        }
        button {
            padding: 10px 15px;
            cursor: pointer;
            background-color: #007bff;
            color: white;
            border: none;
        }
    </style>
</head>
<body>
    <div id="app">

    
        <h2>채팅</h2>
        <div id="chatBox"></div>
        <input type="text" id="message" placeholder="메시지를 입력하세요..." @keyup.enter="handleKeyPress(event)">
        <button @click="sendMessage">전송</button>
    </div>

    <script>

        const app = Vue.createApp({
            data() {
                return {
                    sessionId : "${sessionId}"
                };
            },
            methods: {
                fnChat(){
                    let self = this;
                    let nparmap = {
                        sessionId : self.sessionId
                    };
                    $.ajax({
                        url:"member/list.dox",
                        dataType:"json",	
                        type : "POST", 
                        data : nparmap,
                        success : function(data) {
                            console.log(data);
                        }
                    });
                },
                // WebSocket 연결 함수
                connect() {
                    let socket = new SockJS('/ws-chat'); // WebSocket 엔드포인트
                    let self = this;
                    stompClient = Stomp.over(socket);
                    stompClient.connect({}, function (frame) {
                        console.log("WebSocket 연결 성공: " + frame);
        
                        // 서버에서 메시지를 받을 구독 설정
                        stompClient.subscribe('/topic/public', function (message) {
                            self.showMessage(JSON.parse(message.body));
                        });
                    }, function (error) {
                        console.error("WebSocket 연결 실패: ", error);
                    });
                },
                // 메시지 전송 함수
                sendMessage() {
                    let messageContent = document.getElementById("message").value;
                    if (stompClient && messageContent.trim() !== "") {
                        let chatMessage = { content: messageContent };
                        stompClient.send("/app/sendMessage", {}, JSON.stringify(chatMessage));
                        document.getElementById("message").value = "";
                    }
                },
                // 메시지 출력 함수
                showMessage(message) {
                    let chatBox = document.getElementById("chatBox");
                    let messageElement = document.createElement("p");
                    messageElement.textContent = message.content;
                    chatBox.appendChild(messageElement);
        
                    // 최신 메시지로 스크롤
                    chatBox.scrollTop = chatBox.scrollHeight;
                },
                // 엔터 키로 메시지 전송
                handleKeyPress(event) {
                    if (event.key === "Enter") {
                        sendMessage();
                    }
                }



    
            },
            mounted() {
                let stompClient = null;

                // 페이지 로드 시 WebSocket 연결
                window.onload = this.connect;
                
            }
        });
        app.mount('#app');


       
    </script>
</body>
</html>