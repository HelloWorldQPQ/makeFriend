<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	
		<!-- 1. 引入bootstrap 样式文件 -->
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
		<!-- 2. 导入jQuery -->
		<script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
		<!-- 3. 导入popper 用于弹窗 提示、下拉框 -->
		<script type="text/javascript" src="js/popper.min.js" ></script>
		<!-- 4. 导入bootsrap js文件-->
		<script src="js/bootstrap.min.js"></script>
		<script src="js/bootstrapValidator.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/bootstrapValidator.min.css" />

		<script type="text/javascript">
		$(function () {
			

			
			$('form').bootstrapValidator({
				 message: 'This value is not valid',
		            feedbackIcons: {
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
		            
		            fields: {
		                username: {
		                    message: '用户名验证失败',
		                    validators: {
		                        notEmpty: {
		                            message: '用户名不能为空'
		                        },
		                        stringLength: {
		                            min: 3,
		                            max: 18,
		                            message: '用户名长度必须在3到18位之间'
		                        },
		                        regexp: {
		                            regexp: /^[a-zA-Z0-9_]+$/,
		                            message: '用户名只能包含大写、小写、数字和下划线'
		                        }
		                    }
		                },
		               
		            password: {
	                    validators: {
	                        notEmpty: {
	                            message: '密码不能为空'
	                        },
	                         different: {
	                        	    field: 'username',
	                        	       message: '不能和用户名相同'
	                        	    }
	                   	 	}
	                    }
		            },
		            
		            submitHandler: function (validator, form, submitButton) {
		                alert("submit");
		            }
		        });
			});
				
		</script>
		
		
		<script type="text/javascript">
			$(function(){
				$("#code").click(function(){
					$("#code").attr(
					"src","${pageContext.request.contextPath}/code.do?r="+new Date().getTime());
					console.log("1");
				});
				$("#a").click(function(){
					$("#code").attr(
					"src","${pageContext.request.contextPath}/code.do?r="+new Date().getTime());
					console.log("2");
				});
			});
			
		
		</script>
		<!-- <style type="text/css">
		.btn09 { background:url(images/2010-08/14/014304_btn_bg.gif) 0 0 no-repeat; 
		width:107px; height:37px; border:none; font-size:14px;font-weight:bold;
		color:#d84700; cursor:pointer;}    ;
		
		</style> -->
		
	</head>
	<body style="background:#CCC">
		<%
			String username = "";
			String password = "";
			Cookie[] c = request.getCookies();
			if (c != null) {
				for (int i = 0; i < c.length; i++) {
					if ("username".equals(c[i].getName())) {
						username = c[i].getValue();
					} else if ("password".equals(c[i].getName())) {
						password = c[i].getValue();
					}
				}
			} else {
				username = " ";
				password = " ";
			}
		%>
	
	
	
	
	<div  style="background:#EDEDED 
			url('img/45.jpg') no-repeat;background-size: 100% 100%">
		<div class="container-fluid"  >
	<nav class="navbar " style="background-color:light;border: 2px light solid">
		<div class="container-fluid" >
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">首页</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav"  >
					<li><a href="search.do">我的缘分</a></li>
					<li><a href="success.do">成功案例</a></li>
					<li><a href="">最近动态</a></li>
					<li  style="margin-right:800px"><a href="upload.do">我的</a></li>
				</ul>
				
				<ul class="nav navbar-nav navbar-right">
						
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
										<a href="publish.do">发布留言</a>
									</li>
									<li>
										<a href="publishlove.do">发布成功案例</a>
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
		<div class="container" style="width: 100%; height: 550px; position:relative;">
			<div class="row">
				<div class="col-md-6" style="height: 0px;"></div>
				<div class="col-md-6 offset-md-3" style="padding-left: 100px;">
					<div style="width: 350px; border: 1px solid #E7E7E7;padding: 20px 0
						20px 30px; border-radius: 5px; margin-top: 60px;
						background: #fff;opacity:0.9;">
						<strong style="padding-left:90px"><font>登录在线交友</font></strong>
						<hr />
						<form action="login.do" method="post" class="form-horizontal">							
							 <div class="form-group">
							    <!-- 自动填充 -->
							   
								   <div class="col-sm-6">
								      <input type="text" class="form-control" value="<%=username%>"   id="inputloginName" name="username" placeholder="请输入登录名">
								   </div>
							    
							    <label for="inputloginName">登录名</label>
							    <span style="color:red">${errUser}</span>
							    <span style="color:red">${errUser1}</span>
					  		 </div>
					  
						  	 <div class="form-group">
							    
							    <div class="col-sm-6">
							      <input type="password"  class="form-control"   name="password" placeholder="请输入密码">
							    </div>
							    <label for="inputUserID">密&nbsp;&nbsp;&nbsp;码</label>
						     </div>
					   
							<div class="form-group">
								<!-- <input type="text" id="inputPassword" name="ch" placeholder="请输入验证码" style="border-radius: 1px;width:110px" /> -->								
								<!-- <label for="inputCheckcode" class="col-sm-4 control-label">验证码</label> -->
								<div class="col-sm-5">
									<input type="text"  class="form-control"   name="checkcode" placeholder="请输入验证码">
								</div>
								<img id="code" src="${pageContext.request.contextPath}/code.do" />								
								<a id="a" class="position:relative;right:0" style="color:blue;">看不清，换一张</a>						
							</div>
							<div>&nbsp;</div>
							<div>
								<div>
									<input type="checkbox" name="userCookie" value="remb"/>记住用户名
									<a href="Regist.jsp">&nbsp;立即注册</a>
								</div>
							</div>
							<div>&nbsp;</div>
							<div>
								<div style="padding-left: 0px;align-content: center;">
									<input name="button" type="submit" class="btn09" value="登录" 
									style="width:150px;height:30px;border:none;font-size:14px;border-radius: 2px;
									font-weight:bold;color:#FFFFFF;cursor:pointer;background-color:#2BB5E4" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>		
		<!-- 引入footer.jsp -->
		<jsp:include page="/footer.jsp"></jsp:include>
		
	</body>
</html>
