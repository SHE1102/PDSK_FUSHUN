<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>用户管理</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/web/css/usersManagement.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace.min.css"/>
    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/jquery-ui-1.10.3.custom.min.css"/>--%>
    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-rtl.min.css"/>--%>
    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-skins.min.css"/>--%>

</head>
<body>
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li><i class="icon-home home-icon"></i><a href="<%=request.getContextPath()%>/summary" target="right">首页</a>
            </li>
            <li>&nbsp;后台管理 &nbsp;</li>
            <li class="active">&nbsp;用户管理</li>
        </ul>
    </div>

    <div class="page-content">

        <div id="light" class="whiteContent">
            <h3 style="font-size: 18px;color: #428BCA;font-weight: bold;">信息提示</h3><br>
            <p style="font-size: 15px;">输入的页码有误,请重新输入！</p>
            <button class="btn btn-primary" style="margin-top: 15px;width: 75px;" onclick="closeMsg()">
                <a href="javascript:void(0)" onclick="closeMsg()" style="text-decoration: none;color: white">关闭</a>
            </button>
        </div>
        <div id="fade" class="blackMask"></div>

        <div id="light1" class="whiteContent">
            <h3 style="font-size: 18px;color: #428BCA;font-weight: bold;">信息提示</h3><br>
            <p style="font-size: 15px;">${msg}！</p>
            <input type="hidden" id="msg" value="${msg}">
            <button class="btn btn-primary" style="margin-top: 15px;width: 75px;" onclick="closeMsg()">
                <a href="javascript:void(0)" onclick="closeMsg()" style="text-decoration: none;color: white">关闭</a>
            </button>
        </div>
        <div id="fade1" class="blackMask"></div>

        <div class="row">
            <div class="col-xs-12">
                <!-- 数据表格 -->
                <div class="tab-content no-border padding-24" id="tab">
                    <div class="page-content">
                        <div class="row">
                            <div class="col-xs-12">

                                <div class="table-header">
                                    <small>用户管理</small> &nbsp;&nbsp;

                                    <div id="export" class="dropdown pull-right navbar-header" role="navigation" style="margin-right: 20px;">
                                        <a href="javascript:void(0)" onclick="update();" title="添加" style="margin-right: 10px;">
                                            <button type="button" class="btn btn-primary">添加用户</button>
                                        </a>&nbsp;

                                        <button type="button" class="btn btn-primary dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">工具
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" id="menu" role="menu"
                                            aria-labelledby="dropdownMenu1">
                                            <li><a href="#" onclick=preview(1)>打 印</a></li>
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
                                                <th>账号</th>
                                                <th>密码</th>
                                                <th>姓名</th>
                                                <th>联系电话</th>
                                                <th>邮箱</th>
                                                <th>邮件状态</th>
                                                <th>权限</th>
                                                <th class="hidden-480" style="color: gray;">&nbsp;操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="user" items="${page.userList}" varStatus="status">
                                                <tr class="userRow">
                                                    <td>${status.index+1}</td>
                                                    <td style="display: none;">${user.id}</td>
                                                    <td>${user.name}</td>
                                                    <td>${user.password}</td>
                                                    <td>${user.realname}</td>
                                                    <td>${user.phone}</td>
                                                    <td>${user.mail}</td>
                                                    <td>
                                                        <c:if test="${user.status==1}">正在使用</c:if>
                                                        <c:if test="${user.status==0}">暂停使用</c:if>
                                                    </td>
                                                    <td>
                                                        <c:if test="${user.permissions==0}">普通用户</c:if>
                                                        <c:if test="${user.permissions==1}">管理员</c:if>
                                                        <c:if test="${user.permissions==2}">超级管理员</c:if>
                                                    </td>
                                                    <td style="width: 300px;">
                                                        &nbsp;&nbsp;&nbsp;
                                                        <a href="javascript:void(${user.id})" onclick="return update(this);" class="blue" title="修改" style="text-decoration: none;">
                                                            <button type="button" class="btn btn-primary btn-xs">
                                                                <i class="icon-pencil bigger-130" style="font-size: 10px;"></i>&nbsp;修 改
                                                            </button>
                                                        </a>
                                                        &nbsp;&nbsp;&nbsp;
                                                        <a class="blue" title="删除" href="<%=request.getContextPath()%>/usersManagement/deleteUser/${user.id}/${page.currPageNum}" onclick="return confirm('你确定要删除该数据？')">
                                                            <button type="button" class="btn btn-primary btn-xs">
                                                                <i class="icon-trash bigger-130" style="font-size: 10px;"></i>&nbsp;删 除
                                                            </button>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                    <!-- 分页 -->
                                    <form action="<%=request.getContextPath()%>/usersManagement" class="center">
                                                <tr>
                                                    <td colspan="8">
                                                        <ul class="pagination">
                                                            <li>
                                                                <a href="<%=request.getContextPath()%>/usersManagement/1">首页</a>
                                                            </li>
                                                            <li>
                                                                <c:if test="${page.currPageNum>1}">
                                                                    <a href="<%=request.getContextPath()%>/usersManagement/${page.currPageNum-1}">上一页</a>
                                                                </c:if>
                                                            </li>
                                                            <li>
                                                                <input type="text" id="select" value="${page.currPageNum}" name="currPageNum" style="width: 75px;">
                                                            </li>
                                                            <li>
                                                                <input type="submit" class="btn btn-primary btn-sm" value="跳转" onclick="return chose()" style="line-height: 15px;margin-top: -5px;">
                                                            </li>
                                                            <li>
                                                                <c:if test="${page.currPageNum<page.totalPageSize}">
                                                                    <a href="<%=request.getContextPath()%>/usersManagement/${page.currPageNum+1}">下一页</a>
                                                                </c:if>
                                                            </li>
                                                            <li>
                                                                <a href="<%=request.getContextPath()%>/usersManagement/${page.totalPageSize}">尾页</a>
                                                            </li>
                                                        </ul>
                                                        当前第<span style="color: #307ECC;font-weight: bold;">${page.currPageNum}</span>页
                                                        /共<span style="color: #307ECC;font-weight: bold;">${page.totalPageSize}</span>页
                                                        /每页显示<span style="color: #307ECC;font-weight: bold;">${page.pageSize}</span>条记录
                                                    </td>
                                                </tr>
                                            </form>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- 添加   -->
                    <form action="<%=request.getContextPath()%>/usersManagement/insertUser" method="post">
                        <div class="modal fade" id="update" aria-hidden="true">
                            <div class="modal-dialog" style="width: 500px;">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">×</button>
                                        <h4 class="modal-title">添加用户</h4>
                                    </div>
                                    <div class="modal-body" align="center">
                                        <input type="hidden" name="lastPageNum" value="${page.totalPageSize}">
                                        <input type="hidden" id="on" value="2"/>

                                        <div class="input-group input-group-lg" style="width: 350px;">
                                            <span class="input-group-addon">账号</span>
                                            <input type="text" class="form-control" name="name" placeholder="请输入添加信息" required="required">
                                        </div>
                                        <br>

                                        <div class="input-group input-group-lg" style="width: 350px;">
                                            <span class="input-group-addon">密码</span>
                                            <input type="text" class="form-control" name="password" placeholder="请输入添加信息" pattern="^[a-zA-Z0-9]{3,18}$" required oninvalid="setCustomValidity('请输入3-18位的字母或者数字');" oninput="setCustomValidity('');">
                                        </div>
                                        <br>

                                        <div class="input-group input-group-lg" style="width: 350px;">
                                            <span class="input-group-addon">姓名</span>
                                            <input type="text" class="form-control" name="realname" placeholder="请输入添加信息" required="required">
                                        </div>
                                        <br>

                                        <div class="input-group input-group-lg" style="width: 350px;">
                                            <span class="input-group-addon">联系电话</span>
                                            <input type="text" class="form-control" name="phone" placeholder="请输入添加信息" pattern="^1[3|5|7|8][0-9]{9}$" required oninvalid="setCustomValidity('请输入11位的手机号码');" oninput="setCustomValidity('');">
                                        </div>
                                        <br>

                                        <div class="input-group input-group-lg" style="width: 350px;">
                                            <span class="input-group-addon">邮箱</span>
                                            <input type="email" class="form-control" name="mail" placeholder="请输入添加信息" required>
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

                    <!-- 修改 -->
                    <form action="<%=request.getContextPath()%>/usersManagement/updateUser" method="post">
                        <!-- 编号 -->
                        <input type="hidden" name="id" id="na">
                        <div class="modal fade" id="update1" aria-hidden="true">
                            <div class="modal-dialog" style="width: 500px;">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">×</button>
                                        <h4 class="modal-title">修改用户</h4>
                                    </div>
                                    <div class="modal-body" align="center">
                                        <input type="hidden" name="currPageNum" value="${page.currPageNum}">
                                        <input type="hidden" id="on" value="2"/>

                                        <div class="input-group input-group-lg" style="width: 350px;">
                                            <span class="input-group-addon">账号</span>
                                            <input type="text" class="form-control" id="name" name="name" required="required">
                                        </div>
                                        <br>

                                        <div class="input-group input-group-lg" style="width: 350px;">
                                            <span class="input-group-addon">密码</span>
                                            <input type="text" class="form-control" id="namea" name="password" pattern="^[a-zA-Z0-9]{3,18}$" required oninvalid="setCustomValidity('请输入3-18位的字母或者数字');" oninput="setCustomValidity('');">
                                        </div>
                                        <br>

                                        <div class="input-group input-group-lg" style="width: 350px;">
                                            <span class="input-group-addon">姓名</span>
                                            <input type="text" class="form-control" id="nameb" name="realname" required="required">
                                        </div>
                                        <br>

                                        <div class="input-group input-group-lg" style="width: 350px;">
                                            <span class="input-group-addon">联系电话</span>
                                            <input type="text" class="form-control" id="namec" name="phone" pattern="^1[3|5|7|8][0-9]{9}$" required oninvalid="setCustomValidity('请输入11位的手机号码');" oninput="setCustomValidity('');">
                                        </div>
                                        <br>

                                        <div class="input-group input-group-lg" style="width: 350px;">
                                            <span class="input-group-addon">邮箱</span>
                                            <input type="email" class="form-control" id="named" name="mail" required="required">
                                        </div>
                                        <br>

                                        <div class="input-group input-group-lg" style="width: 350px;">
                                            <%----%><span class="input-group-addon">
                                            <span class="pull-left">权限&nbsp;</span>
                                            <input type="text" style="width: 80px; height: 30px;" readonly="readonly" id="nameh" name="permission"></input>
                                            <input type="radio" name="permissions" value="0">用户</input>
                                            <input type="radio" name="permissions" value="1">管理</input>
                                            <input type="radio" name="permissions" value="2">超级管理</input>
                                            <input type="hidden" name="permission" value="${user.permissions}">
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
        </div>
    </div>

</body>

<script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/util/Blob.js"></script>
<script src="<%=request.getContextPath()%>/static/util/FileSaver.js"></script>
<script src="<%=request.getContextPath()%>/static/util/tableExport.js"></script>
<script src="<%=request.getContextPath()%>/static/web/js/usersManagement.js"></script>

</html>