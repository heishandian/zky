<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	//设置无缓存
	response.addHeader("Progma","no-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires",0);
	response.setHeader("Pragma", "no-cache");   
	response.setHeader("Cache-Control", "no-store");  
	response.setHeader("Cache-Control", "must-revalidate");
%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="utf-8">
<title>登录</title>
<link rel="stylesheet" href="<%=basePath %>css/supersized.css">
<link rel="stylesheet" href="<%=basePath %>css/login.css">
<link href="<%=basePath %>css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=basePath%>js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/login/login.js"></script>
<script type="text/javascript" src="<%=basePath%>js/layer/layer.js"></script>
</head>
<body>

<div class="page-container">
	<div class="main_box">
		<div class="login_box">
			<div class="login_logo">
				<h1>用户登录</h1>
			</div>
			<div class="login_form">
				<form action="#" id="login_form" method="post">
					<div class="form-group">
						<label for="j_username" class="t">账　号：</label> 
						<input id="loginusername" value="" name="loginusername" type="text" class="form-control x319 in" 
						autocomplete="off">
					</div>
					<div class="form-group">
						<label for="j_password" class="t">密　码：</label> 
						<input id="loginuserpwd" value="" name="loginuserpwd" type="password" 
						class="password form-control x319 in">
					</div>
					<div class="form-group space" style="text-align: center;">
						<label class="t"></label>　　　
						<button type="button"  id="submit_btn" class="btn btn-primary btn-lg">&nbsp;登&nbsp;录&nbsp; </button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>

<!-- <script type="text/javascript">
layer.alert('shen lan', {
    skin: 'layui-layer-lan'
    ,closeBtn: 0
    ,anim: 1 //动画类型
  });
//layer.msg('wan ming jia zai zhong ');
</script> -->
</html>