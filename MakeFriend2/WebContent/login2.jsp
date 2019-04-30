<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员</title>

<script src="js/jquery-3.3.1.min.js"></script>
		<link rel="stylesheet" href="css1/bootstrap.min.css" type="text/css" />
		<script src="js1/bootstrap.min.js" type="text/javascript"></script>
</head>
<body  style="background: #278296">
<form method="get" action="login2">
	<table cellspacing="0" cellpadding="0" style="margin-top: 100px;" align="center">	
  <tr>
    <td style="padding-left: 50px">
      <table>
      <thead><h2 style="color:white;letter-spacing:10px;">管理员登陆：</h2></thead>
      <tr>
        <td style="color:white;">管理员姓名：</td>
        <td><input type="text" name="username" /></td>
      </tr>
      <tr>
        <td style="color:white;">管理员密码：</td>
        <td><input type="password" name="password" /></td>
      </tr>
      <tr><td>&nbsp;</td><td><input type="submit" value="进入管理中心" class="button" /></td></tr>
      </table>
    </td>
  </tr>
  </table>
  </form>
</body>
</html>