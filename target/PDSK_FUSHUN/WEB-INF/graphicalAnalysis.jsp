<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>图形分析</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link href="<%=request.getContextPath()%>/static/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/jquery-ui-1.10.3.custom.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-skins.min.css" />
    
<!-- <script src="assets/js/ace-extra.min.js"></script> --> 
<!-- echarts(js) -->
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/echarts.min.js"></script>
<!-- 日历插件 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/static/DatePicker/WdatePicker.js"></script>
 
<style type="text/css">
#hh {
	font-weight: bold;
}

#hh:HOVER {
	/* color: red;
	font-weight: bold; */
}

#tab {
	margin: 22px -25px;
	padding: 0px;
}
#sub{
	font-size: 10px;
	padding: 10px 10px 10px 10px;
	line-height:15px;
	font-weight: bold;
	width:80px;
	color: white;
	background-color: #307ECC;
	cursor: pointer;
	border:none;
	outline:none; 
	border-radius: 5px 5px 5px 5px; 
}
#select{
	line-height:20px;
	padding: 5px 10px 5px 10px; 
	border:1px solid #ccc;
	outline:none;
	border-radius: 10px 10px 10px 10px; 
} 
table tr th{
	text-align: center; 
}
table tr td{
	text-align: center;  
} 
#tab{
	margin:-15px -20px 0px -20px;
}
#table-tab{
	margin:-8px 0px 16px -2px; 
} 
#sample-table-2{
	margin: -2px 0px 0px 0px;
}
.navdown{
	background-color: red;
}
#tab{
	margin:2px -20px 0px -20px;
}
#myTab{
	margin: 9px 0px;
}
html{
	background-color: white;
}
/* #ta{
	margin: 10px 0px;
} */
</style>

</head>
<body>
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try {
				ace.settings.check('breadcrumbs', 'fixed')
			}catch (e) {  }
		</script>
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i><a href="<%=request.getContextPath()%>/ProjectSummary" target="right">首页</a></li>
			<li>&nbsp;形变监测  &nbsp;</li>
			<li class="active">&nbsp;图形分析</li>
		</ul>
		<!-- 加载首页 -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.2.1.min.js"></script>
		<!-- <script type="text/javascript">
			$('#home').on('click',function(){ 
				top.location='home.jsp'; 
			});
		</script> -->
		<!-- <div class="nav-search" id="nav-search">
			<form class="form-search">
				<span class="input-icon"><input type="text"
					placeholder="Search ..." class="nav-search-input"
					id="nav-search-input" autocomplete="off" /> <i
					class="icon-search nav-search-icon"></i> </span>
			</form>
		</div> -->
	<!-- <a href="#" class="pull-right btn-xs"><button type="button"
				class="btn btn-primary" id="btn" onclick=preview(1) >
				<i class="icon-print"></i>打印 </button>
		</a>  -->
	</div>
									
	<div class="page-content"> 
		<!-- <div class="page-header">		 
			<h1>数据查询 </h1>
		</div> -->
		 
		<div class="row">
			<div class="col-xs-12">  
				<div class="table-header" id="ta">
						 <small>图形分析</small>
				 </div>  
				
				<div class="tabbable">  
					<!--------------------------------------------------------------------------------------------------------------->
					 <script> 
						function preview(oper) 
						{ 
						if (oper < 10) 
						{ 
						bdhtml=window.document.body.innerHTML;//获取当前页的html代码 
						sprnstr="<!--startprint"+oper+"-->";//设置打印开始区域 
						eprnstr="<!--endprint"+oper+"-->";//设置打印结束区域 
						prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+18); //从开始代码向后取html 
						
						prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html 
						window.document.body.innerHTML=prnhtml; 
						window.print(); 
						window.document.body.innerHTML=bdhtml; 
						} else { 
						window.print(); 
						} 
						} 
					 </script> 
					<!-------------------------------------------------------------------------------------------------------------->
  					<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script> --%>
  					 
 					  <!-- <table class="table table-hover table-striped table-bordered"
						width="100%" cellpadding="1" cellspacing="1" id="table-tab">
						<tr id="table-tr">
							<td style="width: 15%"> -->
								<%--  <ul class="nav nav-tabs padding-18 tab-size-bigger" id="myTab">
									<li id="li1" class="active"><a href="<%=request.getContextPath()%>/GraphicalAnalysisWebs?on=1">单点多方向</a></li>
									<li id="li2"><a href="<%=request.getContextPath()%>/GraphicalAnalysisWebs?on=2">多点单方向</a></li>
								 </ul>   --%> 
								 
								 <c:if test="${queryInfo.pageModel == 1}">
									 <ul class="nav nav-tabs padding-18 tab-size-bigger" id="myTab">
										<li id="li1" class="active"><a href="<%=request.getContextPath()%>/graphicalAnalysis/1">单点多方向</a></li>
										<li id="li2"><a href="<%=request.getContextPath()%>/graphicalAnalysis/2">多点单方向</a></li>
									 </ul>  
								 </c:if>
								 
								 <c:if test="${queryInfo.pageModel == 2}">
									 <ul class="nav nav-tabs padding-18 tab-size-bigger" id="myTab">
										<li id="li1"><a href="<%=request.getContextPath()%>/graphicalAnalysis/1">单点多方向</a></li>
										<li id="li2" class="active"><a href="<%=request.getContextPath()%>/graphicalAnalysis/2">多点单方向</a></li>
									 </ul>  
								 </c:if>
								 
								<!-- <ul class="nav nav-tabs padding-18 tab-size-bigger" id="myTab">
									<li id="li1"><a data-toggle="tab" href="#faq-tab-1">单点多方向</a></li>
									<li id="li2"><a data-toggle="tab" href="#faq-tab-2">多点单方向</a></li>
								</ul> --> 
						<!-- </td>
						</tr>
					  </table>  --> 
					  
					   
					 <!--  <script type="text/javascript">  
	  					$('#li2').click(function(){ 
	  						$(this).addClass('active'); 
	  						$('#li1').removeClass('active');
	  					});
	  					$('#li1').click(function(){ 
	  						$(this).addClass('active');
	  						$('#li2').removeClass('active');
	  					}); 
  					</script> -->
 					<!-------------------------------------------------------------------------------------------------------------->
 
						<div class="tab-content no-border padding-24" id="tab">
							<!-- <div id="faq-tab-1" class="tab-pane fade in active"> -->
								<div class="page-content">
									<div class="row">
										<div class="col-xs-12">  
										<c:if test="${queryInfo.pageModel == 1}">
										<form action="<%=request.getContextPath()%>/graphicalAnalysis">
											<input type="hidden" name="pageModel" value="1">
												<div class="row">
													<div class="col-xs-12">
														 <!--  <div class="table-header">
															<small>单点多方向</small>  &nbsp;&nbsp; 
													<a href="#" onclick="window.print()"><button type="button"
															class="btn btn-primary">
															<i class="icon-print"></i>打印</button></a>
												</div>    -->
												<div class="table-responsive">
													<!-- table(1) -->
													<table id="sample-table-2" class="table table-striped table-bordered table-hover">
														<thead> 
															<tr>
															    <th>查询条件</th>
																<!-- <th>查询时间类型</th>
																<th>统计时间</th> -->
																<th>查询时间</th>
																<th>选中时间段</th>
																<th>基准站</th>
																<th>监测站 </th>
															</tr>
															<tr> 
																<td style="line-height: 15px;">
																	 <span style="position: relative;top: 5px;">
																		<select name="model" style="width:100px;" id="sel">
																		   <c:if test="${queryInfo.model !=null}">
																				<option selected="selected" value="${queryInfo.model }">
																				<%-- <c:if test="${deptTX ==1}">单点多方向</c:if> --%>
																					<c:if test="${queryInfo.model ==1}">单期变形量</c:if>
																					<c:if test="${queryInfo.model ==2}">累计变形量</c:if>
																				</option>
																		   </c:if>
																				<option value="1">单期变形量</option>
																				<option value="2">累计变形量</option>
																		</select>
																	</span>
																</td>
																<td class="center" style="line-height: 20px;position: relative;top:5px;">
																	<select id="selType" name="dateModel" style="width: 130px; ">
																		<c:if test="${queryInfo.dateModel !=null}">
																			<option selected="selected" value="${queryInfo.dateModel}">
																				<c:if test="${queryInfo.dateModel ==1}">日</c:if>
																				<c:if test="${queryInfo.dateModel ==2}">周</c:if>
																				<c:if test="${queryInfo.dateModel ==3}">月</c:if>
																				<c:if test="${queryInfo.dateModel ==4}">季度</c:if>
																				<c:if test="${queryInfo.dateModel ==5}">年度</c:if>
																			</option>
																		</c:if>
																		<option value="1">日</option>
																		<option value="2">周</option>
																		<option value="3">月</option>
																		<option value="4">季度</option>
																		<option value="5">年度</option>
																	</select>
																	&nbsp;<span class="sp">-</span>&nbsp;
																
																<input id="startTime" class="Wdate" style="height: 30px;width:130px;" readonly="true" value="${queryInfo.timeStart}" onclick="createWdatePicker();" onfocus="createWdatePicker();" />
																	<i style="position: relative;top:0px;left:-25px;" class="icon-chevron-down sp" ></i>
																</td>
																<%-- <td style="line-height: 20px;">
																	<input id="startTime" class="Wdate" style="height: 30px;width:100px;position: relative;top:15px;"
																	readonly="true" value="${ti.time3 }"
																	onclick="createWdatePicker();" onfocus="createWdatePicker();" />
																	<span>
																		<img src="<%=request.getContextPath()%>/img/tool.png">
																	</span>
																	<i style="position: relative;top:15px;left:-25px;" class="icon-chevron-down"></i>
																</td> --%> 
																<td  class="center" style="line-height: 20px;position: relative;top:5px;">
																	<input id="showstarttime" type="text" style="height: 30px;width:150px;" name="timeStart" value="${queryInfo.timeStart }"/>
																	&nbsp;&nbsp;<span class="sp">-</span>&nbsp;&nbsp;
																	<input id="showendtime" type="text" style="height: 30px;width:150px;" name="timeEnd" value="${queryInfo.timeEnd }"/>
																</td>
																	
																<!-- 抚顺版 -->
																<td  style="line-height: 20px;position: relative;top:10px;width:120px;">
																	<select id="selType" name="baseStationName" style="width: 100px;">
																			<c:forEach items="${baseStationList }" var="baseStation">
																	 	  		<option value="${baseStation.name }">${baseStation.name }</option>
																			</c:forEach>
																	</select>
																</td> 	

																<td style="line-height: 20px;width: 550px;">
																	<c:forEach var="monitorStation" items="${monitorStationList}">
																			<input type="submit" class="btn btn-primary" name="monitorStationName" value="${monitorStation.name }" style="position: relative;top:2px;margin: 5px;"/>
																	</c:forEach>
																</td>
															</tr> 
														  </thead> 
														</table>   
													   <!-- 默认值 -->
													<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.2.1.min.js"></script>
												  	
												  	<script type="text/javascript">
												  		$(document).ready(function(){  
												  			 var val = $('#sel').val();
												  			 if(val == 1 || val == "1"){
												  				$("#sel").find("option").eq(1).remove(); 
												  			 }else{
												  				$("#sel").find("option").eq(2).remove(); 
												  			 }
												  		});
												  	</script>
												  	 
												  	<!-- 浏览器变化 -->
													<script type="text/javascript">
														 window.onload=function(){  
											                 changeDivHeight();  
											            }    
											            //当浏览器窗口大小改变时，设置显示内容的高度  
											            window.onresize=function(){  
											                 changeDivHeight();  
											            }  
											            function changeDivHeight(){               
											                //alert('123');
											                var width = document.body.clientWidth;		//宽度
											                if(width=='1730'){
											                	//alert('全屏');
											                	$('.sp').show(); 
											                }else{
											                	//alert('不全屏');
											                	$('.sp').hide(); 
											                } 
														} 
													</script>	
												  	
												  	<script type="text/javascript"> 
													    
														var valtime = document.getElementById('startTime').value;  
													 	var valstarttime = document.getElementById('showstarttime').value;  
													 	var valendtime = document.getElementById('showendtime').value;
													 	//alert(valtime+" "+valstarttime+" "+valendtime);  
													 	if(valtime != null || valtime != "" && valstarttime != null || valstarttime != ""){
													 		//alert(valstarttime);
													 		//alert(valstarttime.slice(0,10));  
													 		var timeout = valstarttime.slice(0,10)
													 		document.getElementById('startTime').value=timeout;
													 	}
													 	if(valtime == null || valtime == "" && valstarttime == null || valstarttime == "" && valendtime == null || valendtime == ""){
													 		var now = new Date();  
													        var mon = (now.getMonth()+1);
													        var day = now.getDate();
													        
													        mon = extra(mon);
													        day = extra(day); 
													          
													        startTime.value=now.getFullYear() + "-"+mon+"-"+day; 
													        showstarttime.value=now.getFullYear() + "-"+mon+"-"+day+" 00:00:00"; 
													        showendtime.value=now.getFullYear() + "-"+mon+"-"+day+" 23:59:59"; 
												    
													        function extra(x) {
																if (x < 10) {
																	return "0" + x;
																}else {
																	return x;
																}
															}    
													 	}else{}   
													 	 
													</script>  
													  <!--  <script type="text/javascript">
 
														 $(document).ready(function() {  
															 	//alert('123');
														        var vdefault = $("#num").val();  
														        //alert(vdefault);
														        if(vdefault == null || vdefault==""){
														        	$("#num").val(0);
														        }  
														          
														});   
													   </script>    -->
													     <!--设置默认时间--> 
													  <!--  <script type="text/javascript">
														   
													        var now = new Date();  
													        var mon = (now.getMonth()+1);
													        var day = now.getDate();
													        
													        mon = extra(mon);
													        day = extra(day);
													        var timeDD = document.getElementById('showendtime').value
													        startTime.value=now.getFullYear() + "-"+mon+"-"+day; 
													        if(timeDD ==""){
													        	 showstarttime.value=now.getFullYear() + "-"+mon+"-"+day+" 00:00:00"; 
															     showendtime.value=now.getFullYear() + "-"+mon+"-"+day+" 23:59:59"; 
													        }													       
													        function extra(x) {
																if (x < 10) {
																	return "0" + x;
																}else {
																	return x;
																}
															}  
														</script>  -->
													 <br>
													 	<div id="main" style="height: 400px"></div> 
													<script type="text/javascript">
														// 基于准备好的dom，初始化echarts实例
														var myChart = echarts.init(document.getElementById('main'));
														// 指定图表的配置项和数据
										
														option = {
															 title : {
																text : '${nameLD}'
															},	
															tooltip : {
																trigger : 'axis'
															},
															legend : {
																data : [ 'x', 'y', 'h']
															},
															toolbox : {
												                feature : {
												                    saveAsImage : {}
												                }
												            },
															dataZoom : [//时间轴
															{
																show : true,
																realtime : true,
																start : 0,
																end : 100
															}, {
																type : 'inside',
																realtime : true,
																start : 30,
																end : 70
															} ],
															
															  xAxis : [ {
																	type : 'category',
																	
																	boundaryGap : false,
																	 /* axisLabel: {
																		rotate: 60,
																		},  */
																	data : []
																} ],
																yAxis : [ {
																	type : 'value',
																	axisLabel : {
																		formatter : '{value} mm'//y轴单位
																	}
																} ],
															series : [ {
																name : 'x',
																type : 'line',
																 smooth:true,//设成曲线
																 //symbolSize: 10,						
																 tiled : '总量',
																
																data : []
															}, {
																name : 'y',
																type : 'line',
																smooth:true,//设成曲线
																//symbolSize: 10,
																tiled : '总量',
																
																data : []
															}, {
																name : 'h',
																type : 'line',
																smooth:true,//设成曲线
																
																tiled : '总量',
																data : []
															}]
														};
														option.xAxis[0].data = ${timesg};
														option.series[0].data = ${als1};
														option.series[1].data = ${als2};
														option.series[2].data = ${als3};
														// 使用刚指定的配置项和数据显示图表。
														myChart.setOption(option);
													</script> 
													</div>
												</div>
											</div>  
										</form>
										</c:if> 
										 
										<c:if test="${queryInfo.pageModel == 2}">
											<form action="<%=request.getContextPath()%>/graphicalAnalysis">
												<input type="hidden" name="pageModel" value="2">
												<div class="row">
													<div class="col-xs-12">
														 <!-- <div class="table-header">
															<small>多点单方向</small>
												</div>   -->
												 
												<div class="table-responsive">
													 
													<table id="sample-table-2" class="table table-striped table-bordered table-hover">
														<thead> 
															<tr> 
																<th>查询条件</th>
																<!-- <th>查询时间类型</th>
																<th>统计时间</th> -->
																<th>查询时间</th>
																<th>选中时间段</th>
																<th>基准站</th>
																<th>变形方向</th>
															</tr>
															<tr> 
																<%-- <td style="line-height: 15px;width:220px;">
																	<select name="deptone" style="width:130px;position: relative;top:5px;">
																	   <c:if test="${deptone !=null}">
																			<option selected="selected" value="${deptone }">
																				<c:if test="${deptone ==1}">全部查询</c:if>
																				<c:if test="${deptone ==2}">本次变形量</c:if>
																				<c:if test="${deptone ==3}">累计变形量</c:if>
																			</option>
																	 </c:if>		
																	 </select>
																	 </td> --%>	
																<td style="line-height:20px;">
																	<select name="model" style="width: 120px;position: relative;top:5px;" class="sel">
																	   <c:if test="${queryInfo.model !=null}">
																			<option selected="selected" value="${queryInfo.model }">
																				<%-- <c:if test="${deptLJB ==1}">多点变形量</c:if> --%> 
																				<c:if test="${queryInfo.model ==1}">单期变形量</c:if>
																				<c:if test="${queryInfo.model ==2}">累计变形量</c:if>
																			</option>
																		</c:if>		
																			<option value="1">单期变形量</option>
																			<option value="2">累计变形量</option>	
																	</select> 
																</td>
																<td style="line-height: 20px;position: relative;top:5px;"><select id="selType" name="dateModel" style="width: 130px;">
																	<c:if test="${queryInfo.dateModel !=null}">
																		<option selected="selected" value="${queryInfo.dateModel }">
																			<c:if test="${queryInfo.dateModel ==1}">日</c:if>
																			<c:if test="${queryInfo.dateModel ==2}">周</c:if>
																			<c:if test="${queryInfo.dateModel ==3}">月</c:if>
																			<c:if test="${queryInfo.dateModel ==4}">季度</c:if>
																			<c:if test="${queryInfo.dateModel ==5}">年度</c:if>
																		</option>
																	</c:if>
																	<option value="1">日</option>
																	<option value="2">周</option>
																	<option value="3">月</option>
																	<option value="4">季度</option>
																	<option value="5">年度</option>
																</select>
																&nbsp;<span class="sp">-</span>&nbsp;
																<input id="startTime" class="Wdate" style="height: 30px;width:130px;" readonly="true" value="${queryInfo.timeStart}" onclick="createWdatePicker();" onfocus="createWdatePicker();" />
																	<i style="position: absolute;top:15px;left:310px;" class="icon-chevron-down sp"></i>
																</td>

																<td style="line-height: 20px;position: relative;top:5px;">
																	<input id="showstarttime" type="text" style="height: 30px;width:150px;" name="timeStart" value="${queryInfo.timeStart}"/>
																	&nbsp;&nbsp;<span class="sp">-</span>&nbsp;&nbsp;
																	<input id="showendtime" type="text" style="height: 30px;width:150px;" name="timeEnd"value="${queryInfo.timeEnd}"/>
																</td>
																	
																<!-- 抚顺版 --> 
															     <%-- <td  style="line-height: 20px;position: relative;top:15px;width:60px;">
																	 <c:forEach items="${GraphicalAnalyMSment }" var="MS">
																	 	  ${MS.name }
																	 </c:forEach>
																 </td>  --%>
																  
																<td  style="line-height: 20px;position: relative;top:10px;width:120px;">
																	<select id="selType" name="baseStationName" style="width: 100px;">
																			<c:forEach items="${baseStationList }" var="baseStation">
																	 	  		<option value="${baseStation.name }">${baseStation.name }</option>
																			</c:forEach>
																	</select>
																</td> 		
																	 
																<td style="width: 550px;line-height: 10px;">
																	<input type="submit" name="X" value="x" class="btn btn-primary" style="position: relative;top:2px;margin: 5px;"/>
																	<input type="submit" name="Y" value="y" class="btn btn-primary" style="position: relative;top:2px;margin: 5px;"/>
																	<input type="submit" name="H" value="h" class="btn btn-primary" style="position: relative;top:2px;margin: 5px;"/>
																</td>
															</tr> 
														  </thead>
														</table>   
			 
														   <!-- 默认值 -->
													<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.2.1.min.js"></script>
													 
													 <script type="text/javascript">
												  		$(document).ready(function(){  
												  			 var val = $('.sel').val();
												  			 if(val == 1 || val == "1"){
												  				$(".sel").find("option").eq(1).remove(); 
												  			 }else{
												  				$(".sel").find("option").eq(2).remove(); 
												  			 }
												  		});
												  	</script>
													 
													 	<!-- 浏览器变化 -->
														<script type="text/javascript">
															 window.onload=function(){  
												                 changeDivHeight();  
												            }    
												            //当浏览器窗口大小改变时，设置显示内容的高度  
												            window.onresize=function(){  
												                 changeDivHeight();  
												            }  
												            function changeDivHeight(){               
												                //alert('123');
												                var width = document.body.clientWidth;		//宽度
												                if(width=='1730'){
												                	//alert('全屏');
												                	$('.sp').show(); 
												                }else{
												                	//alert('不全屏');
												                	$('.sp').hide(); 
												                } 
															} 
														</script>		
													 	
													  <script type="text/javascript"> 
													    
														var valtime = document.getElementById('startTime').value;  
													 	var valstarttime = document.getElementById('showstarttime').value;  
													 	var valendtime = document.getElementById('showendtime').value;
													 	//alert(valtime+" "+valstarttime+" "+valendtime);  
													 	if(valtime != null || valtime != "" && valstarttime != null || valstarttime != ""){
													 		//alert(valstarttime);
													 		//alert(valstarttime.slice(0,10));  
													 		var timeout = valstarttime.slice(0,10)
													 		document.getElementById('startTime').value=timeout;
													 	}
													 	if(valtime == null || valtime == "" && valstarttime == null || valstarttime == "" && valendtime == null || valendtime == ""){
													 		var now = new Date();  
													        var mon = (now.getMonth()+1);
													        var day = now.getDate();
													        
													        mon = extra(mon);
													        day = extra(day); 
													          
													        startTime.value=now.getFullYear() + "-"+mon+"-"+day; 
													        showstarttime.value=now.getFullYear() + "-"+mon+"-"+day+" 00:00:00"; 
													        showendtime.value=now.getFullYear() + "-"+mon+"-"+day+" 23:59:59"; 
												    
													        function extra(x) {
																if (x < 10) {
																	return "0" + x;
																}else {
																	return x;
																}
															}    
													 	}else{}   
													 	 
													</script>  
													  <!--设置默认时间--> 
														<!-- <script type="text/javascript">
														 
													        var now = new Date();  
													        var mon = (now.getMonth()+1);
													        var day = now.getDate();
													        
													        mon = extra(mon);
													        day = extra(day);
													        var timeLJ = document.getElementById('showendtime').value
													        startTime.value=now.getFullYear() + "-"+mon+"-"+day; 
													        if(timeLJ==""){
													        	showstarttime.value=now.getFullYear() + "-"+mon+"-"+day+" 00:00:00"; 
														        showendtime.value=now.getFullYear() + "-"+mon+"-"+day+" 23:59:59"; 	
													        }
													        
													        
													        function extra(x) {
																if (x < 10) {
																	return "0" + x;
																}else {
																	return x;
																}
															}  
														</script>   -->
														<br>
															<div id="maindd" style="height: 400px"></div>
															<script type="text/javascript">
														        // 基于准备好的dom，初始化echarts实例
														        var myChart = echarts.init(document.getElementById('maindd'));
														        // 指定图表的配置项和数据
														                 var s = ${Gsg};
														                var series=[];
														                var g = null;
														                for(var i in s){
														                	g= s[i]
														                	/* for(var f in g){ */
														                		series.push({
														                			"name":g[0],  
														                            "type":"line",
														                            "data":g[1],                            
																				    "smooth":true,//设成曲线
																				 	"symbolSize": 5,						
														                    	})
														                	/* } */
														                }   
														        option = {
														             title : {
														                text : '${nameLJB}'
														            }, 
														            tooltip : {
														                trigger : 'axis'
														            },
														            legend : {
														                data : ${listname}
														            },
														             toolbox : {
														                feature : {
														                    saveAsImage : {}
														                }
														            }, 
														            /* grid : {
														                left : '3%',
														                right : '4%',
														                bottom : '3%',
														                containLabel : true
														            }, */
														            dataZoom : [//时间轴
														                {
														                    show : true,
														                    realtime : true,
														                    start : 0,
														                    end : 100
														                }, {
														                    type : 'inside',
														                    realtime : true,
														                    start : 0,
														                    end : 100
														                } ],
														                
														                
														                xAxis : [ {
																			type : 'category',
																			
																			boundaryGap : false,
																			 /* axisLabel: {
																				rotate: 60,
																				},  */
																			data : []
																		} ],
																		yAxis : [ {
																			type : 'value',
																			axisLabel : {
																				formatter : '{value} mm'//y轴单位
																			}
																		} ],
														                
														                /* xAxis : [ {
																			type : 'category',
																			
																			boundaryGap : false,
																			/* axisLabel: {
																				rotate: 60,
																				}, */
																				 /* data : []
																		} ],
																		yAxis : [ {
																			type : 'value',
																			axisLabel : {
																				formatter : '{value} mm'//y轴单位
																			}
																		} ], */
														            series : series
														        };
														
														        option.xAxis[0].data = ${al3sG};
														        // 使用刚指定的配置项和数据显示图表。
														        myChart.setOption(option);
														    </script>
																						   
															</div>
														</div>
													</div>  
												 </form>
												</c:if> 
										
										
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
							</div> 
							 
							
							<!-- 全选，全不选 -->
							<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.2.1.min.js"></script>
						   <!-- <script type="text/javascript">
								 function getAll(){
									 var tit = document.getElementById('all');
									 var inputs = document.getElementsByTagName("input");
									 for(var i = 0; i < inputs.length; i++){
									  if(inputs[i].type == "checkbox")
									  {
										   if(tit.checked == true){
										    	inputs[i].checked = true;
										   }else{
										    	inputs[i].checked = false;
										   }
									  }
								   }
								}   
							</script>	 --> 
 
							<script src="<%=request.getContextPath()%>/static/assets/js/bootstrap.min.js"></script>
							<script src="<%=request.getContextPath()%>/static/assets/js/typeahead-bs2.min.js"></script>

							<!-- page specific plugin scripts -->

							<script src="<%=request.getContextPath()%>/static/assets/js/jquery.dataTables.min.js"></script>
							<script src="<%=request.getContextPath()%>/static/assets/js/jquery.dataTables.bootstrap.js"></script>

							<!-- ace scripts -->

							<script src="<%=request.getContextPath()%>/static/assets/js/ace-elements.min.js"></script>
							<script src="<%=request.getContextPath()%>/static/assets/js/ace.min.js"></script>

							<!-- inline scripts related to this page -->

						 
						<!-- </div>  -->
						<!-- <div id="faq-tab-2" class="tab-pane fade">
							123
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="<%=request.getContextPath()%>/static/assets/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/assets/js/typeahead-bs2.min.js"></script>

	<script src="<%=request.getContextPath()%>/static/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/assets/js/jquery.ui.touch-punch.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/assets/js/jquery.slimscroll.min.js"></script>

	<!-- ace scripts -->
	<script src="<%=request.getContextPath()%>/static/assets/js/ace-elements.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/assets/js/ace.min.js"></script>

	<!-- <script type="text/javascript">
		jQuery(function($) {
			$('.accordion').on('hide', function(e) {
				$(e.target).prev().children(0).addClass('collapsed');
			});
			$('.accordion').on('show', function(e) {
				$(e.target).prev().children(0).removeClass('collapsed');
			})
		});
	</script>
	<div style="display: none"></div> -->
