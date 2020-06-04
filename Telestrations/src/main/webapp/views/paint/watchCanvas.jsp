<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie-edge">
    <link rel="stylesheet" href="/css/send.css">
    <link rel="stylesheet" href="/css/canvas_styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.2.6/gsap.min.js"></script>
    <title>PaintJS</title>
</head>
<body>
	<p style="font-size: 2rem; margin : 2rem auto; letter-spacing: 3px;">SSAFY TELESTRATIONS</p>

    <!-- <canvas id="jsCanvas" class="canvas"></canvas> -->
    <img alt="${pictureSource}" src="../../resources/picture/test.png">
    <!-- 
	
	 -->
	 	
	 	<p class ="stag" id="note" style="margin : 20px;">그림을 보고 정답을 맞춰보세요</p>
	 	<input type="text" class ="stag" id="answer" style="margin-bottom : 20px;" value="">
			<button class="button">
			    <span class="default">Send</span>
			    <span class="success">
			        <svg viewBox="0 0 16 16">
			            <polyline points="3.75 9 7 12 13 5"></polyline>
			        </svg>Sent
			    </span>
			    <svg class="trails" viewBox="0 0 33 64">
			        <path d="M26,4 C28,13.3333333 29,22.6666667 29,32 C29,41.3333333 28,50.6666667 26,60"></path>
			        <path d="M6,4 C8,13.3333333 9,22.6666667 9,32 C9,41.3333333 8,50.6666667 6,60"></path>
			    </svg>
			    <div class="plane">
			        <div class="left"></div>
			        <div class="right"></div>
			    </div>
			</button>
	


<!-- twitter / dribbble -->
<a class="dribbble" href="https://dribbble.com/ai" target="_blank"><img src="https://dribbble.com/assets/logo-small-2x-9fe74d2ad7b25fba0f50168523c15fda4c35534f9ea0b1011179275383035439.png" alt=""></a>
<a class="twitter" target="_blank" href="https://twitter.com/aaroniker_me"><svg xmlns="http://www.w3.org/2000/svg" width="72" height="72" viewBox="0 0 72 72"><path d="M67.812 16.141a26.246 26.246 0 0 1-7.519 2.06 13.134 13.134 0 0 0 5.756-7.244 26.127 26.127 0 0 1-8.313 3.176A13.075 13.075 0 0 0 48.182 10c-7.229 0-13.092 5.861-13.092 13.093 0 1.026.118 2.021.338 2.981-10.885-.548-20.528-5.757-26.987-13.679a13.048 13.048 0 0 0-1.771 6.581c0 4.542 2.312 8.551 5.824 10.898a13.048 13.048 0 0 1-5.93-1.638c-.002.055-.002.11-.002.162 0 6.345 4.513 11.638 10.504 12.84a13.177 13.177 0 0 1-3.449.457c-.846 0-1.667-.078-2.465-.231 1.667 5.2 6.499 8.986 12.23 9.09a26.276 26.276 0 0 1-16.26 5.606A26.21 26.21 0 0 1 4 55.976a37.036 37.036 0 0 0 20.067 5.882c24.083 0 37.251-19.949 37.251-37.249 0-.566-.014-1.134-.039-1.694a26.597 26.597 0 0 0 6.533-6.774z"></path></svg></a>
<script src="/js/send.js "></script>
	<!-- 
	
	 -->
    <div class="controls">
        
       
        <div class="controls_colors " id="jsColors ">
            <div class="controls_color jsColor" style="background-color: #2c2c2c "></div>
            <div class="controls_color jsColor" style="background-color: white "></div>
            <div class="controls_color jsColor" style="background-color: #ff3b30 "></div>
            <div class="controls_color jsColor" style="background-color: #ff9500 "></div>
            <div class="controls_color jsColor" style="background-color: #ffcc00 "></div>
            <div class="controls_color jsColor" style="background-color: #4cd963 "></div>
            <div class="controls_color jsColor" style="background-color: #5ac8fa "></div>
            <div class="controls_color jsColor" style="background-color: #0579ff "></div>
            <div class="controls_color jsColor" style="background-color: #5856d6 "></div>
            <div class="controls_color jsColor" style="background-color: #f3f6f0; margin : auto 10px;"><img id="eraser" src="/img/eraser.png" style="width: 50px; height: 50px;" alt="지우개"></div>
            
        </div>
    </div>
    <script>
    console.log("here");
    </script>
   
    <!-- <script src="/js/canvas_show.js "></script>  -->
</body>
</html>