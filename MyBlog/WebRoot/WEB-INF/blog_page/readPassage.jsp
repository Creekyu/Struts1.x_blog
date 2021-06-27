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
		<title>MyBlog|Read</title>
		<link rel="stylesheet" type="text/css" href="/MyBlog/bootstrap/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="/MyBlog/css/publicOfMain.css"/>
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
							<a href="mustLogin.do" class="list-group-item text-center"><span class="glyphicon glyphicon-home"></span>首页</a>
							<a href="blogDo.do?command=sort&&user_id=${user_id}" class="list-group-item text-center"><span class="glyphicon glyphicon-list"></span>分类</a>
							<a href="mustLogin.do?command=writeBlog&&user_id=${user_id}" class="list-group-item text-center"><span class="glyphicon glyphicon-pencil"></span>创作博客</a>
							<a href="blogDo.do?command=editBlog&&user_id=${user_id}" class="list-group-item text-center"><span class="glyphicon glyphicon-floppy-disk"></span>管理博客</a>
							<a href="#" class="list-group-item text-center disabled"><span class="glyphicon glyphicon-book"></span>阅读博客</a>
							<!-- 链接改为.do -->
							<a href="blogDo.do" class="list-group-item text-center"><span class="glyphicon glyphicon-user"></span>关于</a>
						</div>
					</div>
					<br><br>
	
				</div>
				
				<div class="col-md-6" id="model">
					<div class="panel">
						<!-- 链接数据库//TODO -->
						<div class="panel-heading text-center bg-info">文章概览</div>
						<div class="panel-body text-center">
							
							<logic:empty name="blogList">
							<div style="position:relative;top:200px"><p class="text-center text-info">There is Nothing to See!</p></div>
							</logic:empty>
							
							<logic:notEmpty name="blogList">
								<div><br><br><hr></div>
								<logic:iterate id="blogs" name="blogList" offset="0" length="3"><!-- 注意这里的id指明的是循环内的标签循环内name标签必须和此id相同，offset代表开始下标，length代表取几个 -->
								<div class="row">		
									<a href="#" class="title">${blogs.blog_title}</a> <!-- 直接取值，不用通过bean标签，注意取值对象要和id名保持一致 -->
									<p>${blogs.blog_date}</p>
									<p>标签:${blogs.blog_category}</p>
									<div>	
										<p>${blogs.blog_brief}</p> 
									</div>
									<div  class="blockFooter"><a href="blogDo.do?command=showContents&&blog_id=${blogs.blog_id}">阅读全文</a></div> <!-- 链接到文章 //TODO -->
									<div><hr></div>
								</div>
								</logic:iterate>
							</logic:notEmpty>
							
							
							<div style="position:absolute;bottom:10px;left:43%">
								<ul class="pager">
								  <li><a href="blogDo.do?command=showList&&user_id=${user_id}">阅读更多</a><!-- 分页太难搞，不分页，跳转到新页面 -->
								</ul>
							</div>
							
							
						</div>
						<br>
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
		<script type="text/javascript" src="/MyBlog/js/star.js"></script> <!-- 引入动效 -->
		
	</body>
</html>
