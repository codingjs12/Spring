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
		시·도 :
		<select v-model="si" @change="fnSelectSi">
			<option value="">::선택::</option>
			<option v-for="item in siList">{{item.si}}</option>
		</select>
		시·군·구 :
		<select v-model="gu" @change="fnSelectGu">
			<option value="">::선택::</option>
			<option v-for="item in guList">{{item.gu}}</option>
		</select>
		동 :
		<select v-model="dong" @change="fnSelectDong">
			<option value="">::선택::</option>
			<option v-for="item in dongList">{{item.dong}}</option>
		</select>

		
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                si : "",
				gu : "",
				dong : "",
				siList : [],
				guList : [],
				dongList : []
            };
        },
        methods: {
			fnGetSi() {
				let self = this;
				let nparmap = {};
				$.ajax({
					url:"area/si.dox",
					dataType:"json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.siList = data.siList;
					}
				});
			},

			fnGetGu() {
				let self = this;
				let nparmap = {};
				$.ajax({
					url:"area/gu.dox",
					dataType:"json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.guList = data.guList;
					}
				});
			},

			fnGetDong() {
				let self = this;
				let nparmap = {};
				$.ajax({
					url:"area/dong.dox",
					dataType:"json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.dongList = data.dongList;
					}
				});
			},
			
			fnSelectSi() {
				
			},
	
			fnSelectGu(value) {
				let paramSi = document.querySelector("#si").value
				location.href = "?paramSi=" + paramSi + "&paramGu=" + value;
			},
	
			apiCall() {
				let xhr = new XMLHttpRequest();
				let url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
				let queryParams = '?' + encodeURIComponent('serviceKey') + '='+'O5%2BkPtLkpnsqZVmVJiYW7JDeWEX4mC9Vx3mq4%2FGJs%2Fejvz1ceLY%2B0XySUsy15P%2BhpAdHcZHXHhdn4htsTUuvpA%3D%3D'; /*Service Key*/
				queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
				queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
				queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('XML'); /**/
				queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20210628'); /**/
				queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('0600'); /**/
				queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('55'); /**/
				queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('127'); /**/
				xhr.open('GET', url + queryParams);
				xhr.onreadystatechange = function () {
			   		if (this.readyState == 4) {
		        	alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
		    		}
				};

				xhr.send('');
			}

        },
        mounted() {
			let self = this;
			self.fnGetSi();
			self.fnGetGu();
			self.fnGetDong();
        }
    });
    app.mount('#app');
</script>