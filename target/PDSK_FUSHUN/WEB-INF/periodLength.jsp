<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>时段</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/font-awesome.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/jquery-ui-1.10.3.custom.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-rtl.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-skins.min.css" />

<style type="text/css">
html{
	background-color: white;
}

#select{
	line-height:20px;
	padding: 5px 10px 5px 10px; 
	border:1px solid #ccc;
	outline:none;
	border-radius: 10px 10px 10px 10px; 
}
span{
	color:red;
	font-weight: bold;
} 
p{
	font-size: 20px; 
	color:black;
}
h1{
	color:red;
	font-weight: bold;
}

#select{
	padding: 0px 10px 0px 30px; 
	outline:none; 
	border-radius: 10px 10px 10px 10px; 
	width: 100px;
	border: 1px solid #307ECC; 
	line-height:30px;
}
</style>
</head>
<body>
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i><a href="<%=request.getContextPath()%>/summary" target="right">首页</a></li>
			<li> 
				<c:if test="${model==2}">后台管理</c:if>
				<c:if test="${model!=2}">工程信息</c:if>&nbsp;
			<li class="active">
				<c:if test="${model==2}">时段管理</c:if>
				<c:if test="${model!=2}">时段长度</c:if>
			</li>
		</ul> 

	</div>

	<div class="page-content"> 
		 <div class="row">
			 <div class="col-xs-12">
				<div class="table-header">
					 <small>
						 <c:if test="${model==2}">时段管理</c:if>
						 <c:if test="${model!=2}"> 时段长度</c:if>
					</small>
				</div>

				<form action="/periodLength" method="post">
					<div class="page" align=center>
						<h5>${msg}</h5>
					</div>
					<p>由于大坝、边坡等水利水电工程安全监测的规模和自动化程度要求越来越高,传统的一些形变监测方法日益凸现出其弱点。
						GPS因其速度快、效率高、施测便捷等优势已成为当今最先进的形变监测手段之一。GPS安全监测系统在数据采集、传送、
						处理和分析的自动化很容易实现。随着近年来导航定位技术的不断发展,GPS卫星定位技术受到了国内外学术界的广泛重视,
						利用北斗卫星和GPS组合进行定位成为提高GPS定位精度的有效途径之一，其应用前景相当广阔。采取新的技术和方法来进
						一步推广和拓展卫星定位技术的应用,对提高大坝和边坡等精密形变监测的自动化水平、促进我国水利水电事业的发展都有
						着重大意义。GNSS数据处理软件中的WEB程序负责数据的前台页面显示（浏览器），形成变形数据报表。供相关部门及时了
						解水库变形情况并提供相应的监测预警。</p><br>
					<c:if test="${model==2 }">
						<input type="hidden" name="id" value="${time.id}">
						<p>当前更新时长为
							<select name="time" id="select">
								<option selected="selected">${time.time}</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="4">4</option>
								<option value="6">6</option>
								<option value="8">8</option>
								<option value="12">12</option>
								<option value="24">24</option>
							</select>
							<input type="hidden" name="model" value="2">小时
						</p><br>
						<button type="submit" class="btn btn-primary">修改时间提交</button>
					</c:if>
					<c:if test="${model==1 }">
						<h3>
							当前更新时长为<span class="" style="color: #307ECC;">${time.time}</span>小时
						</h3>
					</c:if>
				</form>
			 </div>
		 </div>
	</div>

	<!-- 优化响应 -->
	<script type="text/javascript">
		window.jQuery || document.write("<script src='static/assets/js/jquery-2.0.3.min.js'>" + "<"+"/script>");
	</script>

	<script type="text/javascript">
		if ("ontouchend" in document)
			document.write("<script src='static/assets/js/jquery.mobile.custom.min.js'>" + "<"+"/script>");
	</script>

	<script src="<%=request.getContextPath()%>/static/assets/js/ace-extra.min.js"></script>

	<script src="<%=request.getContextPath()%>/static/js/jquery-3.2.1.min.js"></script>

	<script src="<%=request.getContextPath()%>/static/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/assets/js/typeahead-bs2.min.js"></script>

	<script src="<%=request.getContextPath()%>/static/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/assets/js/jquery.ui.touch-punch.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/assets/js/jquery.slimscroll.min.js"></script>

	<!-- ace scripts -->
	<script src="<%=request.getContextPath()%>/static/assets/js/ace-elements.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/assets/js/ace.min.js"></script>

	<script type="text/javascript">
		jQuery(function($) {
			$('.accordion').on('hide', function(e) {
				$(e.target).prev().children(0).addClass('collapsed');
			});
			$('.accordion').on('show', function(e) {
				$(e.target).prev().children(0).removeClass('collapsed');
			})
		});
	</script>
	<div style="display: none"></div>
</body>
</html>