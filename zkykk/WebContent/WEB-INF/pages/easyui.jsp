<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/jquery-easyui-1.4.1/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>js/jquery-easyui-1.4.1/themes/icon.css">
<script type="text/javascript"
	src="<%=basePath%>js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<title>增删改查页面</title>
<style type="text/css">
  body{
            overflow:scroll;
            overflow-x:hidden;
            overflow-y:hidden;
        }
.title {
	text-align: center;
}

.bottom {
	float: right;
}

.row {
	height: 40px;
	width: 100%;
}

.column1 {
	height: 40px;
	width: 49%;
	float: left;
	border: 1px solid green;
	border-bottom: none;
	border-right: none;
	text-align: center;
	line-height: 40px;
	font-weight: bold;
	font-family: "微软雅黑";
	/* background:gray; */
}

.column2 {
	height: 40px;
	width: 50%;
	float: left;
	border: 1px solid green;
	border-bottom: none;
	text-align: center;
	line-height: 40px;
}

.input {
	/* border-radius:5px; */
	text-align: center;
	line-height: 20px;
	color: blue;
}
</style>
</head>


<body>
		<table id="form" class="easyui-datagrid" title="中国科学院苏州电子学研究所" style="width:100%;height:580px">
		</table>
		<div id="tb" style="padding: 5px; height: 60px;">
			<br /> 请输入名称：<input id="sname" type="text"
				style="height: 20px; border: 1px solid green;" />&nbsp;
			<lable style="font-weight:bold;">或者</lable>
			&nbsp;请输入城市代码：<input id="scountrycode" type="text"
				style="height: 20px; border: 1px solid green;" />&nbsp;&nbsp; <a
				id="search" href="#" class="easyui-linkbutton" style="width: 8%;">查询</a>
			<a id="add" href="#" class="easyui-linkbutton" style="width: 8%;">新增</a>
			<a id="delete" href="#" class="easyui-linkbutton" style="width: 8%;">删除</a>
			<a id="downloadexcel" href="#" class="easyui-linkbutton"
				style="width: 8%;">下载excel</a>
		</div>

		<div id="window" style="display: none; height: 100%; width: 100%;">
			<div class="row">
				<div class="column1">ID</div>
				<div class="column2">
					<input id="idd" readonly="readonly" disabled="true" class="input"
						type="text" />
				</div>
			</div>
			<div class="row">
				<div class="column1">城市名称：</div>
				<div class="column2">
					<input id="name" class="input" type="text" />
				</div>
			</div>
			<div class="row">
				<div class="column1">城市代码：</div>
				<div class="column2">
					<input id="countrycode" class="input" type="text" />
				</div>
			</div>
			<div class="row">
				<div class="column1">所属区域：</div>
				<div class="column2">
					<input id="district" class="input" type="text" />
				</div>
			</div>
			<div class="row">
				<div class="column1" style="border-bottom: 1px solid green;">
					人口总数：</div>
				<div class="column2" style="border-bottom: 1px solid green;">
					<input id="population" class="input" type="text" />
				</div>
			</div>
			<br />
			<button id="addandupdate" style="margin-left: 250px; height: 20px;">提交</button>
		</div>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#window").window({
			title : '城市信息修改',
			width : 400,
			height : 280,
			top : 200,
			minimizable : true,
			maximizable : true,
			collapsible : true
		});
		$("#window").window('close');
		search();
	});

	$('#form').datagrid({
		columns : [ [ {
			field : 'ck',
			checkbox : true,
			width : 100,
			align : 'center'
		}, {
			field : 'id',
			title : 'ID',
			width : 100,
			align : 'center'
		}, {
			field : 'name',
			title : '城市名称',
			width : 100,
			align : 'center'
		}, {
			field : 'countrycode',
			title : '城市代码',
			width : 100,
			align : 'center'
		}, {
			field : 'district',
			title : '所属区域',
			width : 100,
			align : 'center'
		}, {
			field : 'population',
			title : '人口总数',
			width : 100,
			align : 'center'
		}, ] ],
		fitColumns : true,
		checkbox : true,
		rownumbers : true,
		isField : "id",
		pagination : true,
		pageSize : 20,
		pageList : [ 20, 25, 30 ],
		toolbar : '#tb',
	});

	$("#form").datagrid({
		onClickRow : function(index, row) {
			$("#window").window('open');
			var floatwindow = document.getElementById("window");
			floatwindow.style.display = 'block';
			$("#idd").val(row.id);
			$("#name").val(row.name);
			$("#countrycode").val(row.countrycode);
			$("#district").val(row.district);
			$("#population").val(row.population);
		}
	});

	$("#add").click(function() {
		$("#window").window('open');
		var floatwindow = document.getElementById("window");
		$("#idd").val('');
		$("#name").val('');
		$("#countrycode").val('');
		$("#district").val('');
		$("#population").val('');
		floatwindow.style.display = 'block';
	});

	$("#search").click(function() {
		search();
	});

	function search() {
		var url = getContextPath() + "/city/getcitiesbypaging.do";
		$("#form").datagrid(
				{
					"url" : url,
					"method" : 'GET',
					"queryParams" : {
						"type" : "search",
						"name" : ($("#sname").val() == null) ? "" : $.trim($("#sname").val()),
						"countrycode" : ($("#scountrycode").val() == null) ? "": $.trim($("#scountrycode").val())
					}
				});
	}

	$("#delete").click(function() {
		$.messager.confirm("确认", "你确认删除吗？", function(r) {
			if (r) {
				bachDeleteCities();
			}
		});
	});

	function bachDeleteCities() {
		var url = getContextPath() + "/city/deletecities.do";
		var checkedItems = $("#form").datagrid('getChecked');
		var ids = [];
		$.each(checkedItems, function(index, item) {
			ids.push({
				"id" : item.id
			});
		});
		$.ajax({
			type : "POST",
			url : url,
			dataType : "json",
			contentType : "application/json;charset=uft-8",
			data : JSON.stringify(ids),
			async : true,
			success : function(data) {
				if (data.key == 'success') {
					$.messager.alert('操作提示', '成功刪除！');
					search();
				} else {
					$.messager.alert('操作提示', '刪除失败！');
					search();
				}
			}
		});
	}

	$("#addandupdate").click(function() {
		var flag = 'update';
		if ($("#idd").val() == '') {
			flag = 'add';
		}
		addandupdate(flag);
	});

	function addandupdate(flag) {
		if ($("#name").val() == '') {
			$.messager.alert('操作提示', '城市名称不能为空！');
			$("#name").focus();
		} else if ($("#countrycode").val() == '') {
			$.messager.alert('操作提示', '城市编码不能为空！');
			$("#countrycode").focus();
		} else if ($("#district").val() == '') {
			$.messager.alert('操作提示', '区域不能为空！');
			$("#district").focus();
		} else if ($("#population").val() == '') {
			$.messager.alert('操作提示', '人口不能为空！');
			$("#population").focus();
		} else {
			var url = getContextPath() + "/city/addandupdatecity.do";
			var data = {
				"flag" : flag,
				"id" : ($("#idd").val() == '') ? 0
						: new String($("#idd").val()),
				"name" : new String($("#name").val()),
				"countrycode" : new String($("#countrycode").val()),
				"district" : new String($("#district").val()),
				"population" : new String($("#population").val())
			};
			$.ajax({
				type : "POST",
				url : url,
				dataType : "json",
				contentType : "application/json;charset=uft-8",
				data : JSON.stringify(data),
				async : true,
				success : function(data) {
					if (data.key == 'success') {
						$.messager.alert('操作提示', '操作成功！');
						$("#window").window('close');
						search('search');
					} else {
						$.messager.alert('操作提示', '操作失败！');
						$("#window").window('close');
						search('search');
					}
				}
			});
		}
	}

	//下载Excel报表
	$("#downloadexcel").click(
			function() {
				var name =  ($("#sname").val() == null) ? "" : $.trim($("#sname").val());
				var countrycode =  ($("#scountrycode").val() == null) ? "" : $.trim($("#scountrycode").val());
				var options = $("#form").datagrid("getPager").data("pagination").options;
				var page = options.pageNumber;
				var rows = options.pageSize;
				var type = 'download';
				var url = getContextPath()
						+ "/city/getcitiesbypaging.do?type=" + type
						+ "&&page=" + page + "&&rows=" + rows + "&&name="
						+ name + "&&countrycode=" + countrycode ;
				window.open(url, "_self");//打开下载窗口

			});

	function getContextPath() {
		var pathName = document.location.pathname;
		var index = pathName.substr(1).indexOf("/");
		var result = pathName.substr(0, index + 1);
		return result;
	}
</script>
</html>


