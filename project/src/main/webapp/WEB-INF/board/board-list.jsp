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
	a {
		text-decoration: none;
	}

</style>
<body>
	<div id="app">
		<div>
			<select v-model="searchOption">
				<option value="all">:: 전체 ::</option>
				<option value="title">제목</option>
				<option value="name">작성자</option>
			</select>
			<input v-model="keyword" @keyup.enter="fnBoardList" placeholder="검색어">
			<button @click="fnBoardList">검색</button>
		</div>
		<table>
			<tr>
				<th><input type="checkbox" @click="fnAllCheck"></th>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<tr v-for="item in list">
				<td><input type="checkbox" :value="item.boardNo" v-model="selectList"></td>
				<td>{{item.boardNo}}</td>
				<td>
					<a href="javascript:;" @click="fnView(item.boardNo)">{{item.title}}</a>
				</td>
				<td>
					<a href="javascript:;" v-if="sessionId == item.userId || sessionStatus == 'A'" @click="fnGetUser(item.userId)">
						{{item.userName}}
					</a>
					<a v-else>
						{{item.userName}}
					</a>
				</td>
				<td>{{item.cnt}}</td>
				<td>{{item.cdateTime}}</td>
			</tr>
		</table>
		<button @click="fnAdd">글쓰기</button>
		<button @click="fnRemove">삭제</button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                list : [],
				keyword : "",
				searchOption : "all",
				sessionId : "${sessionId}",
				sessionStatus : "${sessionStatus}",
				selectList : [],
				checked : false
            };
        },
        methods: {
			fnBoardList() {
				let self = this;
				let nparmap = {
					keyword : self.keyword,
					searchOption : self.searchOption
				};
				$.ajax({
					url:"/board/list.dox",
					dataType:"json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.list = data.list;
					}
				});
			},
			
			fnAdd() {
				location.href="/board/add.do"
			},

			fnView(boardNo) {
				pageChange("/board/view.do", {boardNo : boardNo});
			},

			fnGetUser(userId) {
				let self = this;
				let nparmap = {
					userId : userId
				};
				$.ajax({
					url:"/member/get.dox",
					dataType:"json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
					}
				});
			},
			
			fnRemove() {
				let self = this;
				let nparmap = {
					selectList : JSON.stringify(self.selectList)
				};
				$.ajax({
					url:"/board/remove-list.dox",
					dataType:"json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						alert("삭제되었습니다!!!");
						self.fnBoardList();
					}
				});
			},

			fnAllCheck() {
				let self = this;
				self.checked = !self.checked;
				if(self.checked) {
					for(let i = 0; i < self.list.length; i++) {
						self.selectList.push(self.list[i].boardNo);
					}
				} else {
					self.selectList = [];
				}
			}

        },
        mounted() {
			let self = this;
			this.fnBoardList();
        }
    });
    app.mount('#app');
</script>