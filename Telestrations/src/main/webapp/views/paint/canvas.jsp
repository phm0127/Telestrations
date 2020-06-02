<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie-edge">
    <link rel="stylesheet" href="/css/canvas_styles.css">
    <title>PaintJS</title>
</head>
<body>
	<p style="font-size: 2rem; margin : 2rem auto; letter-spacing: 3px;">SSAFY TELESTRATIONS</p>

    <canvas id="jsCanvas" class="canvas"></canvas>
    <div class="controls">
        <div class="controls_range">
            <input type="range" id="jsRange" min="0.1" max="5.0" value="2.5" step="0.1" />
        </div>
        <div class=" controls_btns ">
            <button id="jsMode">채우기</button>
            <button id="jsSave">제출</button>
        </div>
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
            
        </div>
    </div>
    <script src="/js/canvas_app.js "></script>
</body>
</html>