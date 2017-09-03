<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	//设置无缓存
	response.addHeader("Progma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Cache-Control", "must-revalidate");
%>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
 <base href="<%=basePath%>"/>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
 <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css" />
<link rel="stylesheet" href="<%=basePath%>css/dtree.css" type="text/css"/> 
<script type="text/javascript" src="<%=basePath%>js/jquery-ui-1.8.16.custom.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/dtree/dtree.js"></script>
<script type="text/javascript">
	function screenAdapter() {
		document.getElementById('navigator').style.height = document.documentElement.clientHeight
				- 200 + "px";
		document.getElementById('main').style.height = document.documentElement.clientHeight
				- 200 + "px";
	}

	window.onscroll = function() {
		screenAdapter();
	};
	window.onresize = function() {
		screenAdapter();
	};
	window.onload = function() {
		screenAdapter();
	};
</script>
	
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<div id="logo"></div>
			<table style="border:1px">
				<tr style="height:38px;">
					<td></td>
					<td></td>
				</tr>
				<tr style="height:50px;">
					<td width="450px" align="center"
						style="vertical-align:top;font-size:28px;align:left;text-shadow:Red;font-family:'黑体';">苏研院城市信息管理平台</td>
					<td>
					   <img src="<%=basePath%>images/sdnum_2.jpg" style="margin-left:100px;"> 
					   <img src="<%=basePath%>images/sdnum_3.jpg"> 
					   <a href="<%=basePath%>/system/login.do" style="cursor:pointer">
					   <img src="<%=basePath%>images/sdnum_4.jpg"> </a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div id="navigator">
		<script type="text/javascript">
		    //日常管理、档案管理、报表查询
		    tree = new dTree('tree');
		    tree.add(0,-1,'管理系统目录');
		    tree.add(1,0,'城市信息管理');
		    tree.add(6,1,'基本信息','${pageContext.request.contextPath}/city/gotoeasyuipage.do','','ifm');
			tree.add(7,1,'人口分析','${pageContext.request.contextPath}/analysis/gotopopuanalysisdiagrampage.do','','ifm');
			tree.config.folderLinks=false;
			tree.config.closeSameLevel = false;
			tree.config.useIcons = true;
			document.write(tree);
		</script>
	</div>

	<div id="main" >
		 <iframe name="ifm" class="main" src="<%=basePath%>city/gotoeasyuipage.do"></iframe> 
	</div>
	<div style="font-family:'微软雅黑';text-align: right;">GVC小组：黄凯，徐向阳，李焜，忘了后面那几个叫啥名字了</div>
</body>
</html>