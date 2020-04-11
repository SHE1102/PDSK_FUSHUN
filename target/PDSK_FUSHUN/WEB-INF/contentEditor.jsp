<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>内容编辑</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link href="<%=request.getContextPath()%>/static/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/jquery-ui-1.10.3.custom.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-skins.min.css" />
    
<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>

<!-- <script src="assets/js/ace-extra.min.js"></script>  -->
<style type="text/css">
#hh {
	font-weight: bold;
}

#hh:HOVER {
	color: red;
	font-weight: bold;
}

#tab {
	margin: 22px -25px;
	padding: 0px;
}
#sub{
	font-size: 8px;
	padding: 5px 10px 5px 10px;
	line-height:20px;
	font-weight: bold;
	color: white;
	background-color: #c5464a;
	cursor: pointer;
	border:none;
	outline:none; 
	border-radius: 10px 10px 10px 10px; 
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
#cug:hover{
	list-style: none;
}
#but{
	width: 155px;
	height: 45px;
	font-weight: bold;
}
#tab{
	margin:1px -20px 0px -20px;
}
#myTab{
	margin: 9px 0px;
}
html{
	background-color: white;
}
/* #ta{
	margin:-12px 0px;
} */
 
</style> 
</head>
<body>
	<div class="breadcrumbs" id="breadcrumbs">
		<!-- <script type="text/javascript">
			try {
				ace.settings.check('breadcrumbs', 'fixed')
			} catch (e) {
			}
		</script> -->
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i><a href="<%=request.getContextPath()%>/summary" target="right">首页</a></li>
			<li>&nbsp;后台管理  &nbsp;</li>
			<li class="active">&nbsp;内容编辑</li>
		</ul>
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
	</div>

	<div class="page-content"> 
		<!-- <div class="page-header">
			<h1>内容编辑</h1> 
		</div> -->
		    
		<div class="row">
			<div class="col-xs-12">  
			
				<div class="table-header" id="ta">
						 <small>内容编辑</small>
				 </div>  
				<!-- <div class="alert alert-info">
						<i class="ace-icon fa fa-hand-o-right"></i>
 						 内容编辑
						<button class="close" data-dismiss="alert">
							<i class="icon-remove"></i>
						</button>
				    </div>-->  
				   <!-- <div class="table-header">
							<small>工程详情</small>
				  </div>   <br> -->
				    
				  <div class="tabbable" id="ta">  
					  <ul class="nav nav-tabs padding-18 tab-size-bigger" id="myTab">
						<li class="active"><a data-toggle="tab" href="#faq-tab-1">首页
						</a></li>
						<li><a data-toggle="tab" href="#faq-tab-2">在线监测说明
						</a> </li>  
					</ul>   
					   
					<div class="tab-content no-border padding-24" id="tab"> 
						  <div id="faq-tab-1" class="tab-pane fade in active">
							<div class="page-content" style="height: 640px;position: absolute;left: 0px; top: 0px;">
								<div class="row">
									<div class="col-xs-12">
										<div class="row">
											<div class="col-xs-12"> 
												<div class="table-responsive">
													<form action="<%=request.getContextPath()%>/contentEditor" method="post">
													        <c:if test="${txt != null }">
													 		<input type="hidden" name="id" value="${txt.id }">
													 		</c:if>  
															<div style="height: 640px;width:100%;">  
														    <!-- 加载编辑器的容器 -->
															    <script id="container" name="content" type="text/plain" style="width:100%;height:200px;">${txt.txt}</script>
																<button type="submit" class="btn btn-info" style="margin:5px;height: 45px;width: 120px;z-index: 9999; position: fixed ! important; left: 15px; top: 790px;">提交</button>
														    </div> 
													 </form> 
												</div>
											</div>
										</div> 
									  </div>
								</div> 
							</div> 
						</div>    
						
						<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>   
						<script type="text/javascript">
						 $(function(){
					        $("p").each(function(){
					            var val =$(this).html();
					            $(this).replaceWith(val);
					        });
						 })  
						</script>   --%>
						
						<div id="faq-tab-2" class="tab-pane fade">
							<div class="page-content" style="height: 640px;position: absolute;left: 0px; top: 0px;">
								<div class="row">
									<div class="col-xs-12">
										<div class="row">
											<div class="col-xs-12"> 
												<div class="table-responsive">
													<form action="<%=request.getContextPath()%>/contentEditor" method="post">
													        <c:if test="${txt != null }">
													 		<input type="hidden" name="id" value="${txt.id }">
													 		</c:if> 
													 		<%-- <input type="hidden" name="id" value="${txt.id }">    --%>
															<div style="height: 640px;width: 100%;">
														    <!-- 加载编辑器的容器 --> 
															    <script id="container2" name="instructions" type="text/plain" style="width:100%;height:200px;">${txt.instructions}</script>
															    <button type="submit" class="btn btn-info" style="margin:5px;height: 45px;width: 120px;z-index: 9999; position: fixed ! important; left: 15px; top: 790px;">提交</button>
														    </div>
														  
													 </form> 
												</div>
											</div>
										</div> 
									  </div>
								</div> 
							</div> 
						</div> 
<!-- -------------------------------------------------------------------------------------------------------------------------------- -->				 
					</div>
				</div>  
			</div>
		</div>
	</div>
	
	<!-- 配置文件 -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/utf8-jsp/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/utf8-jsp/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var ue = UE.getEditor('container');        
    </script>
    <script type="text/javascript">
        var ue = UE.getEditor('container2');        
    </script>
 
</body>
</html>