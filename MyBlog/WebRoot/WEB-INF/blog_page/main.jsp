<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
		<title>MyBlog|Main</title>
		<link rel="stylesheet" type="text/css" href="/MyBlog/bootstrap/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="/MyBlog/css/publicOfMain.css"/>
		<script type="text/javascript" src="/MyBlog/js/main.js"></script>
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
						<img class="img-thumbnail center-block img-circle" src="/MyBlog/img/img2.png" width="200px" height="200px">
						<br>
						<p class="text-center" style="font-size:17px;">${user_nickname}</p>	 
						<p class="text-center">${user_brief}</p> 
						<ul class="pager">
							<li><a href="#" onclick="logOut()" class="text-danger">点击注销</a>
						</ul>
					</div>
						
						
					<div class="row">
						<div class="col-md-4 col-md-push-4" id="linkDiv">
							<a href="#" class="list-group-item text-center disabled"><span class="glyphicon glyphicon-home"></span>首页</a>
							<a href="blogDo.do?command=sort&&user_id=${user_id}" class="list-group-item text-center"><span class="glyphicon glyphicon-list"></span>分类</a>
							<a href="mustLogin.do?command=writeBlog&&user_id=${user_id}" class="list-group-item text-center"><span class="glyphicon glyphicon-pencil"></span>创作博客</a>
							<a href="blogDo.do?command=editBlog&&user_id=${user_id}" class="list-group-item text-center"><span class="glyphicon glyphicon-floppy-disk"></span>管理博客</a>
							<a href="blogDo.do?command=searchBlog&&user_id=${user_id}" class="list-group-item text-center"><span class="glyphicon glyphicon-book"></span>阅读博客</a>
							<a href="blogDo.do" class="list-group-item text-center"><span class="glyphicon glyphicon-user"></span>关于</a>
						</div>
					</div>
					<br><br>
				</div>
				<div class="col-md-6" id="model">
					<div class="panel">
						<!-- 链接数据库//TODO -->
						<div class="panel-heading text-center bg-info">用户管理</div>
						<div class="panel-body">
								<p class="text-center text-info">上传用户头像</p>
								<img src="/MyBlog/img/img3.jpeg" class="img-thumbnail center-block" width="200px">
								<br>
								<button class="btn btn-info center-block">点击上传头像</button>
						</div>
						
						<div class="panel-body">
							<!-- 链接数据库//TODO -->
								<p class="text-center text-info">修改用户信息</p>
								<form action="user.do?command=updateUser&&user_id=${user_id}" method="post">
									<div class="form-group">
										<input  id="user_name" name="user_nickname" class="form-control" type="text"  placeholder="修改用户昵称">
									</div>
									<div class="form-group">
										<input  id="user_pwd" name="user_pwd" class="form-control" type="password" placeholder="修改密码">
									</div>
									<div class="form-group">
										<input id="repwd" name="repwd" class="form-control" type="password" placeholder="重复密码">
									</div>
									<div class="form-group">
										<textarea id="selfInfo" name="user_brief" class="form-control" rows="2" style="resize:none;" placeholder="设置个性签名"></textarea>
									</div>
									<button class="btn btn-info center-block" onclick="authForm()">提交修改</button> <!-- 注意仅提交修改过的，未修改的不变(后端实现) -->
								</form>
						</div>
				</div>
			</div>
			
			<div><br><br></div>
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
		<script type="text/javascript" src="/MyBlog/js/star.js"></script> <!-- 引入动效 -->
		
	</body>
</html>
