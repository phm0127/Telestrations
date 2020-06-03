const canvas = document.getElementById("jsCanvas");
const ctx = canvas.getContext("2d");
const colors = document.getElementsByClassName("jsColor")
const range = document.getElementById("jsRange");
const mode = document.getElementById("jsMode");
const notify = document.getElementById("modnotify");
const saveBtn = document.getElementById("jsSave");
const undoBtn = document.getElementById("jsUndo");
const redoBtn = document.getElementById("jsRedo");
const eraseBtn = document.getElementById("jsErase");

const INITIAL_COLOR = "#2c2c2c";
const CANVAS_SIZE = 500;

canvas.width = CANVAS_SIZE;
canvas.height = CANVAS_SIZE;

ctx.fillStyle = "white";
ctx.fillRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
ctx.strokeStyle = INITIAL_COLOR;
ctx.fillStyle = INITIAL_COLOR;
ctx.lineWidth = 2.5;

let painting = false;
let filling = false;
let tempImage=null;
let bkcolor="white";
let isEraser=false;
let curLineWidth=2.5;
/*
 */
let cPushArray = new Array();
let cStep = 0;
cPushArray.push(document.getElementById('jsCanvas').toDataURL());

function canvasPush() {
	console.log("push");
    cStep++;
    if (cStep < cPushArray.length) { cPushArray.length = cStep; }
    cPushArray.push(document.getElementById('jsCanvas').toDataURL());
}

function handleUndoClick(event) {
	console.log("redo");
    if (cStep > 0) {
        cStep--;
        var canvasPic = new Image();
        canvasPic.src = cPushArray[cStep];
        canvasPic.onload = function () { ctx.drawImage(canvasPic, 0, 0); }
    }
}

function handleRedoClick(event) {
    if (cStep < cPushArray.length-1) {
        cStep++;
        var canvasPic = new Image();
        canvasPic.src = cPushArray[cStep];
        canvasPic.onload = function () { ctx.drawImage(canvasPic, 0, 0); }
    }
}
/*
 */

function stopPainting() {
    painting = false;
    canvasPush();
}
function stopPainting2() {
	painting = false;
	
}

function startPainting() {
    painting = true;
}

function onMouseMove(event) {
    const x = event.offsetX;
    const y = event.offsetY;
    if (!painting) {
        ctx.beginPath();
        ctx.moveTo(x, y);
    } else {
    	if(!filling){
    		ctx.lineTo(x, y);
    	}else{
    		ctx.moveTo(x, y);
    	}
        ctx.stroke();
    }
}



function handleColorClick(event) {
	if(event.target.id==="eraser"){
		
		ctx.strokeStyle=bkcolor;
		isEraser=true;
		filling = false;
	    mode.innerText = "채우기";
	    notify.innerText = "그리기 모드";
	    ctx.lineWidth=curLineWidth*4;
	}else{
		const color = event.target.style.backgroundColor;
		ctx.strokeStyle = color;
		ctx.fillStyle = color;
		isEraser=false;
		ctx.lineWidth=curLineWidth;
	}
}

function handleRangeChange(event) {
    const size = event.target.value;
    curLineWidth = size;
    ctx.lineWidth = size;
    if(isErase){
    	ctx.lineWidth = curLineWidth*4;
    }
}

function handleModeClick() {
    if (filling === true) {
        filling = false;
        mode.innerText = "채우기";
        notify.innerText = "그리기 모드";
    } else {
        filling = true;
        mode.innerText = "그리기";
        notify.innerText = "채우기 모드";
    }
}

function handleCanvasClick() {
    if (filling){
    	ctx.fillRect(0, 0, canvas.width, canvas.height);
    	bkcolor=ctx.fillStyle;
    }
}

function handleCM(event) {
    event.preventDefault();
}

//Paint[🎨]
function handleSaveClick(event) {
    const image = canvas.toDataURL("image/png");
    const link = document.createElement("a");
    link.href = image;
    
    link.click();
    console.log(link);
    
}
function handleEraseClick(event) {
	ctx.fillStyle = "white";
	ctx.fillRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
	ctx.strokeStyle = INITIAL_COLOR;
	ctx.fillStyle = INITIAL_COLOR;
	filling = false;
    mode.innerText = "채우기";
    notify.innerText = "그리기 모드";
    bkcolor="white";
    canvasPush();
	
}




if (canvas) {
    canvas.addEventListener("mousemove", onMouseMove);
    canvas.addEventListener("mousedown", startPainting);
    canvas.addEventListener("mouseup", stopPainting);
    canvas.addEventListener("mouseleave", stopPainting2);
    canvas.addEventListener("click", handleCanvasClick);
    canvas.addEventListener("contextmenu", handleCM);
}

Array.from(colors).forEach(color => color.addEventListener("click", handleColorClick));

if (range) {
    range.addEventListener("input", handleRangeChange);
}

if (mode) {
    mode.addEventListener("click", handleModeClick);
}

if (saveBtn) {
    saveBtn.addEventListener("click", handleSaveClick);
}
if (eraseBtn) {
	eraseBtn.addEventListener("click", handleEraseClick);
}
if (undoBtn) {
	undoBtn.addEventListener("click", handleUndoClick);
}
if (redoBtn) {
	redoBtn.addEventListener("click", handleRedoClick);
}