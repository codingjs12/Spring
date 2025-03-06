<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <script src="/js/page-change.js"></script>
	<title>첫번째 페이지</title>
    <style>
		table, tr, td, th{
			border : 1px solid black;
			border-collapse : collapse;
			padding : 5px 10px;
			text-align : center;		
		}
	</style>
</head>
<style>
</style>
<body>
	<div id="app">
		<table>
            <tr>
                <th>교수번호</th>
                <th>이름</th>
                <th>ID</th>
                <th>직급</th>
                <th>월급</th>
                <th>고용일</th>
                <th>보너스</th>
                <th>과번</th>
                <th>이메일</th>
                <th>홈페이지</th>
            </tr>
            <tr v-for="item in list">
                <td>{{item.profno}}</td>
                <td>
                   {{item.name}}
                </td>
                <td>
                    {{item.id}}
                </td>
                <td>{{item.position}}</td>
                <td>{{item.pay}}</td>
                <td>{{item.hiredate}}</td>
                <td>{{item.bonus}}</td>
                <td>{{item.deptno}}</td>
                <td>{{item.email}}</td>
                <td>{{item.hpage}}</td>
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
            fnProList() {
				let self = this;
				let nparmap = {

                };
				$.ajax({
					url:"/pro/list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
                        self.list = data.list;
					}
				});
            }

        }, // methods
        mounted() {
            let self = this;
            self.fnProList();
        }
    });
    app.mount('#app');
</script>