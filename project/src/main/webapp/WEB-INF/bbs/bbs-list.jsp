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

	.bgcolor-gray {
		background-color: gray;
	}

	.color-blue {
		color: blue;
	}

	.color-black {
		color: black;
	}

</style>
<body>
	<div id="app">
		<div>
            <select v-model="searchOption">
                <option value="all">:: 전체 ::</option>
                <option value="title">제목</option>
                <option value="contents">내용</option>
            </select>
            <input v-model="keyword" @keyup.enter="fnList" placeholder="검색어">
            <button @click="fnList">검색</button>
        </div>
		<div>
			<table>
				<tr>
					<th>선택</th>
					<th>글번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>조회수</th>
					<th>아이디</th>
					<th>작성일</th>
				</tr>
				<tr v-for="item in list">
					<td><input type="radio" :value="item.bbsNum" v-model="checked"></td>
					<td>{{item.bbsNum}}</td>
					<td><a @click="fnView(item.bbsNum)" href="javascript:;">{{item.title}}</a></td>
					<td>{{item.contents}}</td>
					<td>{{item.hit}}</td>
					<td>{{item.userId}}</td>
					<td>{{item.cdatetime}}</td>
				</tr>
			</table>
		</div>
		<div>
            <a id="index" href="javascript:;" v-for="num in index" @click="fnPage(num)">
                <span v-if="page == num" class="bgcolor-gray color-blue">{{num}}</span>
                <span v-else class="color-black">{{num}}</span>
            </a>
        </div>
		<div>
			<button @click="fnAdd">글쓰기</button>
			<button @click="fnRemove">삭제</button>
		</div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                list : [],
				checked : "",
				keyword : "",
                searchOption : "all",
				pageSize : 5,
                index : 0,
                page: 1
            };
        },
        methods: {
			fnList() {
				let self = this;
				let nparmap = {
                    keyword : self.keyword,
                    searchOption : self.searchOption,
                    pageSize : self.pageSize,
                    page : (self.page - 1) * self.pageSize
				};
				$.ajax({
					url:"/bbs/list.dox",
					dataType:"json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.list = data.list;
						self.index = Math.ceil(data.count / self.pageSize);
					}
				});
			},

			fnAdd() {
				"/bbs/add.do";
			},

			fnRemove() {
				let self = this;
				let nparmap = {
					checked : self.checked
				};
				$.ajax({
					url:"/bbs/remove.dox",
					dataType:"json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						alert("삭제되었습니다.");
						self.fnList();
					}
				});
			},

			fnView(bbsNum) {
				pageChange("/bbs/view.do", {bbsNum : bbsNum});
			},

			fnPage(num) {
                let self = this;
                self.page = num;
                self.fnList();
            }

        },
        mounted() {
			let self = this;
			self.fnList();
        }
    });
    app.mount('#app');
</script>