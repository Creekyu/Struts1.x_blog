<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>MyBlog|Login Failed</title>
    <link rel="stylesheet" type="text/css" href="/MyBlog/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/MyBlog/css/public.css" /> 
	
  </head>
  
  <body>
  	<div class="container">
  		<div class="row">
  			<div class="panel" id="panel">
  				<div class="panel-heading text-center bg-danger text-info">登录失败</div>
  				<div class="panel-body">
  					<br><br><br> 
  					<div class="row"><p class="text-center"><% out.println(request.getAttribute("error")); %></p></div>
  					<div class="row"><ul class="pager center-block"><li><a href="index.jsp">点击返回</a></li></ul></div>
  				</div>
  				
  			</div>
  		</div>
  	</div>

  </body>
</html>
