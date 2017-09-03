<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
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
<head lang="en">
<meta charset="utf-8">
<title>城市人口分析</title>
<script type="text/javascript" src="<%=basePath%>js/layer/layer.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery/jquery-1.9.1.min.js"></script>
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

.month {
	width: 130px;
	border-radius: 5px;
	border: 1px solid #95b8e7;
	height: 22px;
	text-align: center;
}

.btn {
	width: 80px;
	border-radius: 5px;
	border: 1px solid #95b8e7;
	height: 22px;
	text-align: center;
}

.message {
	
}
</style>
</head>
<body>
	<div id="main" style="margin-top:50px; width: 100%; height: 100%;">
		<div id="e" style="width: 95%; height: 500px;"></div>
	</div>
	<script src="<%=basePath%>js/echarts/echarts-all.js"></script>
	<script type="text/javascript">
		$("document").ready(function() {
			getEcharts();
		});

		function getEcharts() {
			var url = getContextPath() + "/analysis/getpopuanalysisdata.do";
			$.ajax({
						type : "GET",
						url : url,
						dataType : "json",
						contentType : "application/json;charset=uft-8",
						async : true,
						success : function(dat) {
							var myChart = echarts.init(document
									.getElementById("e"));
							var option = {
								title : {
									text : '城市人口分析图',
									x : 'center',
									y : 'top'
								},
								tooltip : {
									trigger : 'axis',
									formatter : function(params) {
										 return '<strong>城市数：</strong>' + params[0].data ;
									}
								},
								//右上角工具条
								toolbox : {
									show : true,
									feature : {
										mark : {
											show : true
										},
										dataView : {
											show : true,
											readOnly : false
										},
										magicType : {
											show : true,
											type : [ 'line', 'bar' ]
										},
										restore : {
											show : true
										},
										saveAsImage : {
											show : true
										}
									}
								},
								xAxis : [ {
									name : '人口数*10^4',
									type : 'category',
									boundaryGap : false,
									data : dat.data.x,
									axisTick : {
										alignWithLabel : true
									}
								} ],
								yAxis : {
									axisPointer : {
										label : {
											show : false
										}
									},
									min : 'dataMin',
									max : 'dataMax',
									interval : 2,
									position : 'left',
									type : 'value',
									name : '城市数/个',
									minInterval : 1,
									lineStyle : {
										type : 'dashed'
									},
									width : 5,
									splitNumber : 10,
									/*   axisLabel : {
									      formatter: '{value} KM'
									  }, */
									axisTick : false
								},
								series : [ {
									type : 'line',
									data : 	dat.data.y,
									markPoint : {
										data : [ {
											type : 'max',
											name : '最大值'
										}, {
											type : 'min',
											name : '最小值'
										} ]
									},
									itemStyle : {
										normal : {
											color : '#ff4443',
											lineStyle : {
												color : '#3cff32'
											}
										}
									},
									markLine : {
										color : '#3cff32',
										data : [ {
											type : 'average',
											name : '平均值'
										} ]
									}
								} ]
							};
							myChart.clear();
							myChart.setOption(option);
						}
					});
		}
		
		 function getContextPath() {
	            var pathName = document.location.pathname;
	            var index = pathName.substr(1).indexOf("/");
	            var result = pathName.substr(0, index + 1);
	            return result;
	        }
	</script>
</body>
</html>