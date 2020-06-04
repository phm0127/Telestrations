<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>정답 보기</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#div_keyword").hide();
		$("#btn_keyword").val("정답 보기");
	});
</script>
<body>
	${user}
	<input type="button" id="btn_keyword" onclick="javascript:showKeyword();" value="">	
	<input type="hidden" id="keyword" value="${keyword}">
	<div id="div_keyword">
	</div>
	<script type="text/javascript">
		function showKeyword(){
			$("#div_keyword *").remove();
			if($("#div_keyword").css("display") == "none"){
				$("#div_keyword").show();
				$("#div_keyword").append("<p> 정답 :  " + $("#keyword").val() + "</p>");
				$("#btn_keyword").val("정답 안보기");
			} else {
				$("#div_keyword").hide();
				$("#btn_keyword").val("정답 보기");
			}
			
			
		};
	</script>
</body>
</html>