function selected(obj) {
	document.getElementById("select").value = $(obj).text();
}

function authForm() {
	var blogTitle = document.getElementById("blogTitle").value;
	var blogBrief = document.getElementById("blogBrief").value;
	if (blogTitle.length > 40) {
		alert("标题不得大于20字符!");
		return false;
	}
	if (blogBrief.length > 100) {
		alert("简述不得大于100字符！");
		return false;
	}
	alert("成功！");
	return true;
}

function getData(title, brief,content,select) {
	document.getElementById("blogTitle").value = title;
	document.getElementById("select").value = select;
	document.getElementById("blogBrief").value = brief;
	document.getElementById("blogContent").value = content;
}
