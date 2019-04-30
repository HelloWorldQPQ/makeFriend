<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<!-- 1. 引入bootstrap 样式文件 -->
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<!-- 2. 导入jQuery -->
		<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
		<!-- 3. 导入popper 用于弹窗 提示、下拉框 -->
		<script type="text/javascript" src="js/popper.min.js"></script>
		<!-- 4. 导入bootsrap js文件-->
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
	</head>
	<body>
			<div id="" class="container">
			<div class="row clearfix" style="margin-top: 70px	;">
				<div class="col-md-12 column">
					<div class="jumbotron">			
							
							<img src="http://106.14.174.178:8080/myimages/${reuserimg }" class="img-thumbnail" width="50px" /><a href="#">${reuser}：</a>${recontent }		
							
						<form action="redna" method="get">
							<p>
								<input type="text" class="form-control" placeholder="留言内容" name="content">
							</p>
							<p>
								<button type="submit" class="btn btn-primary btn-large" >评论</button>
							</p>
						</form>
						
						<c:forEach var="reply" items="${replys }">
						
							<div>					
								<a href="#">${reply.user.username }</a>回复ta：${reply.content }
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			
			<a href="动态.jsp" >返回动态</a>
			
		</div>
	</body>
</html>