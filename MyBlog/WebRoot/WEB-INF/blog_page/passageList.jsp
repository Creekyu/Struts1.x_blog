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
		<title>MyBlog|PassageList</title>
		<link rel="stylesheet" type="text/css" href="/MyBlog/bootstrap/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="/MyBlog/css/publicOfMain.css"/>
		<script type="text/javascript" src="/MyBlog/js/adjustHeight.js"></script>
		<script type="text/javascript" src="/MyBlog/js/logOut.js"></script>
		
	</head>
	
	<body>
		<div class="pre-scrollabe" style="overflow-x:hidden" id="scroll">
		<script>setHeight();</script>
		<div class="stars"></div>
		
		<div class="container">
			<div class="row"><br><br></div>
			<div class="row">
				<div class="panel center-block" style="width:1000px">
					<div class="panel-heading bg-info">	
						<p class="text-center">文章列表</p>
					</div>
					
				<div class="panel-body">
					<div class="passageList">
						<logic:empty name="blogList">
								<div style="position:relative;top:200px"><p class="text-center text-info">There is Nothing to See!</p></div>
						</logic:empty>
						<logic:notEmpty name="blogList">
						<div class="list-group pre-scrollable center-block" style="max-width:800px;max-height:320px">
							<logic:iterate id="blogs" name="blogList">
							<div class="list-group-item">
								<div class="row">
									<div class="col-md-8"><span style="position:relative;top:10px;" id="blog_title">${blogs.blog_title}</span></div>
									<div class="col-md-4">
										<span style="position:relative;top:3px" id="blog_date">&nbsp;${blogs.blog_date}</span>
										<button class="btn btn-default"
										onclick='showDetail(
										"<bean:write name="blogs" property="blog_id"/>",
										"<bean:write name="blogs" property="blog_title"/>",
										"<bean:write name="blogs" property="blog_brief"/>",
										"<bean:write name="blogs" property="blog_date"/>",
										"<bean:write name="blogs" property="blog_category"/>")'>
										&nbsp;<span class="glyphicon glyphicon-zoom-in" style="color:#5bc0de">查看详情</span>&nbsp;
										</button>
									</div>
								</div>
							</div>
							</logic:iterate>
						</div>
						</logic:notEmpty>
					</div>
				</div>
				
				<div class="panel-body" style="position:absolute;left:43%;bottom:120px">
					<div class="row">
						<div class="row text-center">
							<p id="blogId" style="display:none;">ID</p>
							<p class="h4 text-info" id="blogTitle">标题</p>
							<p class="h5" id="blogDate">时间</p>
							<p class="h6" id="blogCategory">标签</p>
							<p class="h4" id="blogBrief">概述</p>
						</div>
						<br>
					</div>
					
					<div class="row">
						<ul class="pager">
							 <li><a href="#" onclick="jumpTo()">点击阅读</a> <!-- 通过js跳转 -->
							 <li><a href="javascript:history.back(-1)">点击返回</a> 
						</ul>
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
		
		<script type="text/javascript" src="../bootstrap/js/jquery-3.6.0.js"></script>
		<script type="text/javascript" src="/MyBlog/js/passageList.js"></script>
		<script type="text/javascript" src="../js/star.js"></script> <!-- 引入动效 -->
		
	</body>
</html>
