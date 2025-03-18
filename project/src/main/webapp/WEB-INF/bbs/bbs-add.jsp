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
			제목 : <input v-model="title">
		</div>
		<div>
			내용 : <input v-model="contents">
		</div>
		파일 업로드 : <input type="file" id="file1" name="file1" multiple>
		<div>
			<button @click="fnAdd">저장</button>
		</div>

	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				title : self.title,
				contents : self.contents,
				sessionId : "${sessionId}",
				bbsNum : self.bbsNum
            };
        },
        methods: {
			fnAdd() {
				let self = this;
				let nparmap = {
					title : self.title,
					contents : self.contents,
					sessionId : self.sessionId,
					
				};
				$.ajax({
					url:"/bbs/add.dox",
					dataType:"json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						if($("#file1")[0].files.length > 0) {
							let form = new FormData();
	            			for(let i = 0; i <$("#file1")[0].files.length; i++) {
								form.append("file1", $("#file1")[0].files[i]);
							}
							
							form.append("bbsNum", data.bbsNum); // pk

	            			self.upload(form);
                        } else {
							alert("에러!!");
                        }
						console.log(data);
						alert("저장되었습니다!");
					}
				});
			},

			upload(form) {
                let self = this;
	            $.ajax({
		            url : "/bbs/fileUpload.dox",
	                type : "POST",
	                processData : false,
	                contentType : false,
	                data : form,
	                success: function(response) { 
                        alert("저장되었습니다.");
	                }	           
                });
            }
        },
        mounted() {
			let self = this;

        }
    });
    app.mount('#app');
</script>