<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>消息</title>


<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<!--导入jQuery-->
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<!--导入popper 用于弹窗 提示、下拉框 -->
<script type="text/javascript" src="js/popper.min.js"></script>
<!--导入bootstrap js文件-->
<script type="text/javascript" src="js/bootstrap.js"></script>


</head>
<body>


<div class="container" style="height:700px">

	<!-- 未读切换按钮 -->
	<div class="row" style="margin-top: 0px;">
		<div class="btn-group" role="group" aria-label="btngroup">
			<button type="button" class="btn btn-warning active">未读</button>
			<a type="button" class="btn btn-warning" href="msgbord1">全部</a>

		</div>


	</div>

	<div id="onemsg" class="container-fluid"
		style="width: 70%; margin-top: 10px;">
		<div>
			<!--消息-->
			<c:forEach var="lmsg" items="${paging.data}">
				<div id="panel" class="panel panel-info" >
					<div class="panel-heading ">来自：<a href="hisPage?id=${lmsg.sendUser.id}">${lmsg.sendUser.username}</a>&nbsp;&nbsp;时间:${lmsg.getCreate_date()}</div>
					<div class="panel-body">${lmsg.context}</div>
					<div class="panel-footer" style="text-align: right;">
						<a href="pub?recId=${lmsg.sendUser.id}&sendId=${CurrUser.getId()}" class="btn btn-default">回复</a>
						<a href="hasRead?id=${lmsg.getId()}" class="btn btn-default">标记为已读</a>

					</div>
				</div>
			</c:forEach>
		</div>

		

		<div class="container-fluid" style="text-align: center">
			<!-- 分页 -->
			<c:if test="${pagingSize>0}">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:forEach var="i" begin="1" end="${paging.pageCount}">
					
						<!-- 上一页 -->
						<c:if test="${i==1}">
							<c:if test="${i==curPage}">
								<li class="disabled">	
									<a href="msgboard?p=${paging.currPage-1}" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							<c:if test="${i!=curPage}">
								<li>	
									<a href="msgboard?p=${paging.currPage-1}" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
						</c:if>
						
						<!-- 当前页 -->
						<c:if test="${i==curPage}">
							<li class="active"><a href="msgboard?p=${i}">${i}</a></li>
						</c:if>
						<c:if test="${i!=curPage}">
							<li ><a href="msgboard?p=${i}">${i}</a></li>
						</c:if>
						
						<!-- 下一页 -->
						
							<c:if test="${i==paging.pageCount}">
								<c:if test="${i==curPage}">
									<li class="disabled">
										<a href="msgboard?p=${paging.currPage+1}" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:if>
								<c:if test="${i!=curPage}">
									<li>
										<a href="msgboard?p=${paging.currPage+1}" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:if>
							</c:if>
							
						
					</c:forEach>
				</ul>
			</nav>
		</c:if>


		</div>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
