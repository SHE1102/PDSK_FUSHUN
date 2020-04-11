<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>单次报表</title>
	<style type="text/css">
	*{
		margin: 0px;
		padding: 0px;	
	} 
	</style>
</head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/bootstrap.min.css">
<body id="body">
	<!--
	<div class="page" align=center> 工程概况  </div>
	 -->

	<!--
	茜坑水库位于观澜街道东南约5km处，茜坑河上游，库内地势平缓，植被较好。<br>
	水库建成于1995年，于2000年经过扩建，水库集雨面积4.98平方公里，正常蓄水位75.0m，总库容1917万立方米。茜坑水库大坝由1条主坝和4条副坝组成，均为均质土坝。<br>
	茜坑水库主坝顶轴长388.1米，坝顶高程76.8米，最大坝高28.8米.<br>
	茜坑水库大坝GNSS全天候变形监测系统于2015年7月建成。系统在主坝布设GNSS变形监测点12个，基准站1个，可对茜坑水库主坝表面位移进行实时、高精度、全天候、自动化变形监测。
    -->
	<div>${txt}</div>
	<!-- <div  id="bg"> 
	</div>  -->  
	<!-- <div>
		<img alt="" src="img/xikeng.jpg" width="1300px;">
	</div> -->
	
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/js/jquery.nicescroll.js"></script>
        <script type="text/javascript">
            $('#body').niceScroll({
                cursorcolor: "#ccc",//#CC0071 光标颜色
                cursoropacitymax: 1, //改变不透明度非常光标处于活动状态（scrollabar“可见”状态），范围从1到0
                touchbehavior: false, //使光标拖动滚动像在台式电脑触摸设备
                cursorwidth: "5px", //像素光标的宽度
                cursorborder: "0", // 	游标边框css定义
                cursorborderradius: "5px",//以像素为光标边界半径
                autohidemode: false //是否隐藏滚动条
            });
    	 </script> 
     
</body> 
</html>