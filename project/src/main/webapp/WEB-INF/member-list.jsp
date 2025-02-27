<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<title>첫번째 페이지</title>
</head>
<style>
	table, tr, th, td {
		text-align: center;
	    border : 2px solid #bbb;
	    border-collapse: collapse;
	    padding : 5px;
	}
	
</style>
<body>
	<div id="app">
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>주소</th>
				<th>삭제</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.userId}}</td>
				<td>{{item.userName}}</td>
				<td>{{item.address}}</td>
				<td><button @click="fnRemove(item.userId)">삭제</button></td>
			</tr>
		</table>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : []
            };
        },
        methods: {
            fnMemberList : function(){
				let self = this;
				let nparmap = {};
				$.ajax({
					url:"/member/list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						self.list = data.list
					}
				});
            },
        
			fnRemove : function(userId) {
				let self = this;
				let nparmap = {
					userId : userId
				};
				$.ajax({
					url:"/member/remove.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						console.log(data);
						if(data.result == "success") {
							alert("삭제되었습니다!");
							self.fnMemberList();
						}
					}
				});
			}
		},
        mounted() {
           	let self = this;
			self.fnMemberList();
        }
    });
    app.mount('#app');
</script>