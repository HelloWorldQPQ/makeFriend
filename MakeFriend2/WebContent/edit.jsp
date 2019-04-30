<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="header.jsp" %> --%>
<div>
	<form action="edit" method="post">
		<fieldset>
			<legend>修改用户状态</legend>
			<h2 style="color:Red;">${Err}</h2>
			当前用户：${User.username}
			<!-- <br /> -->&nbsp;&nbsp;&nbsp;&nbsp;
			用户id:<input type="text" name="id" value="${User.id}" readonly="readonly" style="width:30px"/> <!--    -->
			<!-- <br /> -->&nbsp;&nbsp;&nbsp;&nbsp;
			用户状态：<input name="state" placeholder="${User.state}" style="width:30px">
			<br />
			<button>保存</button>
		</fieldset>
	</form>
</div>

<%-- <%@ include file="footer.jsp" %> --%>