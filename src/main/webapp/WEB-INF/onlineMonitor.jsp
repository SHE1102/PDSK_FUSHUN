<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>在线监测</title>

	<link href="<%=request.getContextPath()%>/static/assets/css/bootstrap.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/font-awesome.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/jquery-ui-1.10.3.custom.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-rtl.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-skins.min.css" />

	<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>

<!-- 后加的  -->
<%-- <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/bootindex.css">
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/echarts.common.min.js"></script> --%>


<%--  <!-- 打印 --> 
<script  src="<%=request.getContextPath()%>/js/print/jquery-1.4.4.min.js"></script>
<script  src="<%=request.getContextPath()%>/js/print/jquery.jqprint-0.3.js"></script> --%>

<!-- <script type="text/javascript">
	function print(){
		$("#sample-table-2").jqprint();
	}
</script> -->

<!-- <script src="assets/js/ace-extra.min.js"></script> -->

<!-- echarts(js) -->
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/echarts.min.js"></script>


<link rel="stylesheet" href="<%=request.getContextPath()%>/static/move/js.css">
<script src ="<%=request.getContextPath()%>/static/move/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/move/js.js"></script>

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
	line-height:17px;
	font-weight: bold;
	width:85px;
	color: white;
	background-color: #c5464a;
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
/* .font_inner li{
	padding-left: 100px;
} */
#tab{
	margin:2px -20px 0px -20px;
}
#ta{
	margin:10px 0px;
}
html{
	background-color: white;
}
</style>
</head>
<body id="body" style="background-color: white;">
	<!--  style="width: 1712px;" -->
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try {
				ace.settings.check('breadcrumbs', 'fixed')
			} catch (e) {
			}
		</script>
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i><a href="<%=request.getContextPath()%>/summary" target="right">首页</a></li>
			<li> 形变监测 &nbsp;</li>
			<li class="active"> 在线监测</li>
		</ul>
		<!-- 加载首页 -->
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
		 <!--  <a href="#" class="pull-right btn-xs"><button type="button"
				class="btn btn-primary" id="btn" onclick="aa()" >
				<i class="icon-print"></i>打印 </button>
		</a>  -->  
	</div>
 
 	<!-- style="width: 1725px;" -->
	<div class="page-content"> 
		<!-- <div class="page-header">
			<h1> 在线监测 </h1>
		</div> -->
		 
		<div class="row">
			<div class="col-xs-12">   
			
				<!-- 警告框 -->
					<div class="table-header">
							<small>在线监测</small>&nbsp;&nbsp;&nbsp;
							<!--   <a href="#" class="pull-right btn-xs"><button type="button"
									class="btn btn-primary" id="btn" onclick="aa()" >
									<i class="icon-print"></i>打印 </button>
							</a>  -->
							<div id="export" class="dropdown pull-right navbar-header" role="navigation" style="margin-right: 20px;">
								    <button type="button" class="btn btn-primary dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">工具
								        <span class="caret"></span>
								    </button>
								    <ul class="dropdown-menu" id="menu" role="menu" aria-labelledby="dropdownMenu1"> 
								          <li><a href="#" onclick="aa()" >打    印</a></li>
								          <li><a data-type="txt" href="javascript:;">导出Txt</a></li> 
							       		  <li><a data-type="json" href="javascript:;">导出Json</a></li>
								          <!-- <li><a data-type="csv" href="javascript:;">导出csv</a></li> -->
								          <li><a data-type="xls" href="javascript:;">导出Excel</a></li>
								          <li><a data-type="doc" href="javascript:;">导出Word</a></li>
								    </ul>   
								</div> 		
							 
							<small class="pull-right" style="margin-right: 20px;"><span id="timeShows" name="dq" style="color: white;font-weight: bold;"></span>&nbsp;&nbsp;&nbsp;
							<span id="name"  style="color: white;font-weight: bold;"></span> </small>
				  </div> 
				  <!--  <div class="alert alert-info">
					<i class="ace-icon fa fa-hand-o-right"></i>  
							<div style="height: 10px;">
								<div style="position: relative; left: 0px; top: -3px;">
									<label id="timeShows" name="dq" style="color: red;font-weight: bold;"/>
									<span id="timeShows" name="dq" style="color: LightSlateBlue;font-weight: bold;"></span>
									&nbsp;&nbsp;&nbsp;
									<label id="name" style="color: LightSlateBlue;font-weight: bold;" /> 
									<span id="name"  style="color: LightSlateBlue;font-weight: bold;"></span>
								</div>
								<div style="position: relative; left: 0%; top: 0%;float: left;">
									
								</div>
						</div> 
					  <button class="close" style="position: relative;top:-15px;" data-dismiss="alert">
						<i class="icon-remove"></i>
					  </button>  
				</div>        -->
				
			 	<%-- <div class="swiper_wrap" style="width: 1620px;">
					<ul class="font_inner">
						<li>
							1.X方向表示沿坝轴线方向，往坝左肩方向为正值，往右坝肩方向为负值
						</li>
						<li>
							2.Y方向表示垂直坝轴线方向，往hg大坝下游为正值，往大坝上游为负值
						</li>
						<li>
							3.Z方向表示高程方向，往上抬升为负值，往下沉降为正值
						</li>
						<li>
							4.水平位移变化最大点按(dx)2+(dy)2值统计，竖向位移最大点按|dz|值统计 ${t }
						</li>
						<li> 
							<label id="timeShows" name="dq" style="color: red;font-weight: bold;"/> 
						</li>
						<li>
							<label id="name" style="color: LightSlateBlue;font-weight: bold;" /> 
						</li>
					</ul>
					<a href="javascript:void(0)" class="lt">&lt;</a>
					<a href="javascript:void(0)" class="gt">&gt;</a>
				</div>   --%>
							
					<!-- 打印 -->		
					<script src="<%=request.getContextPath()%>/static/print/jquery-1.4.4.min.js"></script>
					<script src="<%=request.getContextPath()%>/static/print/jquery.jqprint-0.3.js"></script>
					<script > 
						function aa(){
							$("#sample-table-2").jqprint();
						} 
					</script> 
			
				<!-- PAGE CONTENT BEGINS -->
				<div class="tabbable" id="ta">
					<ul class="nav nav-tabs padding-18 tab-size-bigger" id="myTab">
						<li class="active">
							<a data-toggle="tab" href="#faq-tab-1">在线监测数据图</a>
						</li>
						<li>
							<a data-toggle="tab" href="#faq-tab-2">在线监测数据表</a>
						</li>
						<li class="pull-right">
							<a data-toggle="tab" href="#faq-tab-3">在线监测说明</a>
						</li>
					</ul>
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
					<!-- 单次报表 -->
						<div class="tab-content no-border padding-24" id="tab">
							<div id="faq-tab-1" class="tab-pane fade in active">
							 
							 <div id="main" style="height: 400px"></div> 

						   <script type="text/javascript">
						        // 基于准备好的dom，初始化echarts实例
						        var myChart = echarts.init(document.getElementById('main'));
						        // 指定图表的配置项和数据

						        /* 
						                                       勿动
						        var s = ${ListY};
				                var series=[];
				                var g = null;
				                for(var i in s){
				                	 g= s[i]
				                	
				                		series.push({
				                			"name":g[0]+'dx',  
				                            "type":"line",
				                            "data":g[1],                            
										    "smooth":true,//设成曲线
										 	"symbolSize": 5,						
				                    	} ,{
				                    		"name":g[0]+'dy',  
				                            "type":"line",
				                            "data":g[2],                            
										    "smooth":true,//设成曲线
										 	"symbolSize": 5,
				                    	},{
				                    		"name":g[0]+'dz',  
				                            "type":"line",
				                            "data":g[3],                            
										    "smooth":true,//设成曲线
										 	"symbolSize": 5,
				                    	} )
				                	
				                } */
						        
						        option = {
												
										tooltip : {
											trigger : 'axis'
										},
										toolbox : {
							                feature : {
							                    saveAsImage : {}
							                }
							            },
										legend : {
											data : [ 'x', 'y', 'h']
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
						
						        option.xAxis[0].data = ${list};
						        option.series[0].data = ${al};
						        option.series[1].data = ${al1};
						        option.series[2].data = ${al2};
						        /* option. series[3].data= ${al3};   */
						        // 使用刚指定的配置项和数据显示图表。
						        myChart.setOption(option);
						    </script>  
						    
						</div> 
						
						<div id="faq-tab-2" class="tab-pane fade">
						
							<div class="page-content" >
									<div class="row">
										<div class="col-xs-12"> 
										<form action="" id="excelForm" method=""> 
												<div class="row">
													<div class="col-xs-12">
												<div class="table-responsive">
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
																<!-- <th colspan="3" rowspan="2">本次观测值</th> -->
																<th colspan="3" rowspan="2">本次观测值(m)</th>
																<th colspan="3" rowspan="2">初始观测值(m)</th>
															</tr>	
															<tr>
																<!-- <th colspan="2">水平位移</th>
																<th>竖向位移</th>
																<th colspan="2">水平位移</td>
																<th>竖向位移</th> -->
																<!-- <th colspan="3">观测时间</th>
																<th colspan="3">观测时间</th> -->
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
															  <c:forEach var="StationTobrows" items="${StationTobrows2}" varStatus="xh">
																<tr id="hh">
																	<!-- <td class="center"><label><input
																		type="checkbox" name="check" class="ace" id="ace"/><span class="lbl"></span>
																</label></td>-->
																	  <td align=center>${xh.index+1}</td>  
																	<td align=center>${StationTobrows.name }</td>
													                <td align=center class="sys">${StationTobrows.recordTime }</td>
													                <td align=center>${StationTobrows.sKxSingleChange }</td>
													                <td align=center>${StationTobrows.sKySingleChange }</td>
													                <td align=center>${StationTobrows.sDhSingleChange }</td>
													
													                <td align=center>${StationTobrows.sKxAccChange}</td>
													                <td align=center>${StationTobrows.sKyAccChange }</td>
													                <td align=center>${StationTobrows.sDhAccChange}</td>
													
													                <td align=center>${StationTobrows.original_SKx }</td>
													                <td align=center>${StationTobrows.original_SKY }</td>
													                <td align=center>${StationTobrows.original_SDz }</td>
													
													                <td align=center>${StationTobrows.original_Scx }</td>
													                <td align=center>${StationTobrows.original_ScY }</td>
													                <td align=center>${StationTobrows.original_Scz}</td>
																</tr>
																	</c:forEach> 
															</tbody> 
														</table> <!--endprint1--> 
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
						
						<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.2.1.min.js"></script>
						<script type="text/javascript">
						$(document).ready(function(){  
				  			$('.sys').each(function(){
				  				var val = $(this).text();
				  				var timeone = val.slice(0,10);
				  				var timetwo = val.slice(11,13)
				  				$(this).text(timeone+"          "+timetwo);
				  				/* alert(timeone+"                     "+timetwo); */
				  			}) 
				  		});
						</script> 
						<div id="faq-tab-3" class="tab-pane fade" style="height: 100%;background-color: white;"> 
							<div class="center" id="book" style="font-size: 20px;">
		 						 说明:<br>${txt.instructions}
		 						 
		 						  <%-- 1.X方向表示沿坝轴线方向，往坝左肩方向为正值，往右坝肩方向为负值<br />
									2.Y方向表示垂直坝轴线方向，往hg大坝下游为正值，往大坝上游为负值<br />
									3.Z方向表示高程方向，往上抬升为负值，往下沉降为正值 <br /> 
									4.水平位移变化最大点按(dx)2+(dy)2值统计，竖向位移最大点按|dz|值统计 ${t }  --%>
									<!-- <div style="height: 50px;">
										<div style="position: relative; left: -0px; top: 0px;">
											<label id="timeShows" name="dq" style="color: red;font-weight: bold;"/> 
										</div>
										<div style="position: relative; left: 0%; top: 0%;"> 
											<label id="name" style="color: LightSlateBlue;font-weight: bold;" /> 
									 	</div>
									</div>   -->
							</div>   
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> 
				 	
							
	<!-- 全选，全不选 -->
	 <!--  <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>   --> 
	<script type="text/javascript">
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
	</script>	 
	
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
	
	<script src="<%=request.getContextPath()%>/static/login/Blob.js"></script>
	
	<script src="<%=request.getContextPath()%>/static/login/FileSaver.js"></script>
	
	<script src="<%=request.getContextPath()%>/static/login/tableExport.js"></script>
	<script> 
		var $exportLink = document.getElementById('export'); 
		
		$exportLink.addEventListener('click', function(e){ 
			
			e.preventDefault();
			
			if(e.target.nodeName === "A"){
				
				tableExport('sample-table-2', '在线监测', e.target.getAttribute('data-type'));
				
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


<script language="javascript">
    var t = null;
    t = setTimeout(time, 1000);//开始执行
    function time() {
    	var s = ${t};
        clearTimeout(t);//清除定时器
        var currentDT = new Date();
        var y, m, date, day, hs, ms, ss;
        y = currentDT.getFullYear(); //四位整数表示的年份
        m = currentDT.getMonth() + 1; //月
        date = currentDT.getDate(); //日
        day = currentDT.getDay(); //星期
        hs = currentDT.getHours(); //时
        ms = currentDT.getMinutes(); //分
        ss = currentDT.getSeconds(); //秒
        
    	ms = extra(ms);
		ss = extra(ss);
		hs = extra(hs);
		m = extra(m);
		date = extra(date); 
		
        document.getElementById("timeShows").innerHTML = "当前时间为：" + y + "-" + m
                + "-" + date + " " + hs + ":" + ms + ":" + ss;
        
        if (s == 1) {
            var hss = hs + 1;
            document.getElementById("name").innerHTML = "下次更新时间为:" + y + "-"
                    + m + "-" + date + " " + hss + ":" + "00" + ":" + "00";
        } 
        
        if(s == 2){
            if (hs % s == 0) {
                var hss = hs + s;
                document.getElementById("name").innerHTML = "下次更新时间为:" + y
                        + "-" + m + "-" + date + " " + hss + ":" + "00" + ":"+ "00";
            } else if (hs % s == 1) {
                var hss = hs + 1;
                document.getElementById("name").innerHTML = "下次更新时间为:" + y
                        + "-" + m + "-" + date + " " + hss + ":" + "00" + ":"+ "00";
            }
        }
        
        if(s == 4){
        	if(hs>=8 && hs<12){
        		document.getElementById("name").innerHTML = "下次更新时间为:" + y
                + "-" + m + "-" + date + " " + "12" + ":" + "00" + ":"+ "00";
        	}
        	if(hs>=12 && hs<16){
        		document.getElementById("name").innerHTML = "下次更新时间为:" + y
                + "-" + m + "-" + date + " " + "16" + ":" + "00" + ":"+ "00";
        	}
        	if(hs>=16 && hs<20){
        		document.getElementById("name").innerHTML = "下次更新时间为:" + y
                + "-" + m + "-" + date + " " + "20" + ":" + "00" + ":"+ "00";
        	}
        	if(hs>=0 && hs<4){
        		document.getElementById("name").innerHTML = "下次更新时间为:" + y
                + "-" + m + "-" + date + " " + "4" + ":" + "00" + ":"+ "00";
        	}
        	if(hs>=4 && hs<8){
        		document.getElementById("name").innerHTML = "下次更新时间为:" + y
                + "-" + m + "-" + date + " " + "8" + ":" + "00" + ":"+ "00";
        	}
        	if (hs == 20 || hs == 21 || hs == 22 || hs == 23 || hs == 0) {
                document.getElementById("name").innerHTML = "下次更新当前时间为:" + y
                        + "-" + m + "-" + date+1 + "   " + "00" + ":" + "00"
                        + ":" + "00";
            }
        }
        
        if(s == 6){
        	if(hs>=0 && hs<6){
        		document.getElementById("name").innerHTML = "下次更新时间为:" + y
                + "-" + m + "-" + date + " " + "6" + ":" + "00" + ":"+ "00";
        	}
        	if(hs>=6 && hs<12){
        		document.getElementById("name").innerHTML = "下次更新时间为:" + y
                + "-" + m + "-" + date + " " + "12" + ":" + "00" + ":"+ "00";
        	}
        	if(hs>=12 && hs<18){
        		document.getElementById("name").innerHTML = "下次更新时间为:" + y
                + "-" + m + "-" + date + " " + "18" + ":" + "00" + ":"+ "00";
        	}
        	
        	if(hs>=18 && hs<=23){
        		document.getElementById("name").innerHTML = "下次更新时间为:" + y
                + "-" + m + "-" + date+1 + " " + "00" + ":" + "00" + ":"+ "00";
        	}
        }
         if(s == 8){
        	 if(hs>=0 && hs<8){
         		document.getElementById("name").innerHTML = "下次更新时间为:" + y
                 + "-" + m + "-" + date + " " + "8" + ":" + "00" + ":"+ "00";
         	} 
        	 if(hs>=8 && hs<16){
          		document.getElementById("name").innerHTML = "下次更新时间为:" + y
                  + "-" + m + "-" + date + " " + "16" + ":" + "00" + ":"+ "00";
          	} 
        	 if(hs>=16 && hs<=23){
          		document.getElementById("name").innerHTML = "下次更新时间为:" + y
                  + "-" + m + "-" + date+1 + " " + "00" + ":" + "00" + ":"+ "00";
          	}
        	 
         }
         if(s == 12){
        	 if(hs>=0 && hs<12){
          		document.getElementById("name").innerHTML = "下次更新时间为:" + y
                  + "-" + m + "-" + date + " " + "12" + ":" + "00" + ":"+ "00";
          	} 
        	 if(hs>=12 && hs<23){
           		document.getElementById("name").innerHTML = "下次更新时间为:" + y
                   + "-" + m + "-" + date+1 + " " + "00" + ":" + "00" + ":"+ "00";
           	}
         }
        t = setTimeout(time, 100); //设定定时器，循环执行
        
      //如果分秒为个数,就在前面加0
		function extra(x) {
			if (x < 10) {
				return "0" + x;
			}else {
				return x;
			}
		} 
    }
</script>


<script language="JavaScript">
    function myrefresh() {
        window.location.reload();
    }
    setTimeout('myrefresh()', 600000); //指定1秒刷新一次
</script>

</html>