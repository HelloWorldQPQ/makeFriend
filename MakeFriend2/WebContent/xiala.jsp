<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>搜索</title>


     
     <style>
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
			width:265px;
			height:80px;
			background-color:white;
			opacity:0;
			position:absolute;
			top:0;	
			margin-bottom:10px;
			margin-top:180px;
			display:block;
			
		}
     </style>
     
     <script type="text/javascript">

	 //和他聊天
	 $(function(){
		
		 
		 $(".withH").click(function(){
			 console.log('ccc');
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
		
		
	
   	});
 
</script>
     
</head>


<body>
	<!--<h2>Basic ComboBox</h2>
    	<p>Type in ComboBox to try auto complete.</p>
    	<div style="margin:20px 0"></div>-->
	<div class="container" style="margin-top:20px">
		<div class="row">
			<div class="col-md-12">
				<form action="xiala" method="post"
					style="padding-left: 30px; text-align: 10;">
					<div style="padding-top: 10px; padding-bottom: 10px;">
					<input type="text" class="form-control" name="all" id="all" placeholder="请输入你想输入的条件">
						<span>性别：</span> <select class="easyui-combobox" id="sex"
							name="sex" style="width: 100px;">
							<option value="女">女朋友</option>
							<option value="男">男朋友</option>

						</select> <span>年龄：</span> <select class="easyui-combobox" id="age"
							name="age" style="width: 100px;">
							<option>18-20</option>
							<option>21-25</option>
							<option>26-30</option>
							<option>31-35</option>
							<option>36-40</option>
							<option>41-50</option>
						</select> <span>婚姻：</span> <select class="easyui-combobox" id="marry"
							name="marry" style="width: 120px;">
							<option>未婚</option>
							<option>丧偶</option>
							<option>离异</option>
						</select> <span>学历：</span> <select class="easyui-combobox" id="education"
							name="education" style="width: 120px;">
							<option>文盲</option>
							<option>本科以下</option>
							<option>本科</option>
							<option>本科以上</option>
						</select> <span>身高：</span> <select class="easyui-combobox" id="heigh"
							name="heigh" style="width: 100px;">
							<option>100-149</option>
							<option>150-155</option>
							<option>156-170</option>
							<option>171-175</option>
							<option>176-180</option>
							<option>181-185</option>
							<option>186-200</option>
						</select> <span>体重：</span> <select class="easyui-combobox" id="wight"
							name="wight" style="width: 140px;">
							<option>50-55公斤</option>
							<option>56-60公斤</option>
							<option>61-65公斤</option>
							<option>66-70公斤</option>
							<option>71-75公斤</option>
							<option>76-80公斤</option>
							<option>81-90公斤</option>
						</select>
						&nbsp;&nbsp;
						<button class="btn btn-danger" type="submit">&nbsp;搜索&nbsp;</button>
					</div>

	

					

				</form>
			</div>
		</div>
		</div>
	<div class="container">
		<div>
		<c:if test="${empty search}">
			<div class="alert alert-danger" role="alert">${err}</div>
		</c:if>
		</div>
		<c:if test="${not empty search }">
			<div class="row">
				<c:forEach var="user" items="${search.data }">
			
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



			</div>
		
	<!-- Modal）  开始-->
	<div id="myModal" class="easyui-dialog" title="发送消息"  model="true"   data-options="modal:true,closed:true,iconCls:'icon-add'" style="width:400px;height:200px;padding:10px">
		发送消息:<span  data="0" id="toUserName">xxxx</span>
		<span>
		
		</span>
		<textarea id="con" rows="3" cols="50" name="context" placeholder="请输入留言的内容"></textarea>
	    <button class="btn btn-primary" >发送消息</button>
	</div>

	<div class="row" style="text-align: center;">
		<div class="col-md-12">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li>
						<!-- 上一页按钮：将页码数提交到IndexServlet --> <a
						href="xiala?p=${search.currPage-1 }" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a>
					</li>
					<!-- 遍历页码数，显示分页i 将页码数提交到IndexServlet-->

					<c:forEach var="i" begin="1" end="${search.pageCount }">
						<li><a href="xiala?p=${i }">${i }</a></li>
					</c:forEach>


					<li>
						<!-- 下一页按钮：将页码数提交到IndexServlet --> <a
						href="xiala?p=${search.currPage+1 }" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
	</c:if>
	</div>
	
	<%@ include file="/footer.jsp"%>
</body>
</html>