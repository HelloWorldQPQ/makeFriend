<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 3秒一刷新  -->
<!--<meta  http-equiv="refresh" content="3" /> -->
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css" media="screen"
	type="text/css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src='js/jquery.js'></script>
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
<!-- <link rel="stylesheet" href="kindeditor/themes/default/default.css" /> -->
<link rel="stylesheet" href="kindeditor/themes/simple/simple.css" />



<!-- <script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="context"]', {
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
</script> -->
<style type="text/css">
textarea {
	background: -webkit-linear-gradient(-45deg, #183850 0, #183850 25%, #192c46 50%,
		#22254c 75%, #22254c 100%);
	color: white;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$("#convo ul").scrollTop($("#convo ul")[0].scrollHeight);
	});
	
	
</script>

</head>
<body>
	
	<div id="convo" data-from="Sonu Joshi">
		<ul class="chat-thread">
			<c:if test="${not empty paging }">
				<c:forEach var="msg" items="${paging.data }">
					<li>${msg.context }</li>
				</c:forEach>
			</c:if>

		</ul>
	</div>
	<div style="text-align: center; clear: both"></div>
	<div class="container" style="margin-left: 350px; margin-top: 20px">
		<form action="pub" method="post">
			<!-- <fieldset> -->
			<textarea rows="3" cols="70" name="context" placeholder="请输入留言的内容"></textarea>
			<br>
			<button>发布留言</button>
			<!-- </fieldset> -->
		</form>
	</div>
</body>
</html>