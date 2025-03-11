<%-- header.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<header>
    <div class="logo">
        <%-- 로고 이미지 또는 텍스트 --%>
    </div>

    <nav>
        <ul>
            <li class="dropdown">
                <a href="#">한식</a>
                <ul class="dropdown-menu">
                    <li><a href="#">비빔밥</a></li>
                    <li><a href="#">김치찌개</a></li>
                    <li><a href="#">불고기</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#">중식</a>
                <ul class="dropdown-menu">
                    <li><a href="#">짜장면</a></li>
                    <li><a href="#">짬뽕</a></li>
                    <li><a href="#">마파두부</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#">양식</a>
                <ul class="dropdown-menu">
                    <li><a href="#">피자</a></li>
                    <li><a href="#">파스타</a></li>
                    <li><a href="#">스테이크</a></li>
                </ul>
            </li>
            <li><a href="#">디저트</a></li>
            <li><a href="#">음료</a></li>
        </ul>
    </nav>
    <div class="search-bar">
        <input type="text" placeholder="상품을 검색하세요...">
        <button>검색</button>
    </div>
    <div class="login-btn">
        <button>로그인</button>
    </div>
</header>