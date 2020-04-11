<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>趋势分析</title>
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
	margin:-17px -20px 0px -20px;
}
/* #sample-table-2{
	margin: -2px 0px 0px 0px;
} */
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
<body>
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try {
				ace.settings.check('breadcrumbs','fixed')
			}catch (e) {  }
		</script>
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i><a href="<%=request.getContextPath()%>/summary" target="right">首页</a></li>
			<li>&nbsp;形变监测  &nbsp;</li>
			<li class="active">&nbsp;趋势分析</li>
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
	
		<!-- 	<div id="light" class="white_content"> 
		    <h3 style="font-size: 18px;color: #428BCA;font-weight: bold;">信息提示</h3><br>
			<p style="font-size: 15px;">输入的页码有误,请重新输入！</p>
			<button class="btn btn-primary" style="margin-top: 15px;width: 75px;" onclick="two()"><a href="javascript:void(0)" onclick="two()" style="text-decoration: none;color: white">关闭</a></button> 
		    </div> 
		  <div id="fade" class="black_overlay"></div> -->
		  
		<!-- <div class="page-header">		 
			<h1>数据查询 </h1>
		</div> -->
		 
		<div class="row">
			<div class="col-xs-12">  
				<div class="tabbable" id="ta"> 
					 <!-- <ul class="nav nav-tabs padding-18 tab-size-bigger" id="myTab">
						<li class="active"><a data-toggle="tab" href="#faq-tab-1" class="tab1">时段内累计变形量</a></li>
						<li><a data-toggle="tab" href="#faq-tab-2" class="tab2">24小时统计数据</a>
						</li> 
					</ul>   --> 
					<!--------------------------------------------------------------------------------------------------------------->
					<!-- 打印(PRINT) -->
					<!-- <script>
						window.onload = function() {
							var CheckAll = document
									.getElementById('sample-table-2');
							var CheckBox = document.getElementsByTagName('tr');
							CheckAll.onclick = function() {
								for (i = 0; i < CheckBox.length; i++) {
									if (CheckBox[i].checked == true) {
										CheckBox[i].checked = false;
									} else {
										CheckBox[i].checked = true
									}
								}
								;
							};
						};
					</script> -->
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
 
						<div class="tab-content no-border padding-24" id="tab">
							<div id="faq-tab-1" class="tab-pane fade in active">
								<div class="page-content">
									<div class="row">
										<div class="col-xs-12">  
										<form action="<%=request.getContextPath()%>/trendAnalysis" method="post">
												<div class="row">
													<div class="col-xs-12">
														 <div class="table-header">
															 <small>趋势分析</small>  
														</div>    
												<div class="table-responsive">
													<!-- table(1) -->
													<table id="sample-table-2" class="table table-striped table-bordered table-hover">
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
																<td style="line-height: 15px;">
																 <span style="position: relative;top: 3px;"> 
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
																	状态噪声协方差阵:<input type="text" value="${queryInfo.stateNoise}" name="stateNoise" id="num" onkeyup="value=value.replace(/[^\-?\d.]/g,'')" style="width: 80px">
																	<br>
																 <span style="margin-left: -5px;">观测噪声协方差阵: <input type="text" value="${queryInfo.obsNoise}" name="obsNoise" id="num" onkeyup="value=value.replace(/[^\-?\d.]/g,'')" style="width: 80px;"></span>
																	<!-- <br> -->
																		 <%--  x: <input type="checkbox" name="X" value="1" <c:if test="${X == 'true'}">checked="true"</c:if>>
																		  y: <input type="checkbox" name="Y" value="2" <c:if test="${Y == 'true'}">checked="true"</c:if>>
																	      h: <input type="checkbox" name="H" value="3" <c:if test="${H == 'true'}">checked="true"</c:if>> --%>
																	</span>
																</td>
																<td class="center" style="line-height: 15px;position: relative;top:10px;">
																<select id="selType" name="dateModel" style="width: 130px; ">
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
																
																<input id="startTime" class="Wdate" style="height: 30px;width:130px;" readonly="true" value="${queryInfo.timeStart}" name="time3" onclick="createWdatePicker();" onfocus="createWdatePicker();" />
																	<i style="position: relative;top:0px;left:-25px;" class="icon-chevron-down sp" ></i>
																</td>
																<td  style="line-height: 15px;position: relative;top:10px;">
																	<input id="showstarttime" type="text" style="height: 30px;width:150px;" name="timeStart" value="${queryInfo.timeStart}"/>
																	&nbsp;<span class="sp">-</span>&nbsp;
																	<input id="showendtime" type="text" style="height: 30px;width:150px; " name="timeEnd" value="${queryInfo.timeEnd}"/>
																</td>
																	
																<!-- 抚顺版 --> 
															    <%--  <td  style="line-height: 20px;position: relative;top:15px;width:60px;">
																	 <c:forEach items="${TrendanalysisMSment }" var="MS">
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
																	
																<td style="line-height: 15px;width:450px;">
																	<c:forEach var="monitorStation" items="${monitorStationList}">
																		<input type="submit" id="1"  class="btn btn-primary" name="monitorStationName" value="${monitorStation.name }" style="position: relative;top:6px;margin: 5px;"/>
																	 </c:forEach>
																</td>
															</tr> 
														  </thead>
														</table>   
														
														<div id="main" style="height: 400px"></div> 
													<script type="text/javascript">
														// 基于准备好的dom，初始化echarts实例
														var myChart = echarts.init(document.getElementById('main'));
														// 指定图表的配置项和数据
										
														option = {
															  title : {
																text : '${name}'
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
														option.xAxis[0].data = ${datae};
														option.series[0].data = ${x};
														option.series[1].data = ${y};
														option.series[2].data = ${h};
														// 使用刚指定的配置项和数据显示图表。
														myChart.setOption(option);
													</script> 
														 
													<!-- 默认值 -->
													<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.2.1.min.js"></script>
													
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
														        var vdefault = $("input[name=Q]").val();  
														        //alert(vdefault);
														        if(vdefault == null || vdefault==""){
														        	$("input[name=Q]").val(0.01);
														        }   
														        
														        var Rdefault = $("input[name=R]").val();  
														        //alert(vdefault);
														        if(Rdefault == null || Rdefault==""){
														        	$("input[name=R]").val(9);
														        } 
														});  
													   </script> 
													</div>
												</div>
											</div>  
										</form> 
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