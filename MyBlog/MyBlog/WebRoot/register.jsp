<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<title>MyBlog | Register</title>
		<link rel="stylesheet" type="text/css" href="/MyBlog/bootstrap/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="/MyBlog/css/register.css">
		<link rel="stylesheet" type="text/css" href="/MyBlog/css/public.css"/>
		<script type="text/javascript" src="/MyBlog/js/register.js"></script>
		
	</head>
	
	<body>
		<div class="container">
			<div class="row">
				<h1><a href="#">Register</a></h1>
			</div>
			<div class="row">
			<form action="user.do?command=addUser" method="post" onsubmit="return authForm()"> <!-- 用户名20位，昵称20位，密码6-20位 ，创数据库统一char(20)-->
				<div class="input-group form-group">
					<span class="input-group-addon glyphicon glyphicon-user" style="top:0px;"></span> <!-- 链接数据库//TODO -->
					<input class="form-control" placeholder="用户名" id="user_name" type="text" name="user_name" required>
				</div>
				
				<div class="input-group form-group">
					<span class="input-group-addon glyphicon glyphicon-pencil" style="top:0px;"></span>
					<input class="form-control" placeholder="昵称" id="name" type="text" name="user_nickname" required>
				</div>
				
				<div class="input-group form-group">
					<span class="input-group-addon glyphicon glyphicon-lock" style="top:0px;"></span>
					<input class="form-control" placeholder="密码" id="pwd" type="password" name="user_pwd" required>
				</div>
				
				<div class="input-group form-group">
					<span class="input-group-addon" style="top:0px">@</span>
					<input class="form-control" placeholder="重复密码" id="repwd" type="password" required>
				</div>
				
				<div class="form-group col-md-12">
				<button class="btn btn-primary btn-block" type="submit">注册</button>
				</div>
			</form>
			</div>
			<div class="row">
				<p class="text-center"><a href="/MyBlog/index.jsp">返回登录</a></p>
			</div>
			
		</div>
		
		<div id="footer">
			<a target="_blank" href="blogDo.do"><span class="glyphicon glyphicon-leaf"></span>About</a>
		</div>
		
	</body>
</html>