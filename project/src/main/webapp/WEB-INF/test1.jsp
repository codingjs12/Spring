<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<title></title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>
			<input id="itemNo" v-model="itemNo">
			<button @click="fnRemove">삭제</button>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                itemNo : ""
            };
        },
        methods: {
			fnRemove : function(){
				let self = this;
				let nparmap = {
					itemNo : self.itemNo
				};
				$.ajax({
					url:"product/remove.dox",
					dataType:"json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if(data.result == "success") {
							alert("삭제 완료");
						}
					}
				});
			}

        },
        mounted() {
			
        }
    });
    app.mount('#app');
</script>