const canvas = document.getElementById("jsCanvas");
const ctx = canvas.getContext("2d");

$(document).ready(function() {
	console.log('${picture}');
	if( '${picture}'!=null){
		let canvasPic = new Image();
	    canvasPic.src = '${picture}';
	    canvasPic.onload = function () { ctx.drawImage(canvasPic, 0, 0); }
	}
});





