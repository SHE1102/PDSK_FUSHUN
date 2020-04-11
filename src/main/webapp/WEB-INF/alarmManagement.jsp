<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta charset="utf-8"/>
    <title>警报管理</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/jquery-ui-1.10.3.custom.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/web/css/alarm.css"/>
    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-rtl.min.css"/>--%>
    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-skins.min.css"/>--%>

    <script src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>

</head>

<body>
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li><i class="icon-home home-icon"></i><a href="<%=request.getContextPath()%>/summary" target="right">首页</a>
            </li>
            <li>&nbsp;后台管理 &nbsp;</li>
            <li class="active">&nbsp;警报管理</li>
        </ul>

    </div>

    <div class="page-content" style="background-color: #EEEEEE">

        <div id="light" class="whiteContent">
            <h3 style="font-size: 18px;color: #428BCA;font-weight: bold;">信息提示</h3><br>
            <p style="font-size: 15px;">${msg}</p>
            <input type="hidden" id="msg" value="${msg}">
            <button class="btn btn-primary" style="margin-top: 15px;width: 75px;" onclick="closeMsgModel()">
                <a href="javascript:void(0)" onclick="closeMsgModel()" style="text-decoration: none;color: white">关闭</a>
            </button>
        </div>
        <div id="fade" class="blackMask"></div>

        <div class="row">
            <div class="col-xs-12">

                <div class="table-header">
                    <small>警报管理
                        <span style="font-weight: bold;">
                            （说明：本系统具有专业的警报系统，通过设置警报阈值，系统将在每次更新数据后，根据阈值进行判断，
                             若出现超限数据，则会发送一封警报邮件至用户指定邮箱）
                        </span>
                        <span class="pull-right" style="margin-right: 20px;font-weight: bold;">建议使用腾讯企业邮箱</span>
                    </small>
                </div>



                    <!-- 数据表格 -->
                <div class="tab-content no-border padding-24" id="tab" style="height: 100%;">
                    <div class="page-content" style="background-color: #EEEEEE;">
                        <div class="row">
                            <div class="col-xs-12">
                                <!-- <div class="table-header">
                                    <small>用户管理 </small>
                                </div> -->
                                <div class="table-responsive">
                                    <form class="form-horizontal" role="form" style="background-color: #EEEEEE" action="<%=request.getContextPath()%>/alarmManagement/update" method="post">
                                        <div class="modal-body" align=center style="height: 810px;" id="showform">
                                            <%-- <div class="input-group input-group-lg" style="width: 350px;">
                                                <span class="input-group-addon">邮件主题:</span> <input type="text"
                                                    class="form-control" ="subjectemail" name="subjectemail"
                                                    value="${mail1.subjectemail }" placeholder="请输入必填信息">
                                            </div>
                                            <div class="input-group input-group-lg" style="width: 350px;">
                                                <span class="input-group-addon"><span style="position: relative;bottom: 85px;">邮件内容:</span> <textarea
                                                        name="mailcontent" id="mailcontent"
                                                        style="width: 350px; height: 200px;" placeholder="请输入邮件信息">${mail1.mailcontent }</textarea></span>
                                                <!-- 多行文本框 -->
                                            </div>
                                            <br> --%>
                                            <div class="input-group input-group-lg" style="width: 400px;">
                                                <span class="input-group-addon">系统名称:</span>
                                                <input type="text" class="form-control" id="" name="subjectemail"
                                                    value="${email.subjectemail}" placeholder="请输入必填信息">
                                                </input>
                                            </div>
                                            <br>
                                            <div class="input-group input-group-lg" style="width: 400px;">
                                                <span class="input-group-addon">使用状态:
                                                    <c:if test="${email.state ==1}">
                                                        <label style="color: blue;" class="sys">启用</label>
                                                    </c:if>
                                                    <c:if test="${email.state ==0}">
                                                        <label style="color: blue;" class="sys">停用</label>
                                                    </c:if>&nbsp;
                                                    <input type="radio" id="state" name="state"
                                                           value="1">启用&nbsp;
                                                    <input type="radio" id="state" name="state"
                                                           value="0">停用
                                                    <input type="hidden" id="states" name="states"
                                                           value="${email.state}">
                                                </span>
                                            </div>
                                            <br>
                                            <div class="input-group input-group-lg" style="width: 400px;">
                                                <span class="input-group-addon">危险阈值:</span>
                                                <input type="text" class="form-control" id="" name="threshold"
                                                    value="${email.threshold}" placeholder="请输入必填信息"
                                                    onkeyup="value=value.replace(/[^\-?\d.]/g,'')"
                                                    pattern="^[0-9.]*$" required
                                                    oninvalid="setCustomValidity('请输入一个大于零的数');"
                                                    oninput="setCustomValidity('');">
                                                </input>
                                                <span class="input-group-addon">mm</span>
                                            </div>
                                            <br>
                                            <div class="input-group input-group-lg" style="width: 400px;">
                                                <span class="input-group-addon">警报阈值:</span>
                                                <input type="text" class="form-control" id="" name="mailcontent"
                                                    value="${email.mailcontent }" placeholder="请输入必填信息"
                                                    onkeyup="value=value.replace(/[^\-?\d.]/g,'')"
                                                    pattern="^[0-9.]*$" required
                                                    oninvalid="setCustomValidity('请输入一个大于零的数');"
                                                    oninput="setCustomValidity('');">
                                                </input>
                                                <span class="input-group-addon">mm</span>
                                            </div>
                                            <br>
                                            <%-- <div class="input-group input-group-lg" style="width: 350px;">
                                                <span class="input-group-addon">SMTP协议: </span> <select
                                                    class="form-control" name="smtp" id="smtp">
                                                    <c:if test="${mail1.smtp !=''}">
                                                        <option style="width: 200px" value="${mail1.smtp }">${mail1.smtp }</option>
                                                    </c:if>
                                                    <!-- <option>请选SMTP择协议</option> -->
                                                    <option>smtp.exmail.qq.com</option>
                                                </select>
                                                <input type="text"  class="form-control" id="smtp"  name="smtp" value="${mail1.smtp }"  placeholder="请输入必填信息">
                                            </div>
                                            <br>
                                            <div class="input-group input-group-lg" style="width: 350px;">
                                                <span class="input-group-addon">端口:</span> <select
                                                    class="form-control" name="port" id="port">
                                                    <c:if test="${mail1.port !=''}">
                                                        <option value="${mail1.port }">${mail1.port }</option>
                                                    </c:if>
                                                    <!-- <option>请选SMTP端口</option> -->
                                                    <option>25</option>

                                                </select>
                                                 <input type="text"  class="form-control" id="port"  name="port" value="${mail1.port }"  placeholder="请输入必填信息">
                                            </div> --%>
                                            <br>
                                            <div class="input-group input-group-lg" style="width: 400px;">
                                                    <span style="font-size: 18px;">
                                                        <span style="color: #307ECC;font-weight: bold;">发件人邮箱信息设置：</span><br><br>
                                                    (此处填写的是邮件发件人的邮箱账号密码，用户接收邮箱请至个人信息页面进行设置)
                                                    </span>
                                                <%-- <input type="text"
                                                        class="form-control" id="addresser" name="addresser"
                                                        value="${mail1.addresser }" placeholder="请输入必填信息"></input> --%>
                                            </div>
                                            <br>
                                            <div class="input-group input-group-lg" style="width: 400px;">
                                                <span class="input-group-addon">邮箱账号:</span><input
                                                    type="text"
                                                    class="form-control" id="addresser" name="addresser"
                                                    value="${email.addresser }"
                                                    placeholder="请输入必填信息"></input>
                                            </div>
                                            <br>
                                            <div class="input-group input-group-lg" style="width: 400px;">
                                                <span class="input-group-addon">邮箱密码:</span><input
                                                    type="password"
                                                    class="form-control" id="password" name="password"
                                                    value="${email.password }"
                                                    placeholder="请输入必填信息"></input>
                                            </div>
                                            <br>
                                            <div class="input-group input-group-lg" style="width: 350px;">
                                                <input type="hidden" class="form-control" id="namef"
                                                       name="id"
                                                       value="${email.id}"></input>
                                            </div>
                                            <br>

                                            <div id="but"
                                                 style="position: relative; left: 0%; top: 0%;width: auto;">
                                                <button type="submit" id="but" class="btn btn-primary">提交
                                                </button>&nbsp;&nbsp;&nbsp;
                                                <button type="reset" id="but" class="btn btn-primary">重置
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<script type="text/javascript">
    function closeMsgModel() {
        $("#light").css("display","none");
        $("#fade").css("display","none");
    }

    $(function () {

        var msg = $("#msg").val();
        if (msg != null && msg != "") {
            $('#light').show();
            $("#light").css("display","block");
            $("#fade").css("display","block");
            return false;
        }

        <!-- 判断使用状态  -->
        $('.sys').each(function () {
            var val = $(this).text();
            if (val == "启用") {
                $('input[type=radio]').eq(0).attr('checked', 'checked');
            } else {
                $('input[type=radio]').eq(1).attr('checked', 'checked');
            }
        })

    });
</script>


<!-- 全选，全不选 -->
<script type="text/javascript">
    function getAll() {
        var tit = document.getElementById('all');
        var inputs = document.getElementsByTagName("input");
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].type == "checkbox") {
                if (tit.checked == true) {
                    inputs[i].checked = true;
                } else {
                    inputs[i].checked = false;
                }
            }
        }
    }
</script>

</html>