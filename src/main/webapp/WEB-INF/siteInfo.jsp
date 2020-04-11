<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>站点信息</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/web/css/siteInfo.css"/>
    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/jquery-ui-1.10.3.custom.min.css" />--%>
    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-rtl.min.css" />--%>
    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-skins.min.css" />--%>

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
                <c:if test="${model==2 }">站点管理</c:if>
                <c:if test="${model!=2 }">站点信息</c:if>
            </li>
        </ul>
    </div>

    <div class="page-content">
        <div id="light" class="white_content">
            <h3 style="font-size: 18px;color: #428BCA;font-weight: bold;">信息提示</h3><br>
            <p style="font-size: 15px;">输入的页码有误,请重新输入！</p>
            <button class="btn btn-primary" style="margin-top: 15px;width: 75px;" onclick="closeMsg()"><a href="javascript:void(0)" onclick="closeMsg()" style="text-decoration: none;color: white">关闭</a></button>
        </div>
        <div id="fade" class="black_overlay"></div>

        <div id="light1" class="white_content">
            <h3 style="font-size: 18px;color: #428BCA;font-weight: bold;">信息提示</h3><br>
            <p style="font-size: 15px;">${msg}！</p>
            <input type="hidden" name="msg" value="${msg}">
            <button class="btn btn-primary" style=" margin-top: 15px;width: 75px;" onclick="closeMsg()"><a href="javascript:void(0)" onclick="closeMsg()" style="text-decoration: none;color: white">关闭</a></button>
        </div>
        <div id="fade1" class="black_overlay"></div>

        <!-- 数据表格 -->
        <div class="tab-content no-border padding-24" id="tab">
            <div class="page-content">
                <div class="table-header">
                    <c:if test="${model==2 }"><small>站点管理</small></c:if>
                    <c:if test="${model!=2 }"><small>站点信息</small></c:if>&nbsp;&nbsp;
                    <div id="export" class="dropdown pull-right navbar-header" role="navigation" style="margin-right: 20px;">
                        <c:if test="${model==2 }">
                            <a href="javascript:void(0)"  title="添加" style="margin-right: 10px;">
                                <button type="button" class="btn btn-primary" onclick="update()">添加站点</button>
                            </a>&nbsp;
                        </c:if>

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
                            <th>编号</th>
                            <th>站点名</th>
                            <th class="hidden-480">高斯平面x初始坐标</th>
                            <th>高斯平面y初始坐标</th>
                            <th>监测坐标系x初始坐标</th>
                            <th>监测坐标系y初始坐标</th>
                            <th>高程h初始坐标</th>
                            <th>基准站</th>
                            <c:if test="${model==2 }">
                                <th class="hidden-480" style="color: gray;">&nbsp;操作</th>
                            </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="site" items="${pages.siteInfoList}" varStatus="status">
                            <tr id="hh" >
                                <td>${status.index+1 }</td>
                                <td style="display: none;">${site.id }</td>
                                <td>${site.name}</td>
                                <td class="hidden-480">${site.originalsDx }</td>
                                <td>${site.originalsDy }</td>
                                <td class="hidden-480">${site.originalsKx }</td>
                                <td class="hidden-480">${site.originalsKy }</td>
                                <td class="hidden-480">${site.originalsDh }</td>
                                <td class="hidden-480">
                                    <c:if test="${site.mid==1}">是</c:if>
                                    <c:if test="${site.mid ==0}">否 </c:if>
                                </td>

                                <c:if test="${model==2 }">
                                    <td style="width: 300px;">
                                        &nbsp;&nbsp;&nbsp;
                                        <a href="javascript:void(${site.id})" onclick="return update(this);" class="blue" title="修改" style="text-decoration: none;">
                                            <button type="button" class="btn btn-primary btn-xs" >
                                                <i class="icon-pencil bigger-130" style="font-size: 10px;"></i>&nbsp;修   改
                                            </button>
                                        </a>
                                        &nbsp;&nbsp;&nbsp;
                                        <a class="blue" title="删除" href="<%=request.getContextPath()%>/deleteSite/${site.id }/${pages.currPageNum}">
                                            <button type="button" class="btn btn-primary btn-xs" onclick="return confirm('你确定要删除该数据？')">
                                                <i class="icon-trash bigger-130" style="font-size: 10px;"></i>&nbsp;删   除
                                            </button>
                                        </a>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- 分页 -->
                <%--<c:if test="${model==3}">
                    <form action="<%=request.getContextPath()%>/siteInfo" class="center">
                        <tr>
                            <td colspan="8" align="center">
                                <ul class="pagination">
                                    <li><a href="<%=request.getContextPath()%>/siteInfo/1/1">首页</a></li>
                                    <li>
                                        <c:if test="${pages.currPageNum>1}">
                                            <a href="<%=request.getContextPath()%>/siteInfo/1/${pages.currPageNum-1}">上一页</a>
                                        </c:if>
                                    </li>
                                    <li>
                                        <input type="text" id="select" value="${pages.currPageNum}" name="currPageNum" style="width: 75px;">
                                    </li>
                                    <li>
                                        <input type="submit" class="btn btn-primary btn-sm" value="跳转" onclick="return chose()" style="line-height: 15px;margin-top: -5px;">
                                    </li>
                                    <li>
                                        <c:if test="${pages.currPageNum<pages.totalPageSize}">
                                            <a href="<%=request.getContextPath()%>/siteInfo/1/${pages.currPageNum+1}">下一页</a>
                                        </c:if></li>
                                    <li>
                                        <a href="<%=request.getContextPath()%>/siteInfo/1/${pages.totalPageSize}">尾页</a>
                                    </li>
                                    <input type="hidden" name="model" value="1" />
                                </ul>
                                当前第<span style="color: #307ECC;font-weight: bold;">${pages.currPageNum}</span>页 /共<span style="color: #307ECC;font-weight: bold;">${pages.totalPageSize}</span>页
                                /每页显示<span style="color: #307ECC;font-weight: bold;">${pages.pageSize}</span>条记录
                            </td>
                        </tr>
                    </form>
                </c:if>

                <c:if test="${model==3 }">
                    <form action="<%=request.getContextPath()%>/siteInfo" class="center">
                        <tr>
                            <td colspan="9" align="center">
                                <ul class="pagination">
                                    <li><a href="<%=request.getContextPath()%>/siteInfo/2/1">首页</a></li>
                                    <li>
                                        <c:if test="${pages.currPageNum>1}">
                                            <a href="<%=request.getContextPath()%>/siteInfo/2/${pages.currPageNum-1}">上一页</a>
                                        </c:if>
                                    </li>
                                    <li>
                                        <input type="text" id="select" value="${pages.currPageNum}" name="currPageNO" style="width: 75px;">
                                    </li>
                                    <li>
                                        <input type="submit" class="btn btn-primary btn-sm" value="跳转" onclick="return chose()" style="line-height: 15px;margin-top: -5px;">
                                    </li>
                                    <li>
                                        <c:if test="${pages.currPageNum<pages.totalPageSize}">
                                            <a href="<%=request.getContextPath()%>/siteInfo/2/${pages.currPageNum+1}">下一页</a>
                                        </c:if>
                                    </li>
                                    <li>
                                        <a href="<%=request.getContextPath()%>/siteInfo/2/${pages.totalPageSize}">尾页</a>
                                    </li>
                                    <input type="hidden" name="model" value="2" />
                                </ul>
                                当前第<span style="color: #307ECC;font-weight: bold;">${pages.currPageNum}</span>页 /共<span style="color: #307ECC;font-weight: bold;">${pages.totalPageSize}</span>页
                                /每页显示<span style="color: #307ECC;font-weight: bold;">${pages.pageSize}</span>条记录
                            </td>
                        </tr>
                    </form>
                </c:if>--%>

                <form action="<%=request.getContextPath()%>/siteInfo" class="center">
                    <tr>
                        <td colspan="8" align="center">
                            <ul class="pagination">
                                <li><a href="<%=request.getContextPath()%>/siteInfo/${model}/1">首页</a></li>
                                <li>
                                    <c:if test="${pages.currPageNum>1}">
                                        <a href="<%=request.getContextPath()%>/siteInfo/${model}/${pages.currPageNum-1}">上一页</a>
                                    </c:if>
                                </li>
                                <li>
                                    <input type="text" id="select" value="${pages.currPageNum}" name="currPageNum" style="width: 75px;">
                                </li>
                                <li>
                                    <input type="submit" class="btn btn-primary btn-sm" value="跳转" onclick="return chose()" style="line-height: 15px;margin-top: -5px;">
                                </li>
                                <li>
                                    <c:if test="${pages.currPageNum<pages.totalPageSize}">
                                        <a href="<%=request.getContextPath()%>/siteInfo/${model}/${pages.currPageNum+1}">下一页</a>
                                    </c:if></li>
                                <li>
                                    <a href="<%=request.getContextPath()%>/siteInfo/${model}/${pages.totalPageSize}">尾页</a>
                                </li>
                                <input type="hidden" name="model" value="${model}" />
                            </ul>
                            当前第<span style="color: #307ECC;font-weight: bold;">${pages.currPageNum}</span>页 /共<span style="color: #307ECC;font-weight: bold;">${pages.totalPageSize}</span>页
                            /每页显示<span style="color: #307ECC;font-weight: bold;">${pages.pageSize}</span>条记录
                            ${msg}
                        </td>
                    </tr>
                </form>

            </div>

            <!--添加站点-->
            <form action="<%=request.getContextPath()%>/insertSite" method="post">
                <div class="modal fade" id="update" aria-hidden="true">
                    <div class="modal-dialog" style="width: 500px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">×</button>
                                <h4 class="modal-title">添加站点</h4>
                            </div>
                            <div class="modal-body" align="center">
                                <div class="input-group input-group-lg" style="width: 350px;">
                                    <span class="input-group-addon">站点名</span>
                                    <input type="text" class="form-control"  name="name" placeholder="请输入添加信息">
                                </div>
                                <br>

                                <div class="input-group input-group-lg" style="width: 350px;">
                                    <span class="input-group-addon">高斯平面x坐标(m)</span>
                                    <input type="text" class="form-control"  name="originalsDx" placeholder="请输入添加信息">
                                </div>
                                <br>

                                <div class="input-group input-group-lg" style="width: 350px;">
                                    <span class="input-group-addon">高斯平面y坐标(m)</span>
                                    <input type="text" class="form-control"  name="originalsDy" placeholder="请输入添加信息">
                                </div>
                                <br>

                                <div class="input-group input-group-lg" style="width: 350px;">
                                    <span class="input-group-addon">水库独立x初始(m)</span>
                                    <input type="text" class="form-control"  name="originalsKx" placeholder="请输入添加信息">
                                </div>
                                <br>

                                <div class="input-group input-group-lg" style="width: 350px;">
                                    <span class="input-group-addon">水库独立y初始(m)</span>
                                    <input type="text" class="form-control"  name="originalsKy" placeholder="请输入添加信息">
                                </div>
                                <br>

                                <div class="input-group input-group-lg" style="width: 350px;">
                                    <span class="input-group-addon">高程h初始(m)</span>
                                    <input type="text" class="form-control"  name="originalsDh" placeholder="请输入添加信息">
                                </div>
                                <br>

                                <div class="input-group input-group-lg" style="width: 350px;">
                                    <span class="input-group-addon">基准站：
                                        &nbsp;<input type="radio" name="mid" value="1" checked>是</input>
                                        &nbsp;<input type="radio" name="mid" value="0">否</input>
                                    </span>
                                </div>
                                <br>

                                <div class="input-group input-group-lg" style="width: 350px;">
                                    <input type="hidden" class="form-control" name="personNamef" placeholder="请输入添加信息">
                                    <input type="hidden" class="form-control" name="lastPageNum" value="${pages.totalPageSize}">
                                </div>
                                <br>
                            </div>

                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">提交</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <!--修改站点-->
            <form action="<%=request.getContextPath()%>/updateSite" method="post">
                <div class="modal fade" id="update1" aria-hidden="true">
                    <div class="modal-dialog" style="width: 500px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">×</button>
                                <h4 class="modal-title">修改站点信息</h4>
                            </div>
                            <div class="modal-body" align="center">
                                <div class="input-group input-group-lg" style="width: 350px;">
                                    <span class="input-group-addon">站点名</span>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="请输入添加信息">
                                </div>

                                <br><input type="hidden" id="on" value="2" />

                                <div class="input-group input-group-lg" style="width: 350px;">
                                    <span class="input-group-addon">高斯平面x坐标(m)</span>
                                    <input type="text" class="form-control" id="namea" name="originalsDx" placeholder="请输入添加信息">
                                </div>
                                <br>

                                <div class="input-group input-group-lg" style="width: 350px;">
                                    <span class="input-group-addon">高斯平面y坐标(m)</span>
                                    <input type="text" class="form-control" id="nameb" name="originalsDy" placeholder="请输入添加信息">
                                </div>
                                <br>

                                <div class="input-group input-group-lg" style="width: 350px;">
                                    <span class="input-group-addon">水库独立x初始(m)</span>
                                    <input type="text" class="form-control" id="namec" name="originalsKx" placeholder="请输入添加信息">
                                </div>
                                <br>

                                <div class="input-group input-group-lg" style="width: 350px;">
                                    <span class="input-group-addon">水库独立y初始(m)</span>
                                    <input type="text" class="form-control" id="named" name="originalsKy" placeholder="请输入添加信息">
                                </div>
                                <br>

                                <div class="input-group input-group-lg" style="width: 350px;">
                                    <span class="input-group-addon">高程h初始(m)</span>
                                    <input type="text" class="form-control" id="namee" name="originalsDh" placeholder="请输入添加信息">
                                </div>
                                <br>

                                <div class="input-group input-group-lg" style="width: 350px;">
                                    <span class="input-group-addon">基准站：
                                        <input type="text" style="width: 120px; height: 30px;" readonly="readonly" id="nameh" name="personNameh" placeholder=""></input>
                                        &nbsp;<input type="radio" name="mid" value="1">是</input>
                                        &nbsp;<input type="radio" name="mid" value="0">否</input>
                                    </span>
                                </div>
                                <br>

                                <div class="input-group input-group-lg" style="width: 350px;">
                                    <input type="hidden" class="form-control" id="namef" name="id" placeholder="请输入添加信息">
                                    <input type="hidden" class="form-control" name="currPageNum" value="${pages.currPageNum}">
                                </div>
                                <br>
                            </div>

                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary">提交</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

        </div>
    </div>
</body>

<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/util/Blob.js"></script>
<script src="<%=request.getContextPath()%>/static/util/FileSaver.js"></script>
<script src="<%=request.getContextPath()%>/static/util/tableExport.js"></script>
<script src="<%=request.getContextPath()%>/static/web/js/siteInfo.js"></script>

</html>
