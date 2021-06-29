<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<title>About Us</title>
		<link rel="stylesheet" type="text/css" href="/MyBlog/bootstrap/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="/MyBlog/css/about.css"/>
		<script src="/MyBlog/bootstrap/js/jquery-3.6.0.js"></script>
		<meta name="robots" content="noindex, nofollow"/>
		<style>
			body{background-color: #ffffff}
		</style>
	
	</head>

	<body>
		<!-- 背景动效-->
		<canvas id="canvas" width="1920" height="950"></canvas><style>canvas {display: block;position: relative;zindex: 1;pointer-events: none;position: fixed;top: 0;}</style>
		
			<div class="container">
				
				<div class="panel panel-success col-md-6 col-md-push-3">
					<div class="panel-heading">This is our Team</div>
					<div class="panel-body">
						<div><img src="/MyBlog/img/img1.png" width="500px" height="312px" class="img-thumbnail">
							<p id="famousSentence">The first step is as good as half over!<br>第一步是最关键的一步!</p>
						</div>
						<br>
						<table class="table table-hover">
							<tr><td style="border:0px;">前端+后端+布局+整合</td><td style="border:0px;"><p style="position:relative;left:60px">徐博洋</p></td><td style="border:0px;"></td></tr>
							<tr><td style="border:0px;">前端</td><td style="border:0px;">谢晋建</td><td style="border:0px;"></td></tr>
							<tr><td style="border:0px;">后端</td><td style="border:0px;">魏文柏</td><td style="border:0px;">魏文轩</td></tr>
							<tr><td style="border:0px;">后端</td><td style="border:0px;" >叶永军</td><td style="border:0px;">田昊龙</td></tr>
						</table>
					</div>
				</div>
			</div>
			
			<div id="footer"><a href="mustLogin.do"><span class="glyphicon glyphicon-home"></span>主页</a></div>
		
		<script src="/MyBlog/js/confetti.js"></script><!-- 导入背景动效js文件 -->
	</body>
</html>
