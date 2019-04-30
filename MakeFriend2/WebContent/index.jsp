<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@ include file="/header.jsp"%>
<html>
<head>



<style type="text/css">
	.carousel-control.left {
		background-image: none;
		background-repeat: repeat-x;
		filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#80000000',
			endColorstr='#00000000', GradientType=1);
	}
	
	.carousel-control.right {
		left: auto;
		right: 0;
		background-image: none;
		background-repeat: repeat-x;
		filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00000000',
			endColorstr='#80000000', GradientType=1);
	}
	
	#img img {
		width:100%
		
	}
	
	#feel a {
		color: #000;
	}
	
	#huiyuan img{
		width: 274px;
		height: 260px;
		margin-bottom:10px
	}
	
	#yinying:hover{
		
			opacity:0.8;
			display:block;
		
	
		
		/* background-color:yellow; */
	}
	
	#yinying{
		border-radius:0 0 10px 10px;
		width:273px;
		height:80px;
		background-color:white;
		opacity:0;
		position:absolute;
		top:0;	
		margin-bottom:10px;
		margin-top:180px;
		display:block;
		
	}
	.zixun img{
		width:300px;
		height:500px
	}
	#zixun1:hover div{
		display:block;
	}
	#zixun1 div{
		width:300px;
		height:120px;
		background-color:gray;
		opacity:0.8;
		position:absolute;
		top:0;	
		margin-bottom:10px;
		margin-top:380px;
		display:none;
		
	}
	#zixun2:hover div{
		display:block;
	}
	#zixun2 div{
		width:300px;
		height:120px;
		background-color:gray;
		opacity:0.8;
		position:absolute;
		top:0;	
		margin-bottom:10px;
		margin-top:380px;
		display:none;
		
	}
	#zixun3:hover div{
		display:block;
	}
	#zixun3 div{
		width:300px;
		height:120px;
		background-color:gray;
		opacity:0.8;
		position:absolute;
		top:0;	
		margin-bottom:10px;
		margin-top:380px;
		display:none;
		
	}
	body{
		 background-color:#F5EDED; 
	}
</style>



<!-- 模态框 -->
<script type="text/javascript">

 //和他聊天
 $(function(){
	
	 
	 $(".withH").click(function(){
		 //console.log('ccc');
		 //消息接受者id
		 var userid = $(this).attr('userid');
		 var username = $(this).attr('username');
		 //console.log('userid'+userid);
		
		 $("#toUserName").attr('data',userid);
		 $("#toUserName").text(username);
		 
		//$("#myModal").dialog('open');
		 
		 
		//偏移对话框
		 var top=$(this).offset().top;
		 var left=$(this).offset().left-150;

		$("#myModal").window("open").window("resize",{width:"400px",height:"200px",top:top,left:left});
	
	 });
	 
	 
 });


	
		//var div = document.getElementById("div");
	$(document).ready(function(){
		$(".btn-primary").click(function(){
			
			var contextId = $("#toUserName").attr('data');
			var context = $("#con").val();
			
			//alert("发送给："+contextId);
			//console.log("发送给"+recId);
	      	$.ajax({
	      		dataType:'text',
	      		url:"pub1",
	      		data:{"context":context,"recId":contextId},
	      		type:"post",
	      		async:true,
	      		success:function(data){
	      			
	      			//$(".modal-body h2").text(data);
	      			// $(".modal-body h2").css({"display":"block"}); 
	      			 
	      			 $("#myModal").dialog('close');
	      			 
	      			 $("#con").val('');//清空文本域
	      		},
	      		err:function(err){
	      			alert("请求失败");
	      		}
	      	});
			
		});
		
		
	/* 	$(".btn-default").click(function(){
			
			$("#con").val(" ");
			$(".modal-body h2").css({"display":"none"});
		}); */
   	});
 
</script>

