function showDetail(blog_id,blog_title,blog_brief,blog_date,blog_category){
	document.getElementById("blogId").innerHTML = blog_id;
	document.getElementById("blogBrief").innerHTML = blog_brief;
	document.getElementById("blogTitle").innerHTML = blog_title;
	document.getElementById("blogDate").innerHTML = blog_date;
	document.getElementById("blogCategory").innerHTML = "标签：" + blog_category;
}

function jumpTo(){
	var id = document.getElementById("blogId").innerHTML;
	if(id == "ID"){
		alert("请选择文章！");
		return false;
	}else{
		window.location.href= "blogDo.do?command=showContents&&blog_id=" + id;
	}
}