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
		<title>MyBlog|Edit</title>
		<link rel="stylesheet" type="text/css" href="/MyBlog/bootstrap/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="/MyBlog/css/publicOfMain.css"/>
		<script type="text/javascript" src="/MyBlog/bootstrap/js/jquery-3.6.0.js"></script>
		<script type="text/javascript" src="/MyBlog//bootstrap/js/bootstrap.js"></script>
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
							<a href="#" class="list-group-item text-center disabled"><span class="glyphicon glyphicon-floppy-disk"></span>管理博客</a>
							<a href="blogDo.do?command=searchBlog&&user_id=${user_id}" class="list-group-item text-center"><span class="glyphicon glyphicon-book"></span>阅读博客</a>
							<a href="blogDo.do" class="list-group-item text-center"><span class="glyphicon glyphicon-user"></span>关于</a>
						</div>
					</div>
					<br><br>
	
				</div>
				
				<div class="col-md-6" id="model">
					<div class="panel">
						<!-- 链接数据库//TODO -->
						<div class="panel-heading text-center bg-info">博客管理</div>
						<div class="panel-body">
							<logic:empty name="blogList">
								<div style="position:relative;top:300px"><p class="text-center text-info">There is Nothing to See!</p></div>
							</logic:empty>
							<logic:notEmpty name="blogList">
							<div class="list-group pre-scrollable" style="overflow-x:hidden;max-height:550px"> <!-- max-height调整div最大长度 -->
							<logic:iterate id="blogs" name="blogList">
							<div class="list-group-item">
								<div class="row">
									<div class="col-md-4"><span style="position:relative;top:10px;">${blogs.blog_title}</span></div>
									<div class="col-md-8">
										<div class="row">
											<div class="col-md-4" style="position:relative;top:7px">
												<span style="position:relative;top:3px;">${blogs.blog_date}</span>
											</div>
											<div class="col-md-4" style="position:relative;left:20px;"> 	
												<button class="btn btn-default" data-toggle="modal" data-target="#myModal"
												 onclick='getData(
												 "<bean:write name="blogs" property="blog_title"/>",
												 "<bean:write name="blogs" property="blog_brief"/>",
												 "<bean:write name="blogs" property="blog_text"/>",
												 "<bean:write name="blogs" property="blog_category"/>")'> <!-- 传值给模态框  -->
												<span class="glyphicon glyphicon-pencil" style="color:#5bc0de" >编辑</span>&nbsp;</button>
											</div>
											<div class="col-md-4">
											<!-- javascript:window.location.href="" 定义点击事件可以使按钮完成跳转或action -->
												<button class="btn btn-default" onclick="javascript:window.location.href='blogDo.do?command=delBlogs&&blog_id=${blogs.blog_id}&&user_id=${user_id}';alert('删除成功');">
												<span class="glyphicon glyphicon-trash" style="color:#d9534f" >删除</span>&nbsp;</button> 
											</div>
												
										</div>
									</div>
								</div>
							</div>
							</logic:iterate>
							</div>
							</logic:notEmpty>
							
							<!-- 模态框（Modal） -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
						   	   <div class="modal-dialog">
						   	      <div class="modal-content">
						   	         <div class="modal-header">
						   	            <button type="button" class="close" 
						   	               data-dismiss="modal" aria-hidden="true">
						   	                  &times;</button>
						   	            <h4 class="modal-title" id="myModalLabel">修改博客</h4>
						   	         </div>
									 <form action="blogDo.do?command=updateBlogs&&blog_id=${blogs.blog_id}" method="post" onsubmit="return authForm()">
										 <div class="modal-body">
											<div class="form-group">
												<input id="blogTitle" type="text" name="blog_title" class="form-control" placeholder="标题">
											</div>
											<div class="row">
												<div class="col-md-4">
													<div class="dropdown">
														<button type="button" class="btn btn-info dropdown-toggle btn-block" data-toggle="dropdown">
															分类选择
															<span class="caret"></span>
														</button>
														 <ul class="dropdown-menu" role="menu">
															  <li><a href="#" onclick="selected(this)">Java</a></li> <!-- js用this记得传this参数-->
															  <li><a href="#" onclick="selected(this)">HTML</a></li>
															  <li><a href="#" onclick="selected(this)">CSS</a></li>
															  <li><a href="#" onclick="selected(this)">Javascript</a></li>
															  <li><a href="#" onclick="selected(this)">JQuery</a></li>
															  <li><a href="#" onclick="selected(this)">Bootstrap</a></li>
														  </ul>
													</div>
												</div>
												<div class="col-md-3">
													<input class="form-control text-center" id="select" name="blog_category" readonly>
												</div>
											</div>
											
											<div><br></div>
											<div class="form-group">
												<textarea id="blogBrief" name="blog_brief" class="form-control" rows=3 placeholder="请输入摘要" style="resize:none;"></textarea>
											</div>
											<div class="form-group">
												<textarea id="blogContent" name="blog_text" class="form-control" rows=8 placeholder="请输入内容" style="resize:none;"></textarea>
											</div>
											
										 </div>
										 <div class="modal-footer form-group"> <!-- 加入form-group绑定，否则提交无效 -->
											<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
											<button type="submit" class="btn btn-primary">提交更改</button> <!-- 注意仅提交修改过的，未修改的不变(后端实现) -->
										 </div>
									 </form>
						   	 
								 <!-- 模态框（Modal） -->
								  </div>	
							   </div>	
							</div>	
							
							
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
		<script type="text/javascript" src="/MyBlog/js/star.js"></script> <!-- 引入动效 -->
		
	</body>
</html>

