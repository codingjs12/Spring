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
</style>
<body>
	<div id="app">
		<div>
			아이디 : <input v-model="user.userId">
			<button @click="fnCheck">중복체크</button>
		</div>
		<div>
			비밀번호 : <input v-model="user.password" type="password">
		</div>
		<div>
			이름 : <input v-model="user.userName">
		</div>
		<div>
			주소 : <input v-model="user.address">
			<button @click="fnSearchAddr">주소검색</button>
		</div>
		<div>
			회원 권한: 
			<label><input type="radio" v-model="user.status" value="C">일반</label>
			<label><input type="radio" v-model="user.status" value="A">관리자</label>
		</div>
		<button @click="fnInsert">가입</button>
	</div>
</body>
</html>
<script>

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn,
		bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
			window.vueObj.fnResult(roadFullAddr, roadAddrPart1, addrDetail, engAddr);
	}


    const app = Vue.createApp({
        data() {
            return {
                user : {
					userId : "",
					password : "",
					userName : "",
					address : "",
					status : "C"
				}
            };
        },
        methods: {
            fnInsert() {
				let self = this;
				let nparmap = self.user;
				$.ajax({
					url:"/member/add.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert("가입 성공");
						location.href="/member/login.do";
					}
				});
            },
			fnCheck() {
				let self = this;
				let nparmap = self.user;
				$.ajax({
					url:"/member/check.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if(data.result == "success") {
							alert("사용가능한 아이디입니다.");
						} else {
							alert("중복된 아이디입니다.");
						}
					}
				});
			},
			fnSearchAddr() {
				//팝업으로 addr.do를 호출
				window.open("/member/addr.do", "addr", "width=500, height=500");

			},
			fnResult(roadFullAddr, roadAddrPart1, addrDetail, engAddr) {
				let self = this;
				self.user.address = roadFullAddr;
			}
        },
        mounted() {
            let self = this;
			window.vueObj = this;
        }
    });
    app.mount('#app');
</script>