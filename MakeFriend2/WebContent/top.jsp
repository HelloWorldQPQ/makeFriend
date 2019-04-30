<!--<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>-->
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <title>万爱网管理员登陆</title>
    </head>
    <body>
    	<div style="background: url(img/05.jpg);width: 100%;height: 120px;">
    		<h1 style="padding: 10px 0 0 0px;text-align:center; color: #FFFFFF;">One爱网管理员登陆</h1>
    		<form method="post" action="bb" style="float: right;">
    			<button>搜索</button>
      			<input type="text" placeholder="Search" style="margin: 0 50px 0 0;" name="uname">
      		</form>
    	</div>
    	<!--<br />-->
    	<div style="background: #00BBEE; height: 30px;margin: 5px 0 5px 0;">
    		<h4 style="text-align: center;padding: 4px 0 0 0;">用户列表</h4>
    	</div>
    	    		<c:if test="${not empty lname }">   	    		
    	
    	<table  border="1px" cellspacing="0px" bordercolor="gray" width=100% height="150px">
        <!-- style="background: 100%;background-image: url('../../img/logo.png')"  align="center" -->
    		<tr style="text-align: center;height: 40px;">
    			<td>用户(id)</td>
    			<td>用户名(username)</td>
    			<td>性別(sex)</td>
    			<td>身高(high)</td>
    			<td>体重(weight)</td>
    			<td>邮箱(email)</td>
    			<td>电话(phone)</td>
    			<td>状态(statue)</td>
    			<td>信息操作</td>
    			<td colspan = 2>修改状态</td>
    			
    		</tr>
    		<c:forEach var="uu" items="${lname.data}">
    		<tr style="text-align: center;height: 40px;">
    			<td>${uu.id }</td>
    			<td>${uu.username }</td>
    			<td>${uu.sex }</td>
    			<td>${uu.height }公分</td>
    			<td>${uu.weight }KG</td>
    			<td>${uu.email }</td>
    			<td>${uu.phone }</td>
    			<td>${uu.state }</td>
    			
    			<td><a href="delUser?id=${uu.id}">删除</a></td>
    			<td><a href="edit?id=${uu.id}">封号</a></td>
    			<td><a href="edit?id=${uu.id}">解封</a></td>
    		</tr>
    		</c:forEach>
    	
    		<%-- <c:forEach var="uu" items="${Luser.data}">
    		<tr style="text-align: center;height: 40px;">
    			<td>${uu.id }</td>
    			<td>${uu.username }</td>
    			<td>${uu.state }</td>
    			<td><a href="edit?id=${uu.id }"></a></td>
    			<td><a href="del?id=${uu.id }"></a></td>
    		</tr>
    		</c:forEach> --%>
    	
    	</table>
    	<!--<div style="background: #0052A3;width: 10%;height: 500px;">
    		<span style="color: #FFFFFF;">人员查询</span><br />
    		<span style="color: #FFFFFF;">人员管理</span>
    	</div>-->
    	<div class="row">
				<div class="col-md-12">
					<nav aria-label="Page navigation" style="text-align:center">
					  <ul class="pagination">
					    <li>
					      <a href="bb?p=${lname.currPage-1}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    
					    <c:forEach var="i" begin="1" end="${lname.pageCount }">
					    <li><a href="bb?p=${i}">${i}</a></li>
					    </c:forEach>
					    <li>
					      <a href="bb?p=${lname.currPage+1}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>	
				</div>			
			</div>
    		</c:if>
    		
 	</body>
 	
</html>
