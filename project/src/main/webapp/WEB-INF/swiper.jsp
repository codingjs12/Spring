<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8.4.7/swiper-bundle.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/swiper@8.4.7/swiper-bundle.min.js"></script>
	<title>swiper</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">슬라이드 1</div>
				<div class="swiper-slide">슬라이드 2</div>
				<div class="swiper-slide">슬라이드 3</div>
			</div>
			<div class="swiper-pagination"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</div>
		
</body>
</html>
<script>
	const app = Vue.createApp({
        data() {
            return {
				swiper : null
            };
        },
		
        methods: {
			
        },
        mounted() {
			let self = this
			let swiper = new Swiper('.swiper-container', {
				// 기본 옵션 설정
				loop: true, // 반복
				autoplay: {
					delay: 2500,
				},
				pagination: {
					el: '.swiper-pagination',
					clickable: true,
				},
				navigation: {
					nextEl: '.swiper-button-next',
					prevEl: '.swiper-button-prev',
				},
			});
        }
    });
    app.mount('#app');

</script>