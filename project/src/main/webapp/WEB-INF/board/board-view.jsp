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
</style>
<body>
	<div id="app">
		<div>
			제목 : {{info.title}}
		</div>	
		<div>
			내용 : {{info.contents}}
		</div>
		<div>
			조회수 : {{info.cnt}}
		</div>
		<div v-if="sessionId == info.userId || sessionStatus == 'A'">
			<button @click="fnEdit">수정</button>
			<button @click="fnRemove">삭제</button>
		</div>
		<!-- <div v-else-if="sessionId == 'admin'">
			<button @click="fnEdit">수정</button>
			<button @click="fnRemove">삭제</button>
		</div> -->
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                boardNo : "${map.boardNo}",
				info : {},
				sessionId : "${sessionId}",
				sessionStatus : "${sessionStatus}"
            };
        },
        methods: {
			fnGetBoard : function(){
				let self = this;
				let nparmap = {
					boardNo : self.boardNo,
					option : "SELECT"
				};
				$.ajax({
					url:"/board/info.dox",
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
				pageChange("/board/edit.do", {boardNo : self.boardNo});
			},

			fnRemove() {
				let self = this;
				let nparmap = {
					boardNo : self.boardNo,
				};
				$.ajax({
					url:"/board/delete.dox",
					dataType:"json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						alert("삭제되었습니다!");
						location.href = "/board/list.do";
					}
				});
			}

        },
        mounted() {
			let self = this;
			self.fnGetBoard();
        }
    });
    app.mount('#app');
</script>