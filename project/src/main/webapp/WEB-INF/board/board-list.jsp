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
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.boardNo}}</td>
				<td>{{item.title}}</td>
				<td>{{item.userName}}</td>
				<td>{{item.cnt}}</td>
				<td>{{item.cdateTime}}</td>
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
			fnBoardList : function() {
				let self = this;
				let nparmap = {};
				$.ajax({
					url:"/board/list.dox",
					dataType:"json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						console.log(data);
					}
				});
			}

        },
        mounted() {
			this.fnBoardList();
        }
    });
    app.mount('#app');
</script>