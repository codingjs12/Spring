<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세보기</title>
    <link rel="stylesheet" href="../css/product-style.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <script src="/js/page-change.js"></script>
</head>
<body>
    <div id="app">
        <jsp:include page="../common/header.jsp"/>
        <main>
            <section class="product-view">
                <!-- AJAX로 가져온 상품 상세 정보 표시 -->
                <div>
                    <img :src="product.filePath" alt="상품 이미지">
                    <h1>{{product.itemName}}</h1>
                    <p>{{product.itemInfo}}</p>
                    <p class="price">₩{{product.price}}</p>
                    <!-- 추가 정보가 있다면 여기에 표시 -->
                    <button @click="goBack">뒤로가기</button>
                </div>
                <div>
                    <p>상품 정보를 불러오는 중입니다...</p>
                </div>
            </section>
        </main>
    </div>
    
    <script>
        const app = Vue.createApp({
            data() {
                return {
                    product: "",
                    itemNo: "${map.itemNo}",
                };
            },
            methods: {
                fnProductView() {
                    let self = this;
                    let nparmap = {
                        itemNo : self.itemNo
                    }
                    $.ajax({
                        url: "/product/view.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: (data) => {
                            console.log(data);
                            self.product = data.product;
                        }
                    });
                }
            },
            mounted() {
                let self = this;
                self.fnProductView();
            }
        });
        app.mount('#app');
    </script>
</body>
</html>