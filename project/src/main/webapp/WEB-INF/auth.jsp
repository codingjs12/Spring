<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
        <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
        <title>인증</title>
    </head>

    <style>
    </style>

    <body>
        <div id="app">
            <button @click="fnAuth()">인증</button>
        </div>
    </body>

</html>
    <script>
        const userCode = "imp08144162";
        IMP.init(userCode);
        const app = Vue.createApp({
            data() {
                return {

                };
            },
            methods: {
                fnAuth() {
                    IMP.certification({
                    channelKey: "channel-key-56d9dabc-9665-4490-addd-b985845d5902",
                    merchant_uid: "merchant_"+new Date().getTime(),
                    }, function(rsp){
                        console.log(rsp);
                        if(rsp.success) {
                            alert("인증성공");
                            console.log(rsp);
                        } else {
                            alert(rsp.error_msg);
                            console.log(rsp);
                        }

                    }
                    );
                }
            },
            mounted() {

            }
        });
        app.mount('#app');
    </script>