<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="time" value="21" />
<c:set var="miltime" value="15000" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/time.css">
</head>
<script type="text/javascript">
   var time = ${miltime};
   function send() {
      document.location.href = "/canvas";
   }
   setTimeout(function() {
      document.location.href = "/canvas";
   }, time);
</script>
<body>
<div class="container">
   <svg id="wrap" width="300" height="300">
  
  <svg>
     <!-- 바깥 원 -->
    <circle cx="150" cy="150" r="90" style="stroke: white; stroke-width:18; fill:transparent"/>
    <!-- 안쪽 원 -->
    <circle cx="150" cy="150" r="70" style="fill:#2c3e50"/>
    <path style="stroke: #2c3e50; stroke-dasharray:820; stroke-dashoffset:820; stroke-width:18; fill:transparent" d="M150,150 m0,-90 a 90,90 0 0,1 0,180 a 90,90 0 0,1 0,-180">
      <animate attributeName="stroke-dashoffset" from ="0" dur=${time} to="-820"/> <!-- 약 5초+@의 오차? -->
    </path>
  </svg>
  
  <svg>
     <!-- 모래시계 안쪽 유리 -->
    <path id="hourglass" d="M150,150 C60,85 240,85 150,150 C60,215 240,215 150,150 Z" style="stroke: white; stroke-width:5; fill:white;" />
    <!-- 좌 우 기둥 이미지 -->
    <path id="frame" d="M100,97 L200, 97 M100,203 L200,203 M110,97 L110,142 M110,158 L110,200 M190,97 L190,142 M190,158 L190,200 M110,150 L110,150 M190,150 L190,150" style="stroke:lightblue; stroke-width:6; stroke-linecap:round" />
    <animateTransform xlink:href="#frame" attributeName="transform" type="rotate" begin="11s" dur="3s" end="14s" values="0 150 150; 0 150 150; 180 150 150" keyTimes="0; 0.8; 1" repeatCount="indefinite" />
    <animateTransform xlink:href="#hourglass" attributeName="transform" type="rotate" begin="11s" dur="3s" end="14s" values="0 150 150; 0 150 150; 180 150 150" keyTimes="0; 0.8; 1" repeatCount="indefinite" />
  </svg>
  
  <!-- 모래 -->
  <svg>
    <!-- 맨 처음 위에 채워져 있는 모래  -->
    <polygon id="upper" points="120,125 180,125 150,147" style="fill:#2c3e50;">
      <animate attributeName="points" dur="16s" end="14s" keyTimes="0; 0.8; 1" values="120,125 180,125 150,147; 150,150 150,150 150,150; 150,150 150,150 150,150"/>
    </polygon>
    
    <!-- end 부분 : 뒤집힌 후 처음 상태로 복구되는 시점 -->
    <!-- falling sand -->
    <path id="line" stroke-linecap="round" stroke-dasharray="1,4" stroke-dashoffset="200.00" stroke="#2c3e50" stroke-width="2" d="M150,150 L150,198">
      <!-- 떨어지는 모래 효과 => repeatCount="indefinite : 반복 제거 -->
      <animate attributeName="stroke-dashoffset" dur="16s" end="14s" to="1.00"/>
      <!-- 떨어지는 모래 효과 사라짐 -->
      <animate attributeName="d" dur="14s" end="14s" to="M150,195 L150,195" values="M150,150 L150,198; M150,150 L150,198; M150,198 L150,198; M150,195 L150,195" keyTimes="0; 0.65; 0.9; 1"/>
      <!-- last drop -->
      <animate attributeName="stroke" dur="16s" end="14s" keyTimes="0; 0.65; 0.8; 1" values="#2c3e50;#2c3e50;transparent;transparent" to="transparent"/>
    </path>
    
    <!-- 회전하는 시간 3초 부여 -->
    <!-- lower part -->
    <g id="lower">
    <!-- 맨 처음 모래가 쌓여있는 아랫 부분 -->
      <path d="M150,180 L180,190 A28,10 0 1,1 120,190 L150,180 Z" style="stroke: transparent; stroke-width:5; fill:#2c3e50;">
        <animateTransform attributeName="transform" type="translate" keyTimes="0; 0.65; 1" values="0 15; 0 0; 0 0" dur="17s"/>
      </path>
      <animateTransform xlink:href="#lower" attributeName="transform"
                    type="rotate"
                    begin="11s" dur="3s" end="14s"
                    values="0 150 150; 0 150 150; 180 150 150"
                    keyTimes="0; 0.8; 1"
                    />
    </g>
    
   <!-- 모래시계 유리(8)자 부분 회전 -->
    <path d="M150,150 C60,85 240,85 150,150 C60,215 240,215 150,150 Z" style="stroke: white; stroke-width:5; fill:transparent;">
      <animateTransform attributeName="transform"
                    type="rotate"
                    begin="11s" dur="3s" end="14s"
                    values="0 150 150; 0 150 150; 180 150 150"
                    keyTimes="0; 0.8; 1"
                    />
    </path>
    
    <!-- 모래시계 나무 틀 아랫부분 앞쪽에 보이게 하는 부분 && 나무 틀 아랫부분 회전 -->
    <path id="frame" d="M100,97 L200, 97 M100,203 L200,203" style="stroke:lightblue; stroke-width:6; stroke-linecap:round">
      <animateTransform attributeName="transform"
                    type="rotate"
                    begin="11s" dur="3s" end="14s"
                    values="0 150 150; 0 150 150; 180 150 150"
                    keyTimes="0; 0.8; 1"
                    />
    </path>
  </svg>
  
</svg>
</div>
<div>
   <button type="button" class="btn btn-primary" onclick="javascript:send();">제출</button>
</div>
</body>
</html>