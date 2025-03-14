<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <link rel="stylesheet" href="../css/product-style.css">

	<title>첫번째 페이지</title>
    <style>
    </style>
</head>
<style>
</style>
<body>
    <jsp:include page="../common/header.jsp"/>
	<div id="app">
        <div>
            제품명 :
            <input v-model="pro.itemName">
        </div>
        <div>
            가격 :
            <input v-model="pro.price">
        </div>
        <div>
            제품 설명 :
            <input v-model="pro.itemInfo">
        </div>
        <div>
            썸네일 : <input type="file" id="thumbFile" name="thumbFile">
        </div>
        <div>
            설명 : <input type="file" id="file1" name="file1" multiple>
        </div>
        <button @click="fnInsert">제품 등록</button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                pro : {
                    itemNo : "",
                    itemName : "",
                    price : "",
                    itemInfo : ""
                }
            };
        },
        methods: {
            fnInsert() {
				let self = this;
				let nparmap = self.pro;

				$.ajax({
					url:"/product/add.dox",
					dataType:"json",
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
                        if($("#file1")[0].files.length > 0 && $("#thumbFile")[0].files[0]) {
							let form = new FormData();
	            			form.append("file1", $("#thumbFile")[0].files[0]);
	            			for(let i = 0; i <$("#file1")[0].files.length; i++) {
								form.append("file1", $("#file1")[0].files[i]);
							}
							
							form.append("itemNo", data.itemNo); // pk

	            			self.upload(form);
                        } else {
                            location.href="/product/list.do";
                        }
						
					}
				});
            },

            upload(form) {
                let self = this;
	            $.ajax({
		            url : "/product/fileUpload.dox",
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