<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>基线信息</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/font-awesome.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace.min.css" />
	<%--<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/jquery-ui-1.10.3.custom.min.css" />--%>
	<%--<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-rtl.min.css" />--%>
	<%--<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-skins.min.css" />--%>

<style type="text/css">
html{
	background-color: white;
}
#hh {
	font-weight: bold;
}

#tab {
	margin: 22px -25px;
	padding: 0px;
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
	margin:-8px -20px 0px -20px;
}
.black_overlay{ display: none; position: absolute; top: 0%; left: 0%; width: 100%; height: 100%; background-color: black; z-index:1001; -moz-opacity: 0.6; opacity:.60; filter: alpha(opacity=60); } 
.white_content { display: none; position: absolute; top: 30%; left: 35%; width: 300px; height:180px; padding: 5px; border: 3px solid #307ECC; background-color: white; z-index:1002; overflow: auto;text-align: center; } 
</style> 
  
</head>
<body> 

	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i><a href="<%=request.getContextPath()%>/summary" target="right">首页</a></li>
			<li>
				<c:if test="${model==2 }">后台管理</c:if>
				<c:if test="${model!=2 }">工程信息</c:if>&nbsp;
			</li>
			<li class="active">
				<c:if test="${model==2 }">基线管理</c:if>
				<c:if test="${model!=2 }">基线信息</c:if>
			</li>
		</ul>
	</div>

	<div class="page-content" id="con">

		<div id="light" class="white_content">
			<h3 style="font-size: 18px;color: #428BCA;font-weight: bold;">信息提示</h3><br>
			<p style="font-size: 15px;">输入的页码有误,请重新输入！</p>
			<button class="btn btn-primary" style="margin-top: 15px;width: 75px;" onclick="two()"><a href="javascript:void(0)" onclick="two()" style="text-decoration: none;color: white">关闭</a></button>
		</div>
		<div id="fade" class="black_overlay"></div>

		<div class="row">
			<div class="col-xs-12">
				<div class="tabbable">
					<!-- 数据表格 -->
					<div class="tab-content no-border padding-24" id="tab">
						<div class="page-content">
							<div class="row">
								<div class="col-xs-12">
									<div class="table-header">
										  <c:if test="${model==2 }"><small>基线管理</small></c:if>
										  <c:if test="${model!=2 }"><small>基线信息</small></c:if> &nbsp;&nbsp;&nbsp;

										<div id="export" class="dropdown pull-right navbar-header" role="navigation" style="margin-right: 20px;">
											<button type="button" class="btn btn-primary dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">工具
												<span class="caret"></span>
											</button>
											<ul class="dropdown-menu" id="menu" role="menu" aria-labelledby="dropdownMenu1">
												<li><a href="#" onclick="preview(1)">打    印</a></li>
												<li><a data-type="txt" href="javascript:;">导出Txt</a></li>
												<li><a data-type="json" href="javascript:;">导出Json</a></li>
												<li><a data-type="xls" href="javascript:;">导出Excel</a></li>
												<li><a data-type="doc" href="javascript:;">导出Word</a></li>
											</ul>
										</div>
									</div>

									<div class="table-responsive">
										<table id="sample-table-2" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th rowspan="2">编号</th>
													<th rowspan="2">基线</th>
													<th rowspan="2">更新时间</th>
													<th colspan="3">WGS84 空间坐标系统基线分量(m)</th>
													<th colspan="3">监测坐标系统基线分量(m)</th>
													<th colspan="3">监测坐标系统基线变化量(mm)</th>
													<th rowspan="2">解算状态</th>
												</tr>
												<tr>
													<th>DX </th>
													<!-- <th>DX(m)</th> -->
													<th>DY</th>
													<th>DZ </th>
													<th>dx </th>
													<th>dy </th>
													<th>dh </th>
													<th>ddx</th>
													<th>ddy </th>
													<th>ddh </th>
												</tr>
											</thead>
											<tbody id="j_tb">
												  <c:forEach var="BaselineManagement"
													items="${page.stationList}" varStatus="status">
													<tr id="hh">
														<td>${status.index+1}</td>
														<%-- <td>${BaselineManagement.id}</td> --%>
														<td>${BaselineManagement.name}</td>
														<td>${BaselineManagement.recordTime}</td>
														<td><fmt:formatNumber type="number" value="${BaselineManagement.deltax}" maxFractionDigits="5"></fmt:formatNumber></td>
														<td><fmt:formatNumber type="number" value="${BaselineManagement.deltay}" maxFractionDigits="5"></fmt:formatNumber></td>
														<td><fmt:formatNumber type="number" value="${BaselineManagement.deltaz}" maxFractionDigits="5"></fmt:formatNumber></td>
														<td><fmt:formatNumber type="number" value="${BaselineManagement.sDx}" maxFractionDigits="5"></fmt:formatNumber></td>
														<td><fmt:formatNumber type="number" value="${BaselineManagement.sDy}" maxFractionDigits="5"></fmt:formatNumber></td>
														<td><fmt:formatNumber type="number" value="${BaselineManagement.sDh}" maxFractionDigits="5"></fmt:formatNumber></td>
														<td><fmt:formatNumber type="number" value="${BaselineManagement.sKxSingleChange}" maxFractionDigits="1"></fmt:formatNumber></td>
														<td>
															<c:if test="${BaselineManagement.sKySingleChange !=0}">
																<fmt:formatNumber type="number" value="${BaselineManagement.sKySingleChange}" maxFractionDigits="1"></fmt:formatNumber>
															</c:if>
															<c:if test="${BaselineManagement.sKySingleChange==0}">0.0</c:if>
														</td>
														<td><fmt:formatNumber type="number" value="${BaselineManagement.sDhSingleChange}" maxFractionDigits="1"></fmt:formatNumber></td>
														<td>
															<c:if test="${(BaselineManagement.sKxSingleChange)>=50 or (BaselineManagement.sKySingleChange)>=50 or (BaselineManagement.sDhSingleChange)>=50 or(BaselineManagement.sKxSingleChange)<=-50 or (BaselineManagement.sKySingleChange)<=-50 or (BaselineManagement.sDhSingleChange)<=-50}"><span class="sys"> 异常 </span></c:if>
															<c:if test="${(BaselineManagement.sKxSingleChange)<50 and (BaselineManagement.sKySingleChange)<50 and (BaselineManagement.sDhSingleChange)<50 and (BaselineManagement.sKxSingleChange)>-50 and (BaselineManagement.sKySingleChange)>-50 and (BaselineManagement.sDhSingleChange)>-50}"><span> 正常</span></c:if>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>

									<!-- 分页 -->
									<%--<c:if test="${model==2}">
										<form action="<%=request.getContextPath()%>/baselineManagement" class="center">
											<tr>
												<td colspan="14" align="center">
													<ul class="pagination">
														<li><a href="<%=request.getContextPath()%>/baselineManagement/2/1">首页</a></li>
														<li>
															<c:if test="${page.currPageNum>1}">
																<a href="<%=request.getContextPath()%>/baselineManagement/2/${page.currPageNum-1}">上一页</a>
															</c:if>
														</li>
														<li>
															<input type="text" id="select" value="${page.currPageNum}" name="currPageNum" style="width: 75px;">
														</li>
														<li>
															<input type="submit"  class="btn btn-primary btn-sm" value="跳转" onclick="return chose()" style="line-height: 15px;margin-top: -5px;">
														</li>
														<li>
															<c:if test="${page.currPageNum<page.totalPageSize}">
																<a href="<%=request.getContextPath()%>/baselineManagement/2/${page.currPageNum+1}">下一页</a>
															</c:if>
														</li>
														<li>
															<a href="<%=request.getContextPath()%>/baselineManagement/2/${page.totalPageSize}">尾页</a>
														</li>
														<input type="hidden" name="model" value="2" />
													</ul>
													当前第<span style="color: #307ECC;font-weight: bold;">${page.currPageNum}</span>页 /共<span style="color: #307ECC;font-weight: bold;">${page.totalPageSize}</span>页
													/每页显示<span style="color: #307ECC;font-weight: bold;">${page.pageSize}</span>条记录
												</td>
											</tr>
										</form>
									</c:if>

									<c:if test="${model==1 }">
										<form action="<%=request.getContextPath()%>/baselineManagement" class="center">
											<tr>
												<td colspan="14" align="center">
													<ul class="pagination">
														<li><a href="<%=request.getContextPath()%>/baselineManagement/1/1">首页</a></li>
														<li>
															<c:if test="${page.currPageNum>1}">
																<a href="<%=request.getContextPath()%>/baselineManagement/1/${page.currPageNum-1}">上一页</a>
															</c:if>
														</li>
														<li>
															<input type="text" id="select" onkeyup="value=value.replace(/[^\-?\d.]/g,'')" value="${page.currPageNum}" name="currPageNum" style="width: 75px;">
														</li>
														<li>
															<input type="submit" class="btn btn-primary btn-sm" value="跳转" onclick="return chose()" style="line-height: 15px;margin-top: -5px;"></li>
														<li>
															<c:if test="${page.currPageNum<page.totalPageSize}">
																<a href="<%=request.getContextPath()%>/baselineManagement/1/${page.currPageNum+1}">下一页</a>
															</c:if>
														</li>
														<li>
															<a href="<%=request.getContextPath()%>/baselineManagement/1/${page.totalPageSize}">尾页</a>
														</li>
														<input type="hidden" name="model" value="1" />
													</ul>
													当前第<span style="color: #307ECC;font-weight: bold;">${page.currPageNum}</span>页 /共<span id="sp" style="color: #307ECC;font-weight: bold;">${page.totalPageSize}</span>页
													/每页显示<span style="color: #307ECC;font-weight: bold;">${page.pageSize}</span>条记录
												</td>
											</tr>
										</form>
									</c:if>--%>

									<form action="<%=request.getContextPath()%>/baselineManagement" class="center">
										<tr>
											<td colspan="14" align="center">
												<ul class="pagination">
													<li><a href="<%=request.getContextPath()%>/baselineManagement/${model}/1">首页</a></li>
													<li>
														<c:if test="${page.currPageNum>1}">
															<a href="<%=request.getContextPath()%>/baselineManagement/${model}/${page.currPageNum-1}">上一页</a>
														</c:if>
													</li>
													<li>
														<input type="text" id="select" onkeyup="value=value.replace(/[^\-?\d.]/g,'')" value="${page.currPageNum}" name="currPageNum" style="width: 75px;">
													</li>
													<li>
														<input type="submit" class="btn btn-primary btn-sm" value="跳转" onclick="return chose()" style="line-height: 15px;margin-top: -5px;"></li>
													<li>
														<c:if test="${page.currPageNum<page.totalPageSize}">
															<a href="<%=request.getContextPath()%>/baselineManagement/${model}/${page.currPageNum+1}">下一页</a>
														</c:if>
													</li>
													<li>
														<a href="<%=request.getContextPath()%>/baselineManagement/${model}/${page.totalPageSize}">尾页</a>
													</li>
													<input type="hidden" name="model" value="${model}" />
												</ul>
												当前第<span style="color: #307ECC;font-weight: bold;">${page.currPageNum}</span>页 /共<span id="sp" style="color: #307ECC;font-weight: bold;">${page.totalPageSize}</span>页
												/每页显示<span style="color: #307ECC;font-weight: bold;">${page.pageSize}</span>条记录
											</td>
										</tr>
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 显示异常数据 -->
	<script type="text/javascript">
        $(document).ready(function(){
            $(".sys").each(function(){
                var val =  $(this).text();
                $(this).parents("tr").css({'color':'red','font-weight':'bold'});
            });
        });
	</script>

	<!-- 分页提示  -->
	<script type="text/javascript">
        function two(){
            document.getElementById('light').style.display='none';
            document.getElementById('fade').style.display='none'
        }

        function chose(){
            var val = $('#select').val();
            var num = parseInt(val);

            if(num == 0){
                $('#light').show();
                document.getElementById('light').style.display='block';
                document.getElementById('fade').style.display='block' ;
                return false;
            }else{
                if(num > '${page.totalPageSize}'){
                    $('#light').show();
                    document.getElementById('light').style.display='block';
                    document.getElementById('fade').style.display='block';
                    return false;
                }else{
                }
            }
        }
	</script>

	<!-- js打印 -->
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

	<!--导出表格-->
	<script>
        var $exportLink = document.getElementById('export');
        $exportLink.addEventListener('click', function(e){
            e.preventDefault();
            if(e.target.nodeName === "A"){
                tableExport('sample-table-2', '<c:if test="${on==2 }">基线管理 </c:if><c:if test="${on!=2 }">基线信息 </c:if>', e.target.getAttribute('data-type'));
            }
        }, false);
	</script>

	<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/static/util/Blob.js"></script>
	<script src="<%=request.getContextPath()%>/static/util/FileSaver.js"></script>
	<script src="<%=request.getContextPath()%>/static/util/tableExport.js"></script>

</body>
</html>