<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="logic"  uri="http://struts.apache.org/tags-logic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>MyBlog|Content</title>
		<link rel="stylesheet" type="text/css" href="/MyBlog/bootstrap/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="/MyBlog/css/publicOfMain.css"/>
		<script type="text/javascript" src="/MyBlog/js/adjustHeight.js"></script>
		
	</head>
	
	<body>
	<div class="pre-scrollable" style="overflow-x:hidden" id="scroll">
		<script>setHeight();</script>
		<div class="stars"></div>
		
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-push-3">
					<div class="row"><br></div>
					<div class="panel" style="height:700px;">
						<div class="panel-heading bg-info">文章浏览</div>
						<div class="panel-body">
							<div><br><br></div>
							<!-- 链接数据库块 -->						
								<div class="row">		
									<div class="text-center"><h2>${blog.blog_title}</h2></div>								
									<div class="text-center"><h3>${blog.blog_date}</h3></div>	
									<div><br></div>
									<div class="text-center"><h4>${blog.blog_brief}</h4></div>	
									<div><br></div>
									<div class="text-center"><h4>${blog.blog_text}</h4></div>
								</div>
							

							
							<div style='position:absolute;bottom:10%;left:43%'>
								<ul class="pager">
								  <li><a href="javascript:history.back(-1)">点击返回</a></li>
								</ul>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			
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