</body>
<script type="text/javascript">
	function pickTime() {

		var type = $("#selType").val();

		if (type == 1) {//按日
			//获取控件选择的时间，格式是根据设置的dateFmt : 'yyyy-MM-dd'
			var datetime = $dp.cal.getDateStr();
			 $("#showstarttime").val(datetime + " 00:00:00");
			$("#showendtime").val(datetime + " 23:59:59"); 
			/* $("#showstarttime").val(datetime);
			$("#showendtime").val(datetime);   */
		} else if (type == 2) {//按周
			var datetime = $dp.cal.getDateStr();
			//获取星期几，控件提供的方法
			var dstart = -$dp.cal.getP('w', 'w');
			var dend = dstart + 6;
			//计算一周的开始日期和结束日期，这个方法文档说返回的是字符串，但是实际中返回的是控件定义的时间对象，所以后面得自己转换成字符串
			var datestart = $dp.$DV(datetime, {
				d : dstart
			});
			var dateend = $dp.$DV(datetime, {
				d : dend
			});

			$("#showstarttime").val(dateToString(datestart)+ " 00:00:00");
			$("#showendtime").val(dateToString(dateend)+ " 23:59:59");
		} else if (type == 3) {//按月
			var y = $dp.cal.getP('y', 'yyyy');
			var M = $dp.cal.getP('M', 'M');

			var d = new Date(y, M, 0);

			var datestart = {};
			datestart.y = y;
			datestart.M = M;
			datestart.d = 1;
			var dateend = {};
			dateend.y = y;
			dateend.M = M;
			//获取月的最后一天
			dateend.d = d.getDate();

			$("#showstarttime").val(dateToString(datestart)+ " 00:00:00");
			$("#showendtime").val(dateToString(dateend)+ " 23:59:59");

		} else if (type == 4) {//按季
			var y = $dp.cal.getP('y', 'yyyy');
			var M = $dp.cal.getP('M', 'M');

			//计算季度的开始月份和结束月份
			var startM = parseInt((M - 1) / 3) * 3 + 1;
			var endM = startM + 2;

			var d = new Date(y, endM, 0);

			var datestart = {};
			datestart.y = y;
			datestart.M = startM;
			datestart.d = 1;
			var dateend = {};
			dateend.y = y;
			dateend.M = endM;
			//获取最后一个月的最后一天
			dateend.d = d.getDate();

			$("#showstarttime").val(dateToString(datestart)+ " 00:00:00");
			$("#showendtime").val(dateToString(dateend)+ " 23:59:59");

		} else if (type == 5) {//按年

			var y = $dp.cal.getP('y', 'yyyy');
			//这里可以直接字符串拼凑写死，但是为了格式统一，还是创建对象在转化吧
			var datestart = {};
			datestart.y = y;
			datestart.M = 1;
			datestart.d = 1;
			var dateend = {};
			dateend.y = y;
			dateend.M = 12;
			dateend.d = 31;

			$("#showstarttime").val(dateToString(datestart)+ " 00:00:00");
			$("#showendtime").val(dateToString(dateend)+ " 23:59:59");
		}

	};
	function dateToString(date) {
		var strdate = "";
		strdate = strdate + date.y + "-";
		var M = date.M >= 10 ? date.M : ("0" + date.M);
		strdate = strdate + M;
		var d = date.d >= 10 ? date.d : ("0" + date.d);
		strdate = strdate + "-" + d;
		return strdate;
	};

	function createWdatePicker() {

		var type = $("#selType").val();

		if (type == 1) {//按日
			WdatePicker({
				readOnly : true,
				dateFmt : 'yyyy-MM-dd',
				onpicked : pickTime,
				isShowWeek : true,
				maxDate : '%y-%M-%d'
			});
		} else if (type == 2) {//按周
			WdatePicker({
				readOnly : true,
				dateFmt : 'yyyy-MM-dd',
				onpicked : pickTime,
				isShowWeek : true,
				maxDate : '%y-%M-%d'
			});
		} else if (type == 3) {//按月
			WdatePicker({
				readOnly : true,
				dateFmt : 'yyyy-MM',
				onpicked : pickTime,
				isShowWeek : true,
				maxDate : '%y-%M-%d'
			});
		} else if (type == 4) {//按季
			WdatePicker({
				readOnly : true,
				dateFmt : 'yyyy-MM',
				onpicked : pickTime,
				isShowWeek : true,
				maxDate : '%y-%M-%d'
			});
		} else if (type == 5) {//按年
			WdatePicker({
				readOnly : true,
				dateFmt : 'yyyy',
				onpicked : pickTime,
				isShowWeek : true,
				maxDate : '%y-%M-%d'
			});
		}

	};
</script> 
</html>