<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <script src="/js/page-change.js"></script>
    <title>쇼핑몰 헤더</title>
    <link rel="stylesheet" href="../css/header.css">
    <style>
        
    </style>
</head>

<body>
    <div id="header">
        <header>
            <!-- 로고 -->
            <div class="logo">
                <a href="/product/list.do">
                    <img src="https://mblogthumb-phinf.pstatic.net/MjAyMjEyMTVfMTg4/MDAxNjcxMDkwNTc1ODM5.72xNKr7Hvw77FSfnoIFYYCoRneDoxXIH5jqXXA3T5v8g.5rfVNPZ9_DVsOO4sDPenHZ7L_e6kYh1SHUkzqRjjnL4g.PNG.y2kwooga/%EB%84%A4%EC%9D%B4%EB%B2%84_AI-18.png?type=w800" alt="쇼핑몰 로고">
                </a>
            </div>

            <!-- 네비게이션 메뉴 -->
            <nav>
                <ul>
                    <li class="dropdown" v-for="main in mainList">
                        <a class="link" href="#">{{main.menuName}}</a>
                        <ul class="dropdown-menu" v-if="main.subCnt > 0">
                            <template v-for="sub in subList">
                                <li v-if="main.menuId == sub.parentId"><a href="#">{{sub.menuName}}</a></li>
                            </template>
                        </ul>
                    </li>
                    <!-- <li class="dropdown">
                        <a class="link" href="#">한식</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">비빔밥</a></li>
                            <li><a href="#">김치찌개</a></li>
                            <li><a href="#">불고기</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="link" href="#">중식</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">짜장면</a></li>
                            <li><a href="#">짬뽕</a></li>
                            <li><a href="#">마파두부</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="link" href="#">양식</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">피자</a></li>
                            <li><a href="#">파스타</a></li>
                            <li><a href="#">스테이크</a></li>
                        </ul>
                    </li>
                    <li><a class="link" href="#">디저트</a></li>
                    <li><a class="link" href="#">음료</a></li> -->
                </ul>
            </nav>

            <!-- 검색 바 -->
            <div class="search-bar">
                <input type="text" placeholder="상품을 검색하세요..." v-model="keyword">
                <button @click="fnSearch">검색</button>
            </div>

            <!-- 로그인 버튼 -->
            <div class="login-btn">
                <a href="/member/login.do"><button>로그인</button></a>
            </div>
        </header>
    </div>

    <script>
        const header = Vue.createApp({
            data() {
                return {
                    mainList: [],
                    subList: [],
                    keyword : ""
                };
            },
            methods: {
                fnMenuList() {
                    let self = this;
                    let nparmap = {

                    };
                    $.ajax({
                        url: "/menu.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            console.log(data);
                            self.mainList = data.mainList;
                            self.subList = data.subList;
                        }
                    });
                },
                fnSearch() {
                    let self = this;
                    app._component.methods.fnProductList(self.keyword);

                    
                }
            },
            

            mounted() {
                let self = this;
                self.fnMenuList();
            }
        });
        header.mount('#header');
    </script>
</body>

</html>