<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<script src="/js/page-change.js"></script>
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
		<div>
			<table>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>조회수</th>
					<th>아이디</th>
					<th>작성일</th>
				</tr>
				<tr>
					<td>{{info.bbsNum}}</td>
					<td>{{info.title}}</td>
					<td>{{info.contents}}</td>
					<td>{{info.hit}}</td>
					<td>{{info.userId}}</td>
					<td>{{info.cdatetime}}</td>
				</tr>
			</table>
			<div>
				<button @click="fnEdit">수정</button>
			</div>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				bbsNum : "${map.bbsNum}",
				info : {}
            };
        },
        methods: {
			fnGetBbs() {
				let self = this;
				let nparmap = {
					bbsNum : self.bbsNum
				};
				$.ajax({
					url:"/bbs/view.dox",
					dataType:"json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.info = data.info;
					}
				});
			},

			fnEdit() {
				let self = this;
				pageChange("/bbs/edit.do", {bbsNum : self.bbsNum});
			}

        },
        mounted() {
			let self = this;
			self.fnGetBbs();
        }
    });
    app.mount('#app');
</script>