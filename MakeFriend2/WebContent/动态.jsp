<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
     
     <%@ include file="header.jsp" %>  
<!DOCTYPE html>
<html>
	<head>
	
	
	<!-- AJAX点赞 -->
	<script type="text/javascript">
		$(function(){
			$(".btn").click(function(){
				var id = $(this).val();
				$.getJSON("likeadd",
						{'sdid':id,},
						function(data){
							console.log(data);
							var spid="#"+id;
							$(spid).next().text(data)
							
				});
				
			});
			
		});
	</script>
	
	
	
	
	</head>
	
	<body style>
		<!--个人信息标签-->
		<%-- <!--个人简单-->
		<div  >
			<div id="" class="img-circle" style="padding-left: 150px;padding-bottom: 0px;padding-top: 70px">
				<img src="http://192.168.3.136:8080/myimages/${CurrUser.userImg }" width= "100px" height="150px">
			</div>
		</div> --%>
		<!--动态留言区 -->
	
		<div id="" class="container">
		<!-- 我要发表动态 -->
			<form action="pubw" method="get">
				<div class="row clearfix" style="opacity: 0.8">
					<div class="col-md-12 column">
						<div class="jumbotron"  style="margin-top: 70px	;">			
							<p>
								<input type="text" class="form-control" name="cont" placeholder="你想说...">
							</p>
							<c:if test="${not empty CurrUser }">
							
							<p >
								<button  class="btn btn-primary"  type="submit" >发表	</button>
							</p>
							</c:if>
						</div>
					</div>
				</div>
			</form>
			
			<!-- 别人+我的动态 -->
			
			<c:forEach var="page"  items="${pages.data }" varStatus="status">
			
				<div class="row clearfix" style="opacity: 0.8">
					<div class="col-md-12 column" style="margin-top: -10px">
						<div class="jumbotron">
								
								<img src="http://106.14.174.178:8080/myimages/${page.user.userImg }" class="img-thumbnail" width="50px" /><a href="hisPage?id=${page.user.id}">${page.user.username }</a>:
								<span style="margin-left:700px ;">${page.gettime }</span>
							<p>
								${page.content }
							</p>
							<c:if test="${CurrUser.id==page.uid }">
							<p>
								<a class="btn btn-primary btn-large float-right" href="del?did=${page.did }">删除</a>
							</p>
								
							</c:if>
							
							<a href="rep?did=${page.did }" style="margin-right: 50px" class="btn btn-primary btn-large float-right float-right">查看回复</a>			
							
								<button type="button" class="btn btn-default btn-lg" id=${page.did } value="${page.did }"  >
									<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>求赞
								</button>:<span id="like" >${page.likenum }</span>
						</div>
					
					</div>
				</div>		
			</c:forEach>			
		</div>
		<!--分页-->
		<div id="" class="container" style="text-align:center">
			<ul class="pagination">
				<li class="page-item">
					<a class="page-link" href="#">&lt;</a>
				</li>
				<c:forEach var="i" begin="1" end="${pages.pagecount}">
					<c:if test="${i==currpage}">
						<li class="page-item active">
							<a class="page-link" href="content?curr=${i}">${i}</a>
						</li>
					</c:if>
					
					<c:if test="${i!=currpage}">
						<li class="page-item">
							<a class="page-link" href="content?curr=${i}">${i}</a>
						</li>
					</c:if>
				</c:forEach>				
				<li class="page-item">
					<a class="page-link" href="#">&gt;</a>
				</li>
			</ul>
		</div>
	
	</body>
<%@ include file="footer.jsp" %>
</html>