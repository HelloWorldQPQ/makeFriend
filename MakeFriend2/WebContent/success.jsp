<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
	
		<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />

<style>
	.panel-body {
	   border-width: 0px;
	   
	}
	
	.row {
	    margin-right: -15px;
	    margin-left: -15px;
	     margin-top:20px;
	}
</style>

<div style="background-image:url(shouye/bg2.jpg)">



<div class="container" >
	
	<c:if test="${not empty paging}">

		<div class="row">
			<div class="col-md-12">
				<c:forEach var="success" items="${paging.data}">

					<!-- panel begin -->
					<div class="panel panel-default">
						<div class="panel-heading" style="heght:30px">
							<h3 class="panel-title">
								<img src="http://106.14.174.178:8080/myimages/${success.user.userImg}"style="width:28px;height:28px">
								<a href="upload">${success.user.username}</a> &nbsp;&nbsp;&nbsp;${success.user.sex}&nbsp;&nbsp;&nbsp;发布时间:${success.ptime }

								<c:if test="${CurrUser.id == success.user.id  }">
									<a href="dellove?sid=${success.sid}">删除</a>
								</c:if>
							</h3>
						</div>
					
						<div class="panel-body">
							<div class="row" style="height:300px">
								<div class="panel-body col-md-4"><img src="http://106.14.174.178:8080/success/${success.img}"style="width:200px;height:200px;margin-left:30px"></div>
								<div class="panel-body col-md-7" style="margin-right:25px"><span style="font-size:22px;color:pink"><b>我的爱情故事:</b></span>${success.content}</div>
							</div>
						</div>
				
					</div>
				</c:forEach>

			</div>
		</div>

		<div class="row">
			<div class="col-md-6" style="margin-left:420px">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><span>当前页/总页数:
								${paging.currPage}/${paging.pageCount} 总记录数:${paging.rowsCount}</span>
						</li>
						<li><a href="success?p=${paging.currPage-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>

						<c:forEach var="i" begin="1" end="${paging.pageCount }">
							<li><a href="success?p=${i}">${i}</a></li>
						</c:forEach>
						<li><a href="success?p=${paging.currPage+1}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>


	</c:if>
	<%@ include file="footer.jsp"%>
</div>
<!-- </form> -->
</div>