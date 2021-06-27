<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>MyBlog|Write</title>
		<link rel="stylesheet" type="text/css" href="/MyBlog/bootstrap/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="/MyBlog/css/publicOfMain.css"/>
		<script type="text/javascript" src="/MyBlog/bootstrap/js/jquery-3.6.0.js"></script>
		<script type="text/javascript" src="/MyBlog/js/writeBlog.js"></script>
		<script type="text/javascript" src="/MyBlog/js/adjustHeight.js"></script>
		<script type="text/javascript" src="/MyBlog/js/logOut.js"></script>
	</head>
	
	<body>
	<div class="pre-scrollable" style="overflow-x:hidden" id="scroll">
		<script>setHeight();</script>
		
		<div class="stars"></div>
		
		<div class="container">
			<div class="row">
				<div class="col-md-6" id="navAndInfo">
					<div class="row">
						<p class="h1 text-center text-info">MyBlog</p>
						<p class="text-center text-info" style="font-style: italic;">Life is no always easy</p>
						<img class="img-thumbnail center-block img-circle" src="/MyBlog/img/img2.png" width="200px" height="200px"> <!-- 数据库链接//TODO -->
						<br>
						<p class="text-center" style="font-size:17px;">${user_nickname}</p>	 
						<p class="text-center">${user_brief}</p> 
						<ul class="pager">
							<li><a href="#" onclick="logOut()" class="text-danger">点击注销</a>
						</ul>
					</div>
					
					<div class="row">
						<div class="col-md-4 col-md-push-4" id="linkDiv">
							<a href="mustLogin.do" class="list-group-item text-center"><span class="glyphicon glyphicon-home"></span>首页</a>
							<a href="blogDo.do?command=sort&&user_id=${user_id}" class="list-group-item text-center"><span class="glyphicon glyphicon-list"></span>分类</a>
							<a href="#" class="list-group-item text-center disabled"><span class="glyphicon glyphicon-pencil"></span>创作博客</a>
							<a href="blogDo.do?command=editBlog&&user_id=${user_id}" class="list-group-item text-center"><span class="glyphicon glyphicon-floppy-disk"></span>管理博客</a>
							<a href="blogDo.do?command=searchBlog&&user_id=${user_id}" class="list-group-item text-center"><span class="glyphicon glyphicon-book"></span>阅读博客</a>
							<a href="blogDo.do" class="list-group-item text-center"><span class="glyphicon glyphicon-user"></span>关于</a>
						</div>
					</div>
					<div><br><br></div>
				</div>
				
				<div class="col-md-6" id="model">
					<div class="panel">
						<!-- 链接数据库//TODO -->
						<div class="panel-heading text-center bg-info">创作博客</div>
						<div class="panel-body">
							<br>
							<p class="text-center text-info">今天想写点什么呢?</p>
							<br>
							<form action="blogDo.do?command=addBlogs&&user_id=${user_id}" method="post" onsubmit="return authForm()">
								<br>
								<div class="form-group">
									<input id="blogTitle" type="text" name="blog_title" class="form-control" placeholder="标题" required>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="dropdown">
											<button type="button" class="btn btn-info dropdown-toggle btn-block" data-toggle="dropdown">
												分类选择
												<span class="caret"></span>
											</button>
											 <ul class="dropdown-menu" role="menu">
												  <li><a href="#" onclick="selected(this)">Java</a></li> <!-- js用this记得传this参数 -->
												  <li><a href="#" onclick="selected(this)">HTML</a></li>
												  <li><a href="#" onclick="selected(this)">CSS</a></li>
												  <li><a href="#" onclick="selected(this)">JavaScript</a></li>
												  <li><a href="#" onclick="selected(this)">JQuery</a></li>
												  <li><a href="#" onclick="selected(this)">Bootstrap</a></li>
											  </ul>
										</div>
									</div>
									<div class="col-md-3">
										<input class="form-control text-center" id="select" name="blog_category" value="Java" readonly>
									</div>
								</div>
								
								<div><br></div>
								<div class="form-group">
									<textarea id="blogBrief" name="blog_brief" class="form-control" rows=3 placeholder="请输入摘要" style="resize:none;" required></textarea>
								</div>
								<div class="form-group">
									<textarea id="blogContent" name="blog_text" class="form-control" rows=8 placeholder="请输入内容" style="resize:none;" required></textarea>
								</div>
								<br><br><br>
								<div class="btn-group col-md-4 col-md-push-4">
									<button class="btn btn-info btn-block">提交</button>
								</div>
							</form>
							
						</div>
						
					</div>
				
				</div>
			</div>
			
			<div><br></div>
			<div class="row" id="footer">
			<div class="row"><hr/></div>
			<p class="text-center">
			We all have moments of desperation.
			But if we can face them head on,
			that's when we find out just how strong we really are.
			</p>
			<p class="text-center">人生总有绝望，只有在勇敢面对时，我们才知晓我们有多么强大。</p>
			
		</div>
		</div>
		
		</div>
		<script type="text/javascript" src="/MyBlog/bootstrap/js/jquery-3.6.0.js"></script>
		<script type="text/javascript" src="/MyBlog/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/MyBlog/js/star.js"></script> <!-- 引入动效 -->
		
		
	</body>
</html>
