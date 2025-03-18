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
			<input v-model="user.phoneNumber" placeholder="번호 입력">
			<button @click="fnSmsAuth">문자인증</button>
		</div>
		<div v-if="authFlg">
			<div v-if="joinFlg" style="color : red;">
				문자 인증 완료!
			</div>
			<div v-else>
				<input v-model="authInputNum" :placeholder="timer">
				<button @click="fnNumAuth">인증</button>
			</div>
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
					status : "C",
					phoneNumber : ""
				},
				authNum : "", // 서버 생성 랜덤 숫자
				authInputNum : "", // 사용자 입력 숫자
				authFlg : false, // 인증 번호 입력 상태
				joinFlg : false, // 문자 인증 완료 상태
				timer : "",
				count : 180
            };
        },
        methods: {
            fnInsert() {
				let self = this;
				let nparmap = self.user;

				/*if(self.joinFlg == false) {
					alert("문자 인증을 먼저 해주세요.");
					return;
				} */

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
			},

			fnSmsAuth() {
				let self = this;
				let nparmap = {
					phoneNumber : self.user.phoneNumber
				};
				$.ajax({
					url:"/send-one",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						if(data.response.statusCode == 2000) {
							alert("문자 발송 완료!");
							self.authNum = data.ranStr;
							self.authFlg = true;
							setInterval(self.fnTimer, 1000);
						} else {
							alert("잠시 후 다시 시도 해주세요.");
						}
					}
				});
			},

			fnNumAuth() {
				let self = this;
				if(self.authNum == self.authInputNum) {
					alert("인증되었습니다!");
					self.joinFlg = true;
				} else {
					alert("인증번호를 다시 확인해주세요.");
				}
			},

			fnTimer() {
				let self = this;
				let min = "";
				let sec = "";
				
				min = parseInt(self.count / 60);
				sec = parseInt(self.count % 60);

				min = min < 10 ? "0" + min : min;
				sec = sec < 10 ? "0" + sec : sec;
                
				self.timer = min + " : " + sec;
				self.count--;
			}

        },
        mounted() {
            let self = this;
			window.vueObj = this;
        }
    });
    app.mount('#app');
</script>