</head>
<body >

	<!--背景图片 style="background-image:url(shouye/bg2.jpg)" -->

	<!-- 日历和轮播图 -->
	<div class="container-fluid;">
		
		<!-- 轮播图 -->
		<div style="background-color: light;">

			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<!-- 轮播图的中的小点 -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				
					
					<!-- 轮播图的轮播图片 -->
					<div class="carousel-inner" role="listbox" id="img" >
						<div class="item active">
							<img src="shouye/lunbo1.jpg">
							<div class="carousel-caption">
								<!-- <h1 style="margin-bottom: 300px;">情感咨询师&nbsp;&nbsp;</h1>
								<h3>
									吴静&nbsp;&nbsp;<a href="speak"><button
											style="background-color: pink">联系她</button></a>
								</h3>
								<h5>国家二级情感咨询师、上海市中心心理协会成员、中德班高级组成员</h5>
								<h5>&nbsp;&nbsp;根据你的自身情况，为你量身定制情感方案，全程跟进，脱单定制</h5> -->
							</div>
						</div>
						<div class="item">
							<img src="shouye/lunbo2.jpg">
							<div class="carousel-caption">
								
							</div>
						</div>
						<div class="item">
							<img src="shouye/lunbo3.jpg">
							<div class="carousel-caption">
								
							</div>
						</div>
					</div>
					
					<!-- 上一张 下一张按钮 -->
					<a class="left carousel-control" href="#carousel-example-generic"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"
						></span> <span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"
						></span> <span class="sr-only">Next</span>
					</a>
				</div>
				
				
	
			</div>
			
		</div>


	



	<!-- 会员展示 -->
	<div class="huiyuan">
		<h1 style="margin-left: 70px;">
			会员展示&nbsp;&nbsp;<span class="glyphicon glyphicon-heart "
				style="color: pink"></span>
		</h1>
		<!-- 女会员 -->
		<div class="row" style="margin-left: 70px; margin-right: 70px;" >

			<c:if test="${not empty user}">
				<c:forEach var="user" items="${user.data}">
					
					<div class="col-md-3"  id="huiyuan" style="position:relative;margin-top:20px">
					
						<a href="hisPage?id=${user.id}">
							<c:if test="${empty user.userImg}"> 
								<img class="img-responsive" alt="Responsive image"
							src="img/default_head.jpg" style="border-radius:25px"/>
						
					 		</c:if> 
					 		<c:if test="${not empty user.userImg}">
								<img class="img-responsive" alt="Responsive image" style="border-radius:10px"
								src="http://106.14.174.178:8080/myimages/${user.userImg}"/>
							</c:if> 
						</a>
							
						<div id="yinying">
							<h5 style="text-align: center;line-height:80px">姓名：${user.username}&nbsp;&nbsp;职业:${user.job}&nbsp;&nbsp;身高:${user.height}</h5>
						</div>
							<c:if test="${not empty CurrUser}">
							
								
								
								<a  href="JavaScript:void(0);" class="btn withH"  userid="${user.id}" username="${user.username}" 
									style="background-color: pink; margin-left: 90px">
									${user.sex=='男' ?'和他聊天':'和她聊天'}
								</a>
								
							</c:if>
						
					</div>
				</c:forEach>
			</c:if>



		</div>
	</div>
	
	<!-- Modal）  开始-->
	<div id="myModal" class="easyui-dialog" title="发送消息"  model="true"   data-options="modal:true,closed:true,iconCls:'icon-edit'" style="width:400px;height:200px;padding:10px">
		发送消息:<span  data="0" id="toUserName">xxxx</span>
		<span>
		
		</span>
		<textarea id="con" rows="3" cols="50" name="context" placeholder="请输入留言的内容"></textarea>
	    <button class="btn btn-primary" >发送消息</button>
	</div>
	
	
	
	<!-- 模态框（Modal）  开始-->
	<!-- <div class="easyui-dialog" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title"  id="myModalLabel">发送消息:<span  data="0" id="toUserName">xxxx</span></h4>
	                
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	            </div>
	            <div class="modal-body" style="height: 100px">
	            	<ul id="cc" class="chat-thread">
					</ul>
					<h2></h2>
	            </div>
	            <div class="modal-footer">
	            	<textarea id="con" rows="3" cols="50" name="context" placeholder="请输入留言的内容"></textarea>
	                <button class="btn btn-primary" >发送消息</button>
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	            </div>
	        </div>/.modal-content
	    </div>/.modal
	</div> -->
	
	<!-- 模态框（Modal）  结束-->
	
	<!-- 情感专栏 -->
	<div>
		<h1 style="margin-left: 70px;">
			情感专栏&nbsp;&nbsp;<span class="glyphicon glyphicon-hand-down"
				style="color: pink"></span>
		</h1>
		<div class="row" style="margin-left: 70px; margin-right: 70px;"
			id="feel">
			<div class="col-md-3">
				<img class="img-responsive" alt="Responsive image"
					src="shouye/feel1.jpg">
			</div>
			<div class="col-md-3">
				<a href="footers/1.jsp">最容易被甩的几种女生</a><br>
				<br> <a href="footers/2.jsp" style="margin-top: 30px;">拉黑你的人，一定爱你很深</a><br>
				<br> <a href="footers/3.jsp" style="margin-top: 30px">慢慢喜欢你，余生都是你</a><br>
				<br> <a href="footers/2.jsp" style="margin-top: 30px">出轨的丈夫，我谢谢你祖宗十八代</a><br>
				<br> <a href="footers/1.jsp" style="margin-top: 30px">比色诱强一百倍的潜规则</a>
			</div>

			<div class="col-md-3">
				<img class="img-responsive" alt="Responsive image"
					src="shouye/feel2.jpg">
			</div>
			<div class="col-md-3">
				<a href="footers/1.jsp">"你等我一年，我一定离婚娶你"</a><br>
				<br> <a href="footers/2.jsp" style="margin-top: 30px">第一代10后，都在喝毒鸡汤了</a><br>
				<br> <a href="footers/3.jsp" style="margin-top: 30px">女朋友出门化妆2小时，要不要分手?</a><br>
				<br> <a href="footers/2.jsp" style="margin-top: 30px">我没有多少钱，就是有十栋房子收租</a><br>
				<br> <a href="footers/1.jsp" style="margin-top: 30px">余生只想说给你听</a>
			</div>
		</div>
	</div>
	<!-- 高颜值组合 -->
	<h1 style="margin-left: 70px;">
		高颜值成功CP&nbsp;&nbsp;<span class="glyphicon glyphicon-hand-down"
			style="color: pink"></span>
	</h1>
	<div class="row" style="margin-left: 70px; margin-right: 70px;" id="cp" style="position:relative">
		<c:if test="${not empty success }">
			<c:forEach var="success" items="${success.data}">
				<div class="col-md-3">
					<a href="success"><img class="img-responsive" alt="Responsive image" style="border-radius:5px;height:260px;width:274px"
						src="http://106.14.174.178:8080/success/${success.img}"/> </a>
						
				</div>
			</c:forEach>
		</c:if>
	</div>
	<h1 style="margin-left: 70px;">
		情感咨询师&nbsp;&nbsp;<span class="glyphicon glyphicon-hand-down"
			style="color: pink"></span>
	</h1>
	<!-- 咨询师 -->
	<div class="row zixun" style="margin-left: 70px; margin-right: 70px;">
		<div class="col-md-4" id="zixun1" style="position:relative">
			<img alt="" src="shouye/zixun1.jpg">
			<div>
				<a href="success" class="btn " style="background-color: pink; margin-top: 10px; margin-left:110px">我要咨询</a>
				<h5 style="margin-left:95px">董卿:央视著名主持人</h5>
			</div>
		</div>
		<div class="col-md-4" id="zixun2" style="position:relative">
			<img alt="" src="shouye/zixun2.jpg">
			<div>
				<a href="success" class="btn " style="background-color: pink; margin-top: 10px; margin-left: 110px">我要咨询</a>
				<h5 style="margin-left:95px">董卿:央视著名主持人</h5>
			</div>
		</div>
		
		<div class="col-md-4" id="zixun3" style="position:relative">
			<img alt="" src="shouye/zixun4.jpeg">
			<div>
				<a href="success" class="btn " style="background-color: pink; margin-top: 10px; margin-left: 110px">我要咨询</a>
				<h5 style="margin-left:95px">董卿:央视著名主持人</h5>
			</div>
		</div>
	</div>
	<%@ include file="/footer.jsp"%>

</body>
</html>