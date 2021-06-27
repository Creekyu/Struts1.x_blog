<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>MyBlog|Login Success</title>
    <link rel="stylesheet" type="text/css" href="/MyBlog/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/MyBlog/css/public.css" /> 
	
  </head>
  
  <body>
  	<div class="container">
  		<div class="row">
  			<div class="panel" id="panel">
  				<div class="panel-heading text-center bg-success text-info">登录成功</div>
  				<div class="panel-body">
  					<br><br><br> 
  					<div class="row"><p class="text-center">登录成功！</p></div>
  					<div class="row"><ul class="pager center-block"><li><a href="mustLogin.do">点击进入博客</a></li></ul></div>
  				</div>
  				
  			</div>
  		</div>
  	</div>

  </body>
</html>