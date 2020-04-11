<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>统计数据</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link href="<%=request.getContextPath()%>/static/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/jquery-ui-1.10.3.custom.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-skins.min.css" />
    
<!-- <script src="assets/js/ace-extra.min.js"></script> --> 
<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
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
	margin:5px -20px 0px -20px;
}
#sample-table-2{
	margin: -22px 0px 0px 0px;
}
.navdown{
	background-color: red;
}
#ta{
	margin: 10px 0px;
}
html{
	background-color: white;
}
</style>


<style type="text/css">
.black_overlay{ display: none; position: absolute; top: 0%; left: 0%; width: 100%; height: 100%; background-color: black; z-index:1001; -moz-opacity: 0.6; opacity:.60; filter: alpha(opacity=60); } 
.white_content { display: none; position: absolute; top: 30%; left: 35%; width: 300px; height:180px; padding: 5px; border: 3px solid #307ECC; background-color: white; z-index:1002; overflow: auto;text-align: center; } 
</style> 

</head>
<body id="body" style="background-color: white;">
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try {
				ace.settings.check('breadcrumbs','fixed')
			}catch (e) {  }
		</script>
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i><a href="<%=request.getContextPath()%>/summary" target="right">首页</a></li>
			<li>&nbsp;形变监测 &nbsp;</li>
			<li class="active">&nbsp;统计数据</li>
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
						
	<!--  style="width: 1725px;" -->			
	<div class="page-content">  
			<div id="light" class="white_content"> 
		    <h3 style="font-size: 18px;color: #428BCA;font-weight: bold;">信息提示</h3><br>
			<p style="font-size: 15px;">输入的页码有误,请重新输入！</p>
			<button class="btn btn-primary" style="margin-top: 15px;width: 75px;" onclick="two()"><a href="javascript:void(0)" onclick="two()" style="text-decoration: none;color: white">关闭</a></button> 
		    </div> 
		  <div id="fade" class="black_overlay"></div>
		  <!-- <div class="page-header">		 
			<h1>数据查询 </h1>
		  </div> -->
		 
		<div class="row">
			<div class="col-xs-12">  
				<div class="table-header">
					   <small>统计数据</small> 
					   <div id="export" class="dropdown pull-right navbar-header" role="navigation" style="margin-right: 20px;">
						    <button type="button" class="btn btn-primary dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">工具
						        <span class="caret"></span>
						    </button>
						    <ul class="dropdown-menu" id="menu" role="menu" aria-labelledby="dropdownMenu1"> 
						          <li><a href="#" onclick=preview(1) >打    印</a></li>
						          <li><a data-type="txt" href="javascript:;">导出Txt</a></li> 
					       		  <li><a data-type="json" href="javascript:;">导出Json</a></li>
						          <!-- <li><a data-type="csv" href="javascript:;">导出csv</a></li> -->
						          <li><a data-type="xls" href="javascript:;">导出Excel</a></li>
						          <li><a data-type="doc" href="javascript:;">导出Word</a></li>
						    </ul>   
						</div> 		
				</div>    
				
				<div class="tabbable" id="ta">  
				
					<c:if test="${queryInfo.pageModel == 1}">
						<ul class="nav nav-tabs padding-18 tab-size-bigger" id="myTab">
							<li class="active">
								<a href="<%=request.getContextPath()%>/dataStatistic/1/4">时段内累计变形量</a>
							</li>
							<li>
								<a href="<%=request.getContextPath()%>/dataStatistic/2/4">24小时统计数据</a>
							</li> 
						</ul>  
					</c:if> 
						
					<c:if test="${queryInfo.pageModel == 2}">
						<ul class="nav nav-tabs padding-18 tab-size-bigger" id="myTab">
							<li>
								<a href="<%=request.getContextPath()%>/dataStatistic/1/4">时段内累计变形量</a>
							</li>
							<li  class="active">
								<a href="<%=request.getContextPath()%>/dataStatistic/2/4">24小时统计数据</a>
							</li> 
						</ul>  
					</c:if> 
						

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
						window.location.reload(); //刷新当前页面
						} else { 
						window.print(); 
						} 
						} 
					 </script> 
					<!--------------------------------------------------------------------------------------------------------------> 
						<div class="tab-content no-border padding-24" id="tab">
							<div id="faq-tab-1" class="tab-pane fade in active">
								<div class="page-content">
									<div class="row">
										<div class="col-xs-12">   
										<c:if test="${queryInfo.pageModel == 1}">
										<form action="<%=request.getContextPath()%>/dataStatistic/1">
											<input type="hidden" name="pageModel" value="1">
												<div class="row">
													<div class="col-xs-12">
														     <!-- <div class="table-header">
															 <small>统计数据</small>  &nbsp;&nbsp;
													         <a href="#" onclick="window.print()"><button type="button"
															 class="btn btn-primary">
															 <i class="icon-print"></i>打印</button></a>
												             </div>    -->
												<div class="table-responsive">
													<!-- table(1) -->
													<table class="table table-striped table-bordered table-hover">
														<thead> 
															<tr>
															    <th>查询条件</th>
																<!-- <td>查询时间类型</td>
																<td>统计时间</td> -->
																<th>查询时间</th>
																<th>选中时间段</th>
																<th>基准站</th>
																<th>监测站  </th>
															</tr>
															<tr> 
																<td style="line-height: 20px;width:290px;">
																 <span style="position: relative;top: 5px;">
																 	 
																	<%-- <select name="deptone" style="width:100px;">
																	   <c:if test="${deptone !=null}">
																			<option selected="selected" value="${deptone }">
																				<c:if test="${deptone ==1}">全部查询</c:if>
																				<c:if test="${deptone ==2}">本次变形量</c:if>
																				<c:if test="${deptone ==3}">累计变形量</c:if>
																			</option>
																		</c:if>		
																			<option value="1">全部查询</option>
																			<option value="2">本次变形量</option>
																			<option value="3">累计变形量</option>	
																	</select>  --%>
																	<%-- 大于：<input type="text" value="${num}" name="num" id="num" onchange="if(/\D/.test(this.value)){alert('只能输入数字');this.value='';}" style="width: 80px">(mm) --%>
																	<%-- 大于: <input type="text" value="${num}" name="num" id="num" onkeyup="value=value.replace(/[^\-?\d.]/g,'')" style="width: 80px">(mm) --%>
																	  阈值: <input type="text" value="${queryInfo.threshold}" name="threshold" id="num" onkeyup="value=value.replace(/[^\-?\d.]/g,'')" pattern="^[0-9.]*$" required oninvalid="setCustomValidity('请输入一个大于零的数');" oninput="setCustomValidity('');" style="width: 80px">(mm)<br>
																	<!-- <br> -->
																	  x: <input type="checkbox" name="X" value="1" <c:if test="${queryInfo.x == '1'}">checked="true"</c:if>>
																	  y: <input type="checkbox" name="Y" value="2" <c:if test="${queryInfo.y == '2'}">checked="true"</c:if>>
																	  h: <input type="checkbox" name="H" value="3" <c:if test="${queryInfo.h == '3'}">checked="true"</c:if>>
																 </span>
																</td>
																<td class="center" style="line-height: 20px;position: relative;top:5px;">
																	<select id="selType" name="dateModel" style="width: 130px;">
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
																
																<input id="startTime" class="Wdate" style="height: 30px;width: 130px;" readonly="true" value="${queryInfo.timeStart}" name="time3" onclick="createWdatePicker();" onfocus="createWdatePicker();" />
																	<i style="position: relative;top:0px;left:-25px;" class="icon-chevron-down sp" ></i>
																</td>
																<td  style="line-height: 20px;position: relative;top:5px;">
																	<input id="showstarttime" type="text" style="height: 30px;width:150px;" name="timeStart" value="${queryInfo.timeStart}"/>&nbsp;<span class="sp">-</span>&nbsp;
																	<input id="showendtime" type="text" style="height: 30px;width:150px;" name="timeEnd" value="${queryInfo.timeEnd}"/>
																</td>
																	
																<!-- 抚顺版 --> 
															    <%--  <td  style="line-height: 20px;position: relative;top:15px;width:60px;">
																	 <c:forEach items="${MSmentstatistical }" var="MS">
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
																	
																<td style="line-height: 20px;width:450px;">
																	<c:forEach var="monitorStation" items="${monitorStationList}">
																		<input type="submit" id="1"  class="btn btn-primary" name="monitorStationName" value="${monitorStation.name }" style="position: relative;top:6px;margin: 5px;"/>
																	 </c:forEach>
																</td>
															</tr> 
														  </thead>
														</table> 
									 
													 
												 	<!-- table(2) -->
												        <table id="sample-table-2" class="table table-striped table-bordered table-hover">
														  <thead>
															 <tr>
																<!-- <th class="center" rowspan="4"><label><input
																		type="checkbox" class="ace" id="all" onclick="getAll()"/><span class="lbl"></span>
																</label></th> -->
																<th rowspan="3">编号</th> 
																<th rowspan="3">监测站</th>
																<th rowspan="3">更新时间</th>
																<th colspan="3">单期变形量(mm)</th>
																<th colspan="3">累计变形量(mm)</th>
																<th colspan="3">本次观测值(m)</th>
																<th colspan="3">初始观测值(m)</th>
															 </tr>
															 <tr>
																<th>dx</th>
																<th>dy</th>
																<th>dh</th>
																<th>dx</th>
																<th>dy</th>
																<th>dh</th>
																<th>x</th>
																<th>y</th>
																<th>h</th>
																<th>x</th>
																<th>y</th>
																<th>h</th> 
															</tr>
														  </thead>
														  <tbody>
															<c:forEach var="station" items="${page.stationList}" varStatus="xh">
																	<tr id="hh">
																		<!-- <td class="center"><label><input
																			 type="checkbox" name="check" class="ace" id="ace"/><span class="lbl"></span>
															                 </label></td> -->
																		<td>${xh.index+1 }</td>
																		<td>${station.name }</td>
																		<td>${station.recordTime }</td>
																		<td>${station.sKxSingleChange }</td>
																		<td class="hidden-480">${station.sKySingleChange }</td>
																		<td>${station.sDhSingleChange }</td>
																		
																		<td class="sys">${station.sKxAccChange}</td>
																		<td class="sys">${station.sKyAccChange}</td>
																		<td class="sys">${station.sDhAccChange}</td>
																		
																		<td>${station.sDx }</td>
																		<td>${station.sDy }</td>
																		<td>${station.sDh }</td>
																		
																		<td>${station.original_Scx }</td>
																		<td>${station.original_ScY }</td>
																		<td>${station.original_Scz }</td>
																	</tr>
																</c:forEach> <!--endprint1--> 
																
																<tr align="center">
																	<td colspan="15">
																		<ul class="pagination">
																			<li>
																				<a href="<%=request.getContextPath()%>/dataStatistic/1/1/${queryInfo.model}/${queryInfo.threshold}/${queryInfo.x}/${queryInfo.y}/${queryInfo.h}/${queryInfo.dateModel}/${queryInfo.timeStart}/${queryInfo.timeEnd}/${queryInfo.baseStationName}/${queryInfo.monitorStationName}">首页</a>
																			</li>
																			<li>
																				<c:if test="${page.currPageNum > 1}">
																					<a href="<%=request.getContextPath()%>/dataStatistic/1/${page.currPageNum-1}/${queryInfo.model}/${queryInfo.threshold}/${queryInfo.x}/${queryInfo.y}/${queryInfo.h}/${queryInfo.dateModel}/${queryInfo.timeStart}/${queryInfo.timeEnd}/${queryInfo.baseStationName}/${queryInfo.monitorStationName}">上一页</a>
																				</c:if>
																			</li>
																			<li>
																				<input type="text" id="select" value="${page.currPageNum}" name="currPageNum" style="width: 75px;">
																			</li>
																			<li><input type="submit" class="btn btn-primary btn-sm" value="跳转" onclick="return chose()" style="line-height: 15px;margin-top: -5px;"></li>
																			<li>
																				<c:if test="${page.currPageNum < page.totalPageSize}">
																					<a href="<%=request.getContextPath()%>/dataStatistic/1/${page.currPageNum+1}/${queryInfo.model}/${queryInfo.threshold}/${queryInfo.x}/${queryInfo.y}/${queryInfo.h}/${queryInfo.dateModel}/${queryInfo.timeStart}/${queryInfo.timeEnd}/${queryInfo.baseStationName}/${queryInfo.monitorStationName}">下一页</a>
																				</c:if>
																			</li>
																			<li>
																				<a href="<%=request.getContextPath()%>/dataStatistic/1/${page.totalPageSize}/${queryInfo.model}/${queryInfo.threshold}/${queryInfo.x}/${queryInfo.y}/${queryInfo.h}/${queryInfo.dateModel}/${queryInfo.timeStart}/${queryInfo.timeEnd}/${queryInfo.baseStationName}/${queryInfo.monitorStationName}">尾页</a>
																			</li>
																		</ul>
																		&nbsp;<span>当前第<span style="color: #307ECC;font-weight: bold;">
																		<c:if test="${page.totalPageSize != 0}">${totalPageSize.currPageNum}</c:if>
																		<c:if test="${page.totalPageSize == 0}">0</c:if>
																	    </span>页 /共<span style="color: #307ECC;font-weight: bold;">${page.totalPageSize}</span>页
																		/每页显示<span style="color: #307ECC;font-weight: bold;">${page.pageSize}</span>条记录</span>
																	</td>
																</tr>
															</tbody> 
														</table>
														  
														  <!-- 只显示一次 -->
														  
														  
													 <!-- 默认值 -->
													<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.2.1.min.js"></script>
													<!-- 对值进行四舍五入 -->
													<script type="text/javascript">
														$(document).ready(function(){
															 $('.sys').each(function(){ 
																 var num =  $(this).text();  
																 var fixnum = new Number(num).toFixed(2); 
																 //var fixednum = new Number(fixnum-1).toFixed(2);
																/*  alert("原来的值:"+val); 
																 alert("两位小数点:"+fixnum);  */ 
																 $(this).text(fixnum); 
															}); 
														}); 
														
														/* var num = 0.007;//要四舍五入的数字  
														var fixNum = new Number(num+1).toFixed(2);//四舍五入之前加1  
														var fixedNum = new Number(fixNum - 1).toFixed(2);//四舍五入之后减1，再四舍五入一下  
														alert(fixedNum);//弹出的数字就是正确的四舍五入结果啦   */
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
													 	 if(valstarttime != null || valstarttime != ""){
													 		//alert(valstarttime); 
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
													
													   <script type="text/javascript">
														 $(document).ready(function() {  
															 	//alert('123');
														        var vdefault = $("#num").val();  
														        //alert(vdefault);
														        if(vdefault == null || vdefault==""){
														        	$("#num").val(0);
														        }    
														});  
													   </script>
														  
														<!-- 分页提示  --> 
														<script type="text/javascript">
															function two(){
													    	    document.getElementById('light').style.display='none';
													    	    document.getElementById('fade').style.display='none'
													    	 }   
															function chose(){  
																var val = document.getElementById('select').value;  
																var num = parseInt(val);
																if(num == '${MonitoringStations.currPageNO}'-1 || num > '${MonitoringStations.allPageNO}'){
																	/* alert('输入的页码有误,请重新输入!');
																	return false; */
																	$('#light').show();
													   				document.getElementById('light').style.display='block';
													   		    	document.getElementById('fade').style.display='block' ;  
													   		    	$('#select').val(1);
													   		    	return false;
																} 
																if(num == '' || num == null){
																	/* alert('123'); */
																}
															}
														</script>


													</div>
												</div>
											</div>  
										</form>  
										</c:if>
										
										<c:if test="${queryInfo.pageModel == 2}">
											<form action="<%=request.getContextPath()%>/dataStatistic/2">
											 <input type="hidden" name="pageModel" value="2">
												<div class="row">
													<div class="col-xs-12">
														  <!-- <div class="table-header">
															<small>统计数据</small>  &nbsp;&nbsp; 
													<a href="#" onclick="window.print()"><button type="button"
															class="btn btn-primary">
															<i class="icon-print"></i>打印</button></a>
												</div>    -->
												<div class="table-responsive">
													<!-- table(1) -->
													<table
														class="table table-striped table-bordered table-hover">
														<thead> 
															<tr>
															    <th>查询条件</th>
																<!-- <td>查询时间类型</td>
																<td>统计时间</td> -->
																<th>查询时间</th>
																<th>选中时间段</th>
																<th>基准站</th>
																<th>监测站  </th>
															</tr>
															<tr> 
																<td style="line-height: 15px;width:290px;">
																 	<span style="position: relative;top: 5px;">
																		阈值: <input type="text" value="${queryInfo.threshold}" name="threshold" class="num" onkeyup="value=value.replace(/[^\-?\d.]/g,'')" pattern="^[0-9.]*$" required oninvalid="setCustomValidity('请输入一个大于零的数');" oninput="setCustomValidity('');" style="width: 80px">(mm)<br>
																		x: <input type="checkbox" name="X" value="1" <c:if test="${queryInfo.x == '1'}">checked="true"</c:if>>
																		y: <input type="checkbox" name="Y" value="2" <c:if test="${queryInfo.y == '2'}">checked="true"</c:if>>
																		h: <input type="checkbox" name="H" value="3" <c:if test="${queryInfo.h == '3'}">checked="true"</c:if>>
																	</span>
																</td>

																<td class="center" style="line-height: 20px;position: relative;top:5px;">
																	<select id="selType" name="dateModel" style="width: 130px;">
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

																	<input id="startTime" class="Wdate startTime" style="height: 30px;width: 130px;" readonly="true" value="${queryInfo.timeStart}" name="time3" onclick="createWdatePicker();" onfocus="createWdatePicker();" />
																	<i style="position: relative;top:0px;left:-25px;" class="icon-chevron-down sp" ></i>
																</td>
																<td  style="line-height: 20px;position: relative;top:5px;">
																	<input id="showstarttime" class="showstarttime" type="text" style="height: 30px;width:150px;" name="timeStart" value="${queryInfo.timeStart}"/>&nbsp;<span class="sp">-</span>&nbsp;
																	<input class="showendtime" id="showendtime" type="text" style="height: 30px;width:150px;" name="timeEnd" value="${queryInfo.timeEnd}"/>
																</td>

																<td  style="line-height: 20px;position: relative;top:10px;width:120px;">
																	<select id="selType" name="baseStationName" style="width: 100px;">
																			<c:forEach items="${baseStationList }" var="baseStation">
																	 	  		<option value="${baseStation.name }">${baseStation.name }</option>
																			</c:forEach>
																	</select>
																</td> 	

																<td style="line-height: 20px;width:450px;">
																	<c:forEach var="monitorStation" items="${monitorStationList}">
																		<input type="submit" id="1"  class="btn btn-primary" name="monitorStationName" value="${monitorStation.name }" style="position: relative;top:6px;margin: 5px;"/>
																	 </c:forEach>
																</td>
															</tr>
														  </thead>
														</table> 
									 
													 
												 	<table id="sample-table-2"
														class="table table-striped table-bordered table-hover">
														<thead> 
															<tr>
																<!-- <th class="center" rowspan="4"><label><input
																		type="checkbox" class="ace" id="all" onclick="getAll()"/><span class="lbl"></span>
																</label></th> -->
																<th rowspan="3">编号</th> 
																<th rowspan="3">监测站</th>
																<th rowspan="3">更新时间</th>
																<th colspan="3">单期变形量(mm)</th>
																<th colspan="3">累计变形量(mm)</th>
																<th colspan="3">本次观测值(m)</th>
																<th colspan="3">初始观测值(m)</th>
															</tr> 
															<tr>		
																<th>dx</th>
																<th>dy</th>
																<th>dh</th>
																<th>dx</th>
																<th>dy</th>
																<th>dh</th>
																<th>x</th>
																<th>y</th>
																<th>h</th>
																<th>x</th>
																<th>y</th>
																<th>h</th> 
															</tr>
														</thead>
														<tbody> 
															<c:forEach var="station" items="${listdatadatytoo}" varStatus="status">
																	<tr id="hh">
																		<!-- <td class="center"><label><input
																			type="checkbox" name="check" class="ace" id="ace"/><span class="lbl"></span>
																	         </label></td> -->
																		<td>${status.index+1 }</td>
																		<td>${station.name }</td>
																		<td>${station.recordTime }</td>
																		<td>${station.sKxSingleChange }</td>
																		<td class="hidden-480">${station.sKySingleChange }</td>
																		<td>${station.sDhSingleChange }</td>
																		
																		<td class="hidden-480">${station.sKxAccChange}</td>
																		<td>${station.sKyAccChange }</td>
																		<td>${station.sDhAccChange }</td>
																		
																		<td>--</td>
																		<td>--</td>
																		<td>--</td>
																		
																		<td>--</td>
																		<td>--</td>
																		<td>--</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>

													   <!-- 默认值 -->
													<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.2.1.min.js"></script>
													 <script type="text/javascript">
														 $(document).ready(function() {  
															 	//alert('123');
														        var vdefault = $(".num").val();  
														        //alert(vdefault);
														        if(vdefault == null || vdefault==""){
														        	$(".num").val(0);
														        }    
														});  
													 </script>
													<script type="text/javascript">  
														var valtime = $('.startTime').val();
														var valstarttime = $('.showstarttime').val();
														var valendtime = $('.showendtime').val();
													
														 if(valstarttime != null || valstarttime != ""){
														 		//alert(valstarttime); 
														 		var timeout = valstarttime.slice(0,10)
														 		 $('.startTime').val(timeout);
														} 
														if(valtime == null || valtime == "" && valstarttime == null || valstarttime == "" && valendtime == null || valendtime == ""){
															var now = new Date();  
													        var mon = (now.getMonth()+1);
													        var day = now.getDate();
													        
													        mon = extra(mon);
													        day = extra(day); 
													           
													        
													        var time1 = now.getFullYear() + "-"+mon+"-"+day;
													        var time2 = now.getFullYear() + "-"+mon+"-"+day+" 00:00:00";
													        var time3 = now.getFullYear() + "-"+mon+"-"+day+" 23:59:59"; 
													        $('.startTime').val(time1);
													        $('.showstarttime').val(time2);
													        $('.showendtime').val(time3);
												    
													        function extra(x) {
																if (x < 10) {
																	return "0" + x;
																}else {
																	return x;
																}
															}    
														} 
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
														  
														<!-- 分页提示  --> 
														<!-- <script type="text/javascript">
															function two(){
													    	    document.getElementById('light').style.display='none';
													    	    document.getElementById('fade').style.display='none'
													    	 }   
															function chose(){  
																var val = document.getElementById('select').value;  
																var num = parseInt(val);
																if(num == '${MonitoringStations.currPageNO}'-1 || num > '${MonitoringStations.allPageNO}'){
																	/* alert('输入的页码有误,请重新输入!');
																	return false; */
																	$('#light').show(1000);
													   				document.getElementById('light').style.display='block';
													   		    	document.getElementById('fade').style.display='block' ;  
													   		    	$('#select').val(1);
													   		    	return false;
																} 
																if(num == '' || num == null){
																	/* alert('123'); */
																}
															}
														</script> -->
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
	
	<script src="<%=request.getContextPath()%>/static/login/Blob.js"></script>
	<script src="<%=request.getContextPath()%>/static/login/FileSaver.js"></script>
	<script src="<%=request.getContextPath()%>/static/login/tableExport.js"></script>
	<script> 
		var $exportLink = document.getElementById('export'); 
		
		$exportLink.addEventListener('click', function(e){ 
			
			e.preventDefault();
			
			if(e.target.nodeName === "A"){
				
				tableExport('sample-table-2', '统计数据', e.target.getAttribute('data-type'));
				
			} 
			
		}, false);
		
	</script>
	 
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
	 
	
	function time(){
		var type1 = $(".selType").val(); 
		if (type1 == 1) {//按日
			//获取控件选择的时间，格式是根据设置的dateFmt : 'yyyy-MM-dd'
			var datetime = $dp.cal.getDateStr(); 
			$(".showstarttime").val(datetime + " 00:00:00");
			$(".showendtime").val(datetime + " 23:59:59");
			/* $("#showstarttime").val(datetime);
			$("#showendtime").val(datetime);   */
		} else if (type1 == 2) {//按周
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
			$(".showstarttime").val(dateToString(datestart)+ " 00:00:00");
			$(".showendtime").val(dateToString(dateend)+ " 23:59:59");
		} else if (type1 == 3) {//按月
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

			$(".showstarttime").val(dateToString(datestart)+ " 00:00:00");
			$(".showendtime").val(dateToString(dateend)+ " 23:59:59");
		} else if (type1 == 4) {//按季
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

			$(".showstarttime").val(dateToString(datestart)+ " 00:00:00");
			$(".showendtime").val(dateToString(dateend)+ " 23:59:59");
		} else if (type1 == 5) {//按年

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
			$(".showstarttime").val(dateToString(datestart)+ " 00:00:00");
			$(".showendtime").val(dateToString(dateend)+ " 23:59:59");
		}
	}
	
	
	
	
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
	
	
	function createWdatePicker1() { 
		var type1 = $(".selType").val(); 
		if (type1 == 1) {//按日
			WdatePicker({
				readOnly : true,
				dateFmt : 'yyyy-MM-dd',
				onpicked : time,
				isShowWeek : true,
				maxDate : '%y-%M-%d'
			});
		} else if (type1 == 2) {//按周
			WdatePicker({
				readOnly : true,
				dateFmt : 'yyyy-MM-dd',
				onpicked : time,
				isShowWeek : true,
				maxDate : '%y-%M-%d'
			});
		} else if (type1 == 3) {//按月
			WdatePicker({
				readOnly : true,
				dateFmt : 'yyyy-MM',
				onpicked : time,
				isShowWeek : true,
				maxDate : '%y-%M-%d'
			});
		} else if (type1 == 4) {//按季
			WdatePicker({
				readOnly : true,
				dateFmt : 'yyyy-MM',
				onpicked : time,
				isShowWeek : true,
				maxDate : '%y-%M-%d'
			});
		} else if (type1 == 5) {//按年
			WdatePicker({
				readOnly : true,
				dateFmt : 'yyyy',
				onpicked : time,
				isShowWeek : true,
				maxDate : '%y-%M-%d'
			});
		}

	};
</script> 
</html>