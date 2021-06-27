<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="bean"  uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="logic"  uri="http://struts.apache.org/tags-logic" %>

<!DOCTYPE html>
<html>
<head>
<title>登录 | MyBlog</title>
	<link rel="stylesheet" type="text/css" href="/MyBlog/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/MyBlog/css/public.css" /> 
    <link rel="stylesheet" href="/MyBlog/css/login.css" />  
    
    
</head>
<body>

<script>
	//注销后阻止返回
	//阻止返回方法https://blog.csdn.net/qq_42683219/article/details/99950841
	window.location.hash="no-back";
	window.location.hash="Again-No-back-button";
	window.onhashchange=function(){window.location.hash="no-back";}
</script>
	<div class="container">
		<h1><a href="#">Login</a></h1>
		<form action="login.do" method="post">
			<div class="input-group form-group"> <!-- 链接数据库//TODO -->
			<span class="input-group-addon glyphicon glyphicon-user" style="top:0px;"></span> <!-- 如果调用bootstrap中的图标会造成对不齐的情况，用css调整 -->
			<input type="text" class="form-control" placeholder="用户名" name="user_name" required>
			</div>
			
			<div class="input-group form-group">
			<span class="input-group-addon glyphicon glyphicon-lock" style="top:0px;"></span>
			<input type="password" class="form-control"placeholder="密码" name="user_pwd" required>
			</div>
			
			<button class="btn btn-lg btn-primary btn-block" type="submit" id="submit">登录</button>
			
			<a class="visitor" href="/MyBlog/register.jsp">点击注册</a>
			
		</form>
	</div>


	<div id="footer">
		<a href="blogDo.do"><span class="glyphicon glyphicon-gift"></span>About</a>
	</div>
	
</body>
</html>