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
	line-height: 300px;
	/* border: solid 1px gray; */
	/* background-color: white; */
	/* box-shadow: 1px 8px 60px black; */
}
</style>
</head>

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

<script type="text/javascript">

function createXMLHttpRequest() {       //万能模板

    var XMLHttpReq;

    if (window.XMLHttpRequest) {   // 是Mozilla浏览器

        XMLHttpReq = new XMLHttpRequest();
    } else if (window.ActiveXObject()) { // IE浏览器
        try {
            XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP"); //因为ie也会出现不兼容所以抛异常
        } catch (e) {
            XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");  //微软的，记住就好
        }
}
    return XMLHttpReq;
}

window.onload=function(){       //加载时运行，同时具有监听的作用
     //通过按钮触发事件
         //1.创建XMLHttpRequest对象 
        var xmlReq=createXMLHttpRequest(); 
        //2.打开和服务器端的连接
        xmlReq.open("GET","UnReadCount",true);//有GTE和POST方法，中间代表连接路径，true代表异步
        //3.发送数据
        xmlReq.send(null); //因为采用的是get方法，所以方法为null
        //4.接收服务器的响应
        xmlReq.onreadystatechange=function(){
            if(xmlReq.readyState==4){//判断对象状态是否完成
              if(xmlReq.status==200){     //信息已经成功返回
               var xmltext =xmlReq.responseText;  //得到AjaxServlet往外输出的数据
               console.log(xmltext);
               console.log(parseInt(xmltext));
               if(parseInt(xmltext)>0){
                   var tt="<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>"
					 +"<strong>tips:</strong>您有<b>"+xmltext+"</b>条新消息，<a href=msgboard>点击查看</a>";
					$("#aa").append(tt);
					}
                      //输出结果：data-connection ok
            }
        }
     
  }
}



</script>



<body>
	
	<div class="container">
	
		<!-- 未读消息提示 -->
		
		<%-- <c:if test="${uReadMsgCount>0}"> --%>
			<div class="alert alert-danger alert-dismissible" role="alert" id="aa">
			  <!-- <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
			  <%-- <strong>tips:</strong>您有<b>${uReadMsgCount}</b>条新消息，<a href=msgboard>点击查看</a> --%>
			</div>
		<%-- </c:if> --%>
	</div>

	<div id="card1" class="container">
		<div class="row">

			<!--头像显示-->
			<div class="col-md-4" id="tx">

				<div class="row">
					<div class="col-md-12" style="text-align: center; height: 300px;">

						

						<!--头像显示-->
						<c:if test="${not empty CurrUser.userImg}">
							<img src="http://106.14.174.178:8080/myimages/${CurrUser.userImg}" class="img-circle" style="height:200px;width:200px">
						</c:if>
						<c:if test="${empty CurrUser.userImg}">
							<img src="img/default_head.jpg" class="img-circle" style="height:200px">
						</c:if>
						
						
					</div>

				</div>
				
				


			</div>

			<div class="col-md-8">
				<div>
					<h1 style="color: white; text-align: right;">我的基本信息</h1>
				</div>
				<table class="table" style="color:white">

					<tr>
						<td>姓名:${CurrUser.username}</td>
						<td>性别:${CurrUser.sex}</td>
						<td>电话${CurrUser.phone}</td>
						

					</tr>


					<tr>
						<td>职业:${CurrUser.job}</td>
						<td>月薪:${CurrUser.salary}</td>
						<td>婚姻:${CurrUser.marriage}</td>
					

					</tr>



					<tr>
						<td>地址:${CurrUser.address}</td>
						<td>身高:${CurrUser.height}</td>
						<td>体重:${CurrUser.weight}</td>
						

					</tr>

					<tr>
						<td>年龄:${CurrUser.age}</td>
						<td>学历:${CurrUser.education}</td>
						<td>邮箱:${CurrUser.email}</td>

					</tr>
				</table>




			</div>
		</div>

	</div>

	<!-- 判断是否有头像 -->
	<c:if test="${empty CurrUser.userImg}">
		
		<div class="container" style="width: 80%;">
			<div class="row">
				<div>
					<form enctype="multipart/form-data" action="upload" method="post">
						<input type="file" accept="image/*" name="PImg"> <input
							class="btn" type="submit" value="上传" />
					</form>

				</div>

			</div>
		</div>
		
	</c:if>



	<div id="card2" class="container" style="margin-top: 100px;">
		<div class="row">

			<!--左侧详细信息-->
			<div class="col-md-4" style="height: 500px;opacity:0.8;">

				<!--详细个人信息-->
				<div class="row">


					<div class="col-md-12" style="height: 200px; padding: 0;">
						<!--个人说明-->
						<div style="background: white; height: 180px; padding-left: 10px;border-radius:5px;">
							<img src="icon/心.png" style="height: 50px;" /> 爱情宣言:
							<hr />
							<p>${CurrUser.introduction}</p>

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
						<!--情感经历-->
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
							<h1 style="color:white;text-align:right">最近的动态</h1>
							<hr/>
						</div>
				</div>	
				<c:if test="${not empty paging }">
					<c:forEach var="msg" items="${paging.data}">
					<div class="row">
						<div class="col-md-12" style="height: 150px; margin: 20px;">
							<div>
								<!--动态-->
								<div style="background-color:white;padding:10px;height: 150px;border-radius:5px;position:relative;opacity:0.8">
								
									
										<!--头-->
										<div id="dy_head" class="clearfix">
										
											<ol>
											
												<c:if test="${not empty CurrUser.userImg}">
													<li style="float: left;"><img class="img-circle" src="http://106.14.174.178:8080/myimages/${CurrUser.userImg}"
														style="height: 30px;" /></li>&nbsp;&nbsp;
													
												</c:if>		
												<li style="float: left;"><span>昵称:${CurrUser.loginName}</span></li>
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
				
					<div class="col-md-12" style="height: 150px; margin: 20px; text-align: center">
						<c:if test="${pagingSize==0}">
							<div class="alert alert-warning" role="alert">暂无动态</div>
						</c:if>
						<c:if test="${pagingSize>0}">
						<!-- 分页 -->
						<div class="row">
							<div class="col-md-12">
								<nav aria-label="Page navigation">
									<ul class="pagination">
										<c:forEach var="i" begin="1" end="${paging.pageCount}">
										
											<!-- 上一页 -->
											<c:if test="${i==1}">
												<c:if test="${i==curpage}">
													<li class="disabled">	
														<a href="upload?p=${paging.currPage-1}" aria-label="Previous">
															<span aria-hidden="true">&laquo;</span>
														</a>
													</li>
												</c:if>
												<c:if test="${i!=curpage}">
													<li>	
														<a href="upload?p=${paging.currPage-1}" aria-label="Previous">
															<span aria-hidden="true">&laquo;</span>
														</a>
													</li>
												</c:if>
											</c:if>
											
											<!-- 当前页 -->
											<c:if test="${i==curpage}">
												<li class="active"><a href="upload?p=${i}">${i}</a></li>
											</c:if>
											<c:if test="${i!=curpage}">
												<li ><a href="upload?p=${i}">${i}</a></li>
											</c:if>
											
											<!-- 下一页 -->
											
												<c:if test="${i==paging.pageCount}">
													<c:if test="${i==curpage}">
														<li class="disabled">
															<a href="upload?p=${paging.currPage+1}" aria-label="Next">
																<span aria-hidden="true">&raquo;</span>
															</a>
														</li>
													</c:if>
													<c:if test="${i!=curpage}">
														<li>
															<a href="upload?p=${paging.currPage+1}" aria-label="Next">
																<span aria-hidden="true">&raquo;</span>
															</a>
														</li>
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
		
			



	</div>
</div>	


	<jsp:include page="footer.jsp" />
</body>
</html>



