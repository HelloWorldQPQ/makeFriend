<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>我的</title>
<!-- <link rel="stylesheet" href="css/bootstrap.css" type="text/css" /> -->
<!--导入jQuery-->
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<!--导入popper 用于弹窗 提示、下拉框 -->
<!-- <script type="text/javascript" src="js/popper.min.js"></script> -->
<!--导入bootstrap js文件-->
<!-- <script type="text/javascript" src="js/bootstrap.js"></script> -->

<style type="text/css">
	* {
		padding: 0;
		margin: 0;
	}
	
	li {
		list-style: none;
	}
	
	body {
		background-color: whitesmoke;
		font-family: "微软雅黑";
		/* background: url(img/bg_99.jpeg) no-repeat; */
		background-color:#cdb5d7;
	}
	

	#card1 {
		width: 80%;
		height: 300px;
		margin: 20px auto;
		border-radius: 4px;
		border: solid 4px #FFFFFF;
	}
	
	#card2 {
		width: 80%;
		height: 700px;
		border-radius: 5px;
	}
	
	img {
		height: 150px;
	}
	
	.clearfix:after {
		content: ""; /*设置内容为空*/
		height: 0; /*高度为0*/
		line-height: 0; /*行高为0*/
		display: block; /*将文本转为块级元素*/
		visibility: hidden; /*将元素隐藏*/
		clear: both; /*清除浮动*/
	}
	
	#tx {
		height: 300px;
		line-height:300px;
		
		

	}
</style>


<script type="text/javascript">
	$(function(){
		
		//点击点赞按钮
		$("#dy_foot img").click(function(){
			var did = $(this).attr("id");
			console.log("点击");
			console.log(did);
				$.ajax({
					dataType:'text',
					url:"like",
					data:{'did':did},
					type:"get",
					async:true,
					success:function(data){
						console.log(data);
						var id ="#"+did;
						$(id).next().text(data);
						

					},
					error:function(err){
						alert("请求失败:"+err);
					}
				
				});

		});
		

	});

</script>
</head>




<body>
	
	
	
	

	<div id="card1" class="container">
		<div class="row">

			<!--头像显示-->
			<div class="col-md-4" id="tx">

				<div class="row">
					<div class="col-md-12" style="text-align: center; height: 300px;">

						

						<!--头像显示-->
						<c:if test="${not empty frdUser.userImg}">
							<img src="http://106.14.174.178:8080/myimages/${frdUser.userImg}"
								class="img-circle" style="height:200px">
						</c:if>
						<c:if test="${empty frdUser.userImg}">
							<img src="img/default_head.jpg" class="img-circle" style="height:200px">
						</c:if>
						
						
					</div>

				</div>


			</div>

			<div class="col-md-8">
				<div>
					<h1 style="color: white; text-align: right;">ta的基本信息</h1>
				</div>
				<table class="table" style="color:white">
					<tr>
						<td>姓名:${frdUser.username}</td>
						<td>性别:${frdUser.sex}</td>
						<td>电话:${frdUser.phone}</td>
						

					</tr>


					<tr>
						<td>职业:${frdUser.job}</td>
						<td>月薪:${frdUser.salary}</td>
						<td>婚姻:${frdUser.marriage}</td>
					

					</tr>



					<tr>
						<td>地址:${frdUser.address}</td>
						<td>身高:${frdUser.height}</td>
						<td>体重:${frdUser.weight}</td>
						

					</tr>

					<tr>
						<td>年龄:${frdUser.age}</td>
						<td>学历:${frdUser.education}</td>
						<td>邮箱:${frdUser.email}</td>

					</tr>
				</table>




			</div>
		</div>

	</div>

	



	<div id="card2" class="container" style="margin-top: 100px;">
		<div class="row">

			<!--左侧详细信息-->
			<div class="col-md-4" style="height: 500px;">

				<!--详细个人信息-->
				<div class="row">


					<div class="col-md-12" style="height: 200px; padding: 0;">
						<!--个人说明-->
						<div style="background: white; height: 180px; padding-left: 10px;border-radius:5px;">
							<img src="icon/心.png" style="height: 50px;" /> 爱情宣言:
							<hr />
							<p>${frdUser.introduction}</p>

						</div>

					</div>
					<div class="col-md-12" style="height: 200px; padding: 0;">
						<!--情感经历-->
						<div style="background: white; height: 180px; padding-left: 10px;border-radius:5px;">
							<img src="icon/曲线.png" style="height: 40px;margin-top:5px" /> 情感经历:
							<hr />
							<p>有过三段感情经历</p>

						</div>

					</div>
					<div class="col-md-12" style="height: 200px; padding: 0;">
						<!--其他信息-->
						<div style="background: white; height: 180px; padding-left: 10px;border-radius:5px;">
							<img src="icon/表格.png" style="height: 40px;" /> 信息:
							<hr />

						</div>

					</div>
				</div>


		</div>
			<!--右侧最近动态-->
			<div class="col-md-8" style="height: 500px;">
				<div class="row">
						<div class="col-md-12" style="height: 50px; margin:0 20px 20px 20px;">
							<h1 style="color:white;text-align:right">最近动态</h1>
							<hr/>
						</div>
				</div>	
			
			
				<c:if test="${not empty paging }">
					<c:forEach var="msg" items="${paging.data}">
					<div class="row">
						<div class="col-md-12" style="height: 150px; margin: 20px;">
							<div>
								<!--动态-->
								<div style="background-color:#ffffff;padding:10px;height: 150px;border-radius:5px;position:relative">
								
									
										<!--头-->
										<div id="dy_head" class="clearfix">
										
											<ol>
											
											<c:if test="${not empty frdUser.userImg}">
												<li style="float: left;"><img class="img-circle" src="http://106.14.174.178:8080/myimages/${frdUser.userImg}"
													style="height: 30px;" /></li>
												
											</c:if>		
												<li style="float: left;"><span>用户id:${frdUser.id}</span></li>
												<li style="float: right;">
													<span style="text-align: right;">${msg.gettime}</span>
												</li>
											</ol>
	
	
	
	
										</div>
										<hr />
										
											<div id="dy_body">
												<!--动态的内容-->
												<p>发布的动态----${msg.content}</p>
											</div>
										
										
										<!--foot-->
										
										<div id="dy_foot" style="position:absolute;bottom:10px;right:10px">
					
											<div id="like" style="text-align: right;"><img id="${msg.did}" style="height: 25px;" src="icon/点赞.png" />：<span>${msg.likenum}</span></div>
					
										</div>
								</div>

							</div>

						</div>
					</div>
					</c:forEach>
				</c:if>
				
				<!-- 分页 -->
			<div class="col-md-12"
				style="height: 150px; margin: 20px; text-align: center">
				<!-- 分页 -->
				<c:if test="${empty paging.data}">
					<div class="alert alert-warning" role="alert">暂无动态</div>
				</c:if>
				<c:if test="${not empty paging.data}">
				<div class="row">
					<div class="col-md-12">
						<nav aria-label="Page navigation">
							<ul class="pagination">
							<c:forEach var="i" begin="1" end="${paging.pageCount }">
								<c:if test="${i==1}">
									<c:if test="${i==paging.currPage}">
										<li class="disabled"><a href="hisPage?p=${paging.currPage-1}&id=${frdUser.id}"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>
									<c:if test="${i!=paging.currPage}">
										<li><a href="hisPage?p=${paging.currPage-1}&id=${frdUser.id}"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>
								</c:if>
								
								
								
								<c:if test="${i==paging.currPage}" >
									<li class="active"><a href="hisPage?p=${i}&id=${frdUser.id}">${i}</a></li>
								</c:if>
								<c:if test="${i!=paging.currPage}" >
									<li><a href="hisPage?p=${i}&id=${frdUser.id}">${i}</a></li>
								</c:if>
								
								<c:if test="${i==paging.pageCount}">
									<c:if test="${i==paging.currPage}" >
										<li class="disabled"><a href="hisPage?p=${paging.currPage+1}&id=${frdUser.id}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
									<c:if test="${i!=paging.currPage}" >
										<li ><a href="hisPage?p=${paging.currPage+1}&id=${frdUser.id}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
								</c:if>
								
								
							</c:forEach>
							</ul>
						</nav>
					</div>
				</div>
				</c:if>
			</div>
				
				
			</div>

			
			<!-- <div class="col-12" style="height: 150px; margin: 20px;">
				动态
				<div class="container">
					头
					<div id="dy_head" class="clearfix">

						<ol>
							<li style="float: left;"><img src="img/bg-08.jpg"
								style="height: 30px;" /></li>
							<li style="float: left;"><span>用户名</span></li>
							<li style="float: right;"><span style="text-align: right;">2018-10-31</span></li>
						</ol>




					</div>
					<hr />
					<div id="dy_body">
						动态的内容
						<p>Pin a fixed-height footer to the bottom of the viewport in
							desktop browsers with this custom HTML and CSS. A fixed navbar
							has been added with</p>
					</div>
					foot
					<div id="dy_foot">

						<div style="text-align: right;">点赞：99+</div>

					</div>

				</div>
			</div>
 -->
	<%-- 		<div class="col-12" style="height: 200px; margin: 20px">
				<!--动态-->
				<div class="container">
					<!--头-->
					<div id="dy_head" class="clearfix">

						<ol>
							<!--头像-->
							<li style="float: left;"><img src="img/bg-08.jpg"
								style="height: 30px;" /></li>
							<!--用户名-->
							<li style="float: left;"><span>&nbsp;用户名</span></li>
							<!--时间-->
							<li style="float: right;"><span style="text-align: right;">2018-10-31</span></li>
						</ol>




					</div>
					<hr />
					<!--body-->
					<div id="dy_body">
						<!--动态的内容-->
						<p>
							Pin a fixed-height footer to the bottom of the viewport in
							desktop browsers with this custom HTML and CSS. A fixed navbar
							has been added with
							<code>padding-top: 60px;</code>
							on the
							<code>body &gt; .container</code>
							.
						</p>
					</div>

					<!--foot-->
					<div id="dy_foot">

						<div style="text-align: right;">点赞：99+</div>

					</div>

				</div>
			</div>
		</div> --%>


	</div>
</div>	


	
	

<jsp:include page="footer.jsp" />
</body>
</html>


