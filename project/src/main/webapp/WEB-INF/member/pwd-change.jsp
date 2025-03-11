<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<title>비밀번호 찾기</title>
</head>
<style>
</style>
<body>
	<div id="app">
        비밀번호 :
        <input v-model="pwd">
        <div>
            비밀번호 확인 :
            <input v-model="pwdCheck">
        </div>
        <button @click>수정</button>


	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                userId : "${map.userId}"
            };
        },
        methods: {
            fnChange() {
				let self = this;
				let nparmap = self.user;
				$.ajax({
					url:"/member/change-pwd.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
					}
				});
			}
        },
        mounted() {
            let self = this;
        }
    });
    app.mount('#app');
</script>