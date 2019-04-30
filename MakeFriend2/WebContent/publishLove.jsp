<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript">
	window.onload=function(){
	var textarea = document.getElementsByTagName("textarea")[0];
	textarea.scrollTop=textarea.scrollHeight
	}
</script>
	<style>
		textarea{width:400px}
	</style>

<div style="background-image:url(shouye/bg2.jpg)">
	<%@include file="header.jsp"%>
	<form action="publishlove" enctype="multipart/form-data"  method="post">
		<fieldset style="margin-left:50px">
			<legend>晒恩爱</legend>
			<h1 style="color:Red;">${Err}</h1>
			<h2>当前用户 ${CurrUser.username}</h2>
			<br />
			
				
				<div class="row">
					<h3 style="margin-left:18px">我和TA<span style="margin-left:400px">我们的爱情故事:</span></h3>
					
					<div class="col-md-5" style="width:280px;height:280px; background-color:pink;margin-left:48px" >
						
						<c:if test="${not empty success.img }">
							<img src="http://106.14.174.178:8080/success/${success.img}" class="rounded-circle"style="width:260px;height:260px;margin-top:10px;margin-left:-5px">
						</c:if>
						<c:if test="${empty success.img }">
							<input type="file" accept="image/*" name="file1">
							
						</c:if>
					</div>
					
					<div class="col-md-3" style="margin-left:110px">
					
					</div>
					<div class="col-md-5"style="margin-left:-150px">
						<c:if test="${empty success.content }">
						<textarea rows=15 name="content"></textarea>
							<!-- <input type="text" style="width:480px;height:100px;" name="content" /> -->
						</c:if>
						<c:if test="${not empty success.content }">
						<textarea rows=15 name="content">${success.content }</textarea>
							<%-- <input type="text" style="width:480px;height:100px;" name="content" value="${success.content }"/> --%>
						</c:if>
					</div>
					<button style="margin-top:400px;background-color:pink">提交爱的信号</button>
				</div>			
		</fieldset>
		
	</form>
	<%@include file="footer.jsp"%>
</div>
