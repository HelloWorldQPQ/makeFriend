<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 

<!DOCTYPE html>
<html>
	<head>
	<title>one爱网</title>
		<script src="js/jquery-3.3.1.min.js"></script>
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
		<script src="js/bootstrap.min.js" type="text/javascript"></script>
		
		<link rel="stylesheet" type="text/css"href="easyui/themes/metro/easyui.css">
		<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
		
		<script type="text/javascript" src="easyui/jquery.min.js"></script>
		<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
		
		<script src="js/bootstrapValidator.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/bootstrapValidator.min.css" />
		
		<style>
		.navbar-default .navbar-brand {
		    color: white;
		}
		
		
		.navbar-default .navbar-nav>li>a {
		    color: white;
		}
		</style>
	</head>
<!-- 导航条 -->
<body>
<div class="container-fluid" style="padding:0;margin:0">
	<nav class="navbar navbar-default" style="color:white;padding:0;margin:0;border-radius: 0;background-color: #FCB09E;" >
		<div class="container" >
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index">首页</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav"  >
				
					<li><a href="xiala.do">我的缘分</a></li>
					<li><a href="success.do">晒幸福</a></li>
					<li><a href="content.do">最近动态</a></li>
					<c:if test="${not empty CurrUser}">
						
						<li  style="margin-right:600px"><a href="upload">我的</a></li>
					</c:if>
				</ul>
				
				<ul class="nav navbar-nav navbar-right" style="margin-left:-10px;">
						
						<!-- 未登录的菜单 -->
						<c:if test="${empty CurrUser}">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
									<span class="glyphicon glyphicon-user"></span>
									 <span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li>
										<a href="login.jsp">登录</a>
									</li>
									<li>
										<a href="Regist.jsp">注册</a>
									</li>
								</ul>
							</li>
						</c:if>
						
						<!-- 登录的菜单 -->
						<c:if test="${not empty CurrUser}">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
									<span class="glyphicon glyphicon-user"></span>
									${CurrUser.username}
									 <span class="caret"></span>
								</a>
								<ul class="dropdown-menu">
									<li>
										<a href="pubw.do">发布动态</a>
									</li>
									<li role="separator" class="divider"></li>
									<li>
										<a href="publishLove.jsp">晒一晒</a>
									</li>
									<li role="separator" class="divider"></li>
									<li>
										<a href="update.do?id=${CurrUser.id}">修改个人信息</a>
									</li>
									<li role="separator" class="divider"></li>
									<li>
										<a href="logout.do">注销</a>
									</li>
								</ul>
							</li>
						</c:if>
				</ul>
			</div>
		</div>
	</nav>
</div>
</body>
</html>