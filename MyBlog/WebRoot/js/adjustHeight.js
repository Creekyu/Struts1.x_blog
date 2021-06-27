function setHeight(){
	var h = document.documentElement.clientHeight; //获取浏览区域高度
	var obj = document.getElementById("scroll");
	obj.style.setProperty("max-height", h + "px");
}