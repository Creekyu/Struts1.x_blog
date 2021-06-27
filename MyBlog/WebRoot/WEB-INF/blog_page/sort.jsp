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
		<meta charset="utf-8">
		<title>MyBlog|Sort</title>
		<link rel="stylesheet" type="text/css" href="/MyBlog/bootstrap/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="/MyBlog/css/publicOfMain.css"/>
		<script src="/MyBlog/js/adjustHeight.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="/MyBlog/js/logOut.js"></script>
		
	</head>
	
	<body>
		<div class="stars"></div>
		<div class="pre-scrollable" style="overflow-x: hidden" id="scroll">
		<script>setHeight();</script>
		
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
							<a href="#" class="list-group-item text-center disabled"><span class="glyphicon glyphicon-list"></span>分类</a>
							<a href="mustLogin.do?command=writeBlog&&user_id=${user_id}" class="list-group-item text-center"><span class="glyphicon glyphicon-pencil"></span>创作博客</a>
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
						<div class="panel-heading bg-info text-center">分类</div>
						<div class="panel-body" style="height:600px;overflow-y: scroll">
							<div>
								<p class="text-center text-sort text-info" style = "font-size: 25px">Java</p>
								<logic:empty name="blog_java">
									<div class="row"><p class="text-center text-info">There is Nothing to See!</p></div>
								</logic:empty>
								<logic:notEmpty name="blog_java">
								<div class="list-group center-block">
									<logic:iterate id="blogs" name="blog_java">
									<div class="list-group-item">
										<div class="row">
											<div class="col-md-6"><span style="position:relative;top:10px;" id="blog_title">${blogs.blog_title}</span></div>
											<div class="col-md-6">
												<span style="position:relative;top:3px" id="blog_date">&nbsp;${blogs.blog_date}</span>
												<!-- javascrpit跳转 -->
												<button class="btn btn-default" onclick="javascript:window.location.href='blogDo.do?command=showContents&&blog_id=${blogs.blog_id}'">
												&nbsp;<span class="glyphicon glyphicon-zoom-in" style="color:#5bc0de">点击阅读</span>&nbsp;
												</button>
											</div>
										</div>
									</div>
									</logic:iterate>
								</div>
								</logic:notEmpty>
							</div>
							<br><br>
							<div>
								<p class="text-center text-sort text-info" style = "font-size: 25px">HTML</p>
								<logic:empty name="blog_html">
									<div class="row"><p class="text-center text-info">There is Nothing to See!</p></div>
								</logic:empty>
								<logic:notEmpty name="blog_html">
								<div class="list-group center-block">
									<logic:iterate id="blogs" name="blog_html">
									<div class="list-group-item">
										<div class="row">
											<div class="col-md-6"><span style="position:relative;top:10px;" id="blog_title">${blogs.blog_title}</span></div>
											<div class="col-md-6">
												<span style="position:relative;top:3px" id="blog_date">&nbsp;${blogs.blog_date}</span>
												<button class="btn btn-default"  onclick="javascript:window.location.href='blogDo.do?command=showContents&&blog_id=${blogs.blog_id}'">
												&nbsp;<span class="glyphicon glyphicon-zoom-in" style="color:#5bc0de">点击阅读</span>&nbsp;
												</button>
											</div>
										</div>
									</div>
									</logic:iterate>
								</div>
								</logic:notEmpty>
							</div>
							<br><br>
							<div>
								<p class="text-center text-sort text-info" style = "font-size: 25px">CSS</p>
								<logic:empty name="blog_css">
									<div class="row"><p class="text-center text-info">There is Nothing to See!</p></div>
								</logic:empty>
								<logic:notEmpty name="blog_css">
								<div class="list-group center-block">
									<logic:iterate id="blogs" name="blog_css">
									<div class="list-group-item">
										<div class="row">
											<div class="col-md-6"><span style="position:relative;top:10px;" id="blog_title">${blogs.blog_title}</span></div>
											<div class="col-md-6">
												<span style="position:relative;top:3px" id="blog_date">&nbsp;${blogs.blog_date}</span>
												<button class="btn btn-default"  onclick="javascript:window.location.href='blogDo.do?command=showContents&&blog_id=${blogs.blog_id}'">
												&nbsp;<span class="glyphicon glyphicon-zoom-in" style="color:#5bc0de">点击阅读</span>&nbsp;
												</button>
											</div>
										</div>
									</div>
									</logic:iterate>
								</div>
								</logic:notEmpty>
							</div>
							<br><br>
							<div>
								<p class="text-center text-sort text-info" style = "font-size: 25px">JavaScript</p>
								<logic:empty name="blog_javascript">
									<div class="row"><p class="text-center text-info">There is Nothing to See!</p></div>
								</logic:empty>
								<logic:notEmpty name="blog_javascript">
								<div class="list-group center-block">
									<logic:iterate id="blogs" name="blog_javascript">
									<div class="list-group-item">
										<div class="row">
											<div class="col-md-6"><span style="position:relative;top:10px;" id="blog_title">${blogs.blog_title}</span></div>
											<div class="col-md-6">
												<span style="position:relative;top:3px" id="blog_date">&nbsp;${blogs.blog_date}</span>
												<button class="btn btn-default" onclick="javascript:window.location.href='blogDo.do?command=showContents&&blog_id=${blogs.blog_id}'">
												&nbsp;<span class="glyphicon glyphicon-zoom-in" style="color:#5bc0de">点击阅读</span>&nbsp;
												</button>
											</div>
										</div>
									</div>
									</logic:iterate>
								</div>
								</logic:notEmpty>
							</div>
							<br><br>
							<div>
								<p class="text-center text-sort text-info" style = "font-size: 25px">JQuery</p>
								<logic:empty name="blog_jQuery">
									<div class="row"><p class="text-center text-info">There is Nothing to See!</p></div>
								</logic:empty>
								<logic:notEmpty name="blog_jQuery">
								<div class="list-group center-block">
									<logic:iterate id="blogs" name="blog_jQuery">
									<div class="list-group-item">
										<div class="row">
											<div class="col-md-6"><span style="position:relative;top:10px;" id="blog_title">${blogs.blog_title}</span></div>
											<div class="col-md-6">
												<span style="position:relative;top:3px" id="blog_date">&nbsp;${blogs.blog_date}</span>
												<button class="btn btn-default"  onclick="javascript:window.location.href='blogDo.do?command=showContents&&blog_id=${blogs.blog_id}'">
												&nbsp;<span class="glyphicon glyphicon-zoom-in" style="color:#5bc0de">点击阅读</span>&nbsp;
												</button>
											</div>
										</div>
									</div>
									</logic:iterate>
								</div>
								</logic:notEmpty>
							</div>
							
							<br><br>
							<div>
								<p class="text-center text-sort text-info" style = "font-size: 25px">Bootstrap</p>
								<logic:empty name="blog_bootstrap">
									<div class="row"><p class="text-center text-info">There is Nothing to See!</p></div>
								</logic:empty>
								<logic:notEmpty name="blog_bootstrap">
								<div class="list-group center-block">
									<logic:iterate id="blogs" name="blog_bootstrap">
									<div class="list-group-item">
										<div class="row">
											<div class="col-md-6"><span style="position:relative;top:10px;" id="blog_title">${blogs.blog_title}</span></div>
											<div class="col-md-6">
												<span style="position:relative;top:3px" id="blog_date">&nbsp;${blogs.blog_date}</span>
												<button class="btn btn-default"  onclick="javascript:window.location.href='blogDo.do?command=showContents&&blog_id=${blogs.blog_id}'">
												&nbsp;<span class="glyphicon glyphicon-zoom-in" style="color:#5bc0de">点击阅读</span>&nbsp;
												</button>
											</div>
										</div>
									</div>
									</logic:iterate>
								</div>
								</logic:notEmpty>
							</div>
							
							
						</div>
					</div>
				</div>
			</div>
			
			<div><br><br></div>
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

