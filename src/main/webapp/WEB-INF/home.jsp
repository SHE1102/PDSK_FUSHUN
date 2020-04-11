<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/9 0009
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="EN">
<head>
    <meta charset="utf-8" />
    <title>北斗/GNSS全天候变形监测系统</title>
    <!-- basic styles -->
    <link href="<%=request.getContextPath()%>/static/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/assets/css/ace-skins.min.css" />
    <script src="<%=request.getContextPath()%>/static/assets/js/ace-extra.min.js"></script>

    <style type="text/css">
        #user-photo ul li a:HOVER {
            background-color: SkyBlue;
        }
        #user-photo>ul>li {
            background-color: #438EB9;
        }
        button{
            font-size: 8px;
            padding: 5px 10px 5px 10px;
            line-height:20px;
            font-weight: bold;
            color: white;
            background-color: #c5464a;
            cursor: pointer;
            border:none;
            outline:none;
            border-radius: 8px 8px 8px 8px;
        }
        #login:hover{
            color: red;
        }

        #footer {
            width: 100%;
            height:20px;
            line-height:20px;
            /* background: #00A2EA; */
            /* background:#FAFAFA; */
            border-top:1px solid #eeeeee;
            background:#FAFAFA;
            clear: both;
            color:#5A5A5A;

            position: fixed;
            left: 0px;
            right: 0px;
            bottom: 0px;
            margin: auto;
        }
        #img{
            height: 30px;
            width: 100px;

        }
    </style>

    <script type="text/javascript">
        function Status(st) {
            var status = st;
            var id = "${users.id}";
            var name = "${users.name}";
            $.post("Status", {
                status : status,
                id : id,
                name : name
            },function(data) {
                if (data == 0) {
                    $("#samp0").html("不接收");
                    $("#samp1").hide();
                    $("#samp2").hide();
                } else if (data == 1) {
                    $("#samp0").html("接收");
                    $("#samp1").hide();
                    $("#samp2").hide();
                }
            });
        }

    </script>
</head>
<body id="body">
<div class="navbar navbar-default" id="navbar" style="height: 100%;">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>

    <!--标题栏-->
    <div class="navbar navbar-default" role="navigation">

        <div class="navbar-header pull-left">
            <a href="<%=request.getContextPath()%>/summary" target="right" class="navbar-brand">
                <small>
                    <SPAN style="font-size:20px;margin-left: 18px;position: relative;top:5px;" >PANDA 北斗/GNSS全天候变形监测系统<%-- &nbsp;&nbsp;${DB } --%></SPAN>
                </small>
            </a>
        </div>

        <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.2.1.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                if('${users.status}'== 0){
                    $('input[type=radio]').eq(0).attr("checked",'checked');
                }else{
                    $('input[type=radio]').eq(1).attr("checked",'checked');
                }
            });
        </script>

        <!--登录凭证-->
        <div id="user-photo" class="navbar-header pull-right" role="navigation" style="padding-right: 30px;padding-top: 3px;height:50px;line-height: 50px;">
            <ul class="nav ace-nav" style="line-height: 50px;height: 50px;">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <c:if test="${name != null }">
                            <span style="font-weight:bold;color:white;">&nbsp;${users.name }</span>
                        </c:if>
                        <c:if test="${name == null }">
                            <span onclick="login()" style="font-weight:bold;color:white;">&nbsp;${users.name }</span>
                        </c:if>
                        <i class="icon-caret-down"></i>
                    </a>
                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="#" id="my"<i class="blue icon-user"></i>个人信息</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="index.jsp" onclick="return confirm('确定退出系统吗？')"><i class="blue icon-off"></i>退出系统</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>


<!-- 签到 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $('#my').on('click',function(){
        $('#youModal').modal('show');
    });
</script>

<!--个人信息-->
<form action="ChangeUser" method="post">
    <div class="modal fade" id="youModal">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 420px;margin-left: 70px;margin-top: 85px;">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal"><span>&times;</span></button>
                    <h4 class="modal-title">个人信息</h4>
                </div>
                <div class="modal-body center" style="margin-left: 15px;font-size: 15px;">
                    邮件接收设置:<samp id="samp0"></samp>
                    <c:if test="${users.status==0 }">
                        <samp id="samp1">不接收</samp>
                    </c:if>
                    <c:if test="${users.status==1}">
                        <samp id="samp2">接收</samp>
                    </c:if>&nbsp;
                    <input type="radio" name="status" onclick="Status(0);" id="status1" value="0">不接收
                    <input type="radio" name="status" onclick="Status(1);" id="status2" value="1">接收

                    <br><br>
                    <div class="center">
                        <div class="input-group input-group-lg" style="width: 350px;">
                            <span class="input-group-addon">账号</span>
                            <input type="text" class="form-control" id="name" name="name" value="${users.name }" required="required">
                        </div>
                        <br>
                        <!-- 编号 -->
                        <input type="hidden" id="on" value="${users.id }" name="id"/>

                        <div class="input-group input-group-lg" style="width: 350px;">
                            <span class="input-group-addon">密码</span>
                            <input type="text" class="form-control" value="${users.password }" id="namea" name="password" pattern="^[a-zA-Z0-9]{3,18}$" required oninvalid="setCustomValidity('请输入3-18位的字母或者数字');" oninput="setCustomValidity('');">
                        </div>
                        <br>

                        <div class="input-group input-group-lg" style="width: 350px;">
                            <span class="input-group-addon">姓名</span>
                            <input type="text" class="form-control" value="${users.realname }" id="nameb" name="realname" required="required">
                        </div>
                        <br>

                        <div class="input-group input-group-lg" style="width: 350px;">
                            <span class="input-group-addon">联系电话</span>
                            <input type="text" class="form-control" value="${users.phone }" id="namec" name="phone" pattern="^1[3|5|7|8][0-9]{9}$" required oninvalid="setCustomValidity('请输入11位的手机号码');" oninput="setCustomValidity('');">
                        </div>
                        <br>

                        <div class="input-group input-group-lg" style="width: 350px;">
                            <span class="input-group-addon">邮箱</span>
                            <input type="email" class="form-control" value="${users.mail }" id="named" name="mail" required="required">
                        </div>

                        <div class="input-group input-group-lg" style="width: 350px;display: none;">
									<span class="input-group-addon">
                                        <span class="pull-left">权限&nbsp;</span>
									    <input type="text" style="width: 70px; height: 30px;" readonly="readonly"
                                           id="nameh" name="permission" value="${users.permissions }"></input>

                                        <input type="radio" name="permissions" value="0"/>用户
                                        <input type="radio" name="permissions" value="1"/>管理
                                        <input type="radio" name="permissions" value="2"/>超级管理
                                        <input type="hidden" name="permission" value="${users.permissions}">
									</span>
                        </div>
                        <br>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">提交</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">
    $(document).ready(function(){
        if('${users.permissions}' == 0){
            $('#nameh').val('普通用户');
            $('input[name=permissions]').eq(0).attr("checked",'checked');
        }else if('${users.permissions}' == 1){
            $('#nameh').val('管理员');
            $('input[name=permissions]').eq(1).attr("checked",'checked');
        }else{
            $('#nameh').val('超级管理');
            $('input[name=permissions]').eq(2).attr("checked",'checked');
        }
    });
</script>



<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div>
        <div class="main-container-inner">
            <a class="menu-toggler" id="menu-toggler" href="#">
                <span class="menu-text"></span>
            </a>
            <div class="sidebar" id="sidebar">
                <script type="text/javascript">
                    try {
                        ace.settings.check('sidebar', 'fixed')
                    } catch (e) {
                    }
                </script>

                <ul class="nav nav-list">
                    <li class="active"><!--首页-->
                        <a href="<%=request.getContextPath()%>/summary" target="right">
                            <i class="icon-home"></i><span class="menu-text"> 首页</span>
                        </a>
                    </li>
                    <li><!--工程信息-->
                        <a href="#" class="dropdown-toggle">
                            <i class="icon-th-list"></i>
                            <span class="menu-text"> 工程信息 </span>
                            <b class="arrow icon-angle-down"></b>
                        </a>
                        <ul class="submenu">
                            <li>
                                <a href="<%=request.getContextPath()%>/baselineManagement/1/1" target="right">
                                    <i class="icon-double-angle-right"></i>基线信息
                                </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/siteInfo/1/1" target="right">
                                    <i class="icon-double-angle-right"></i>站点信息
                                </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/periodLength/1" target="right">
                                    <i class="icon-double-angle-right"></i>时段长度
                                </a>
                            </li>

                        </ul>
                    </li>
                    <li><!--形变监测-->
                        <a href="#" class="dropdown-toggle">
                            <i class="icon-screenshot"></i>
                            <span class="menu-text">形变监测 </span>
                            <b class="arrow icon-angle-down"></b>
                        </a>
                        <ul class="submenu">
                            <li>
                                <a href="<%=request.getContextPath()%>/onlineMonitor" target="right">
                                    <i class="icon-double-angle-right"></i>在线监测
                                </a>
                            </li>
                            <%-- <li><a href="<%=request.getContextPath()%>/OnLineMonitoringWeb" target="right"><i
                                    class="icon-double-angle-right"></i>测站浏览 </a></li>
                            <li><a href="<%=request.getContextPath()%>/SingleReport? method=get" target="right"><i
                                    class="icon-double-angle-right"></i>单次报表</a></li>
                            <li><a href="<%=request.getContextPath()%>/CumulativeReport? method=get" target="right"><i
                                    class="icon-double-angle-right"></i>累计报表 </a></li>
                            <li><a href="<%=request.getContextPath()%>/typereportWeb?on=1" target="right"><i
                                    class="icon-double-angle-right"></i>类型报表</a></li>
                            <li><a href="<%=request.getContextPath()%>/MonitoringReportWebs" target="right"><i
                                    class="icon-double-angle-right"></i>监测报告</a></li>	 --%>
                            <li>
                                <a href="<%=request.getContextPath()%>/stationQuery/4" target="right">
                                    <i class="icon-double-angle-right"></i>数据查询
                                </a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/dataStatistic/1/4" target="right">
                                    <i class="icon-double-angle-right"></i>统计数据</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/graphicalAnalysis/1" target="right">
                                    <i class="icon-double-angle-right"></i>图形分析</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/trendAnalysis/4" target="right">
                                    <i class="icon-double-angle-right"></i>趋势分析</a>
                            </li>

                        </ul>
                    </li>


                    <c:if test="${users.permissions !=0 }"> <!--后台管理-->
                        <li>
                            <a href="#" class="dropdown-toggle">
                                <i class="icon-cog"></i>
                                <span class="menu-text">后台管理</span>
                                <b class="arrow icon-angle-down"></b>
                            </a>

                            <ul class="submenu">
                                <c:if test="${users.permissions ==2 }">
                                    <li>
                                        <a href="<%=request.getContextPath()%>/usersManagement/1" target="right">
                                            <i class="icon-double-angle-right"></i>用户管理
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${users.permissions !=0 }">
                                    <li>
                                        <a href="<%=request.getContextPath()%>/alarmManagement/" target="right">
                                            <i class="icon-double-angle-right"></i>警报管理
                                        </a>
                                    </li>
                                </c:if>

                                <li>
                                    <a href="<%=request.getContextPath()%>/baselineManagement/2/1" target="right">
                                        <i class="icon-double-angle-right"></i>基线管理
                                    </a>
                                </li>
                                    <%-- <li><a href="<%=request.getContextPath()%>/MuchstationmanagementWeb" target="right"> <i
                                            class="icon-double-angle-right"></i>多站管理
                                    </a></li>  --%>
                                <li>
                                    <a href="<%=request.getContextPath()%>/siteInfo/2/1" target="right">
                                        <i class="icon-double-angle-right"></i>站点管理
                                    </a>
                                </li>

                                <li>
                                    <a href="<%=request.getContextPath()%>/periodLength/2" target="right">
                                        <i class="icon-double-angle-right"></i>时段管理
                                    </a>
                                </li>

                                <c:if test="${users.permissions>0}">
                                    <li>
                                        <a href="<%=request.getContextPath()%>/contentEditor" target="right">
                                            <i class="icon-double-angle-right"></i>内容编辑
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </li>
                    </c:if>
                </ul>

                <!-- 提示框 -->
                <!--  <a href="#" class="tooltip-toggle" data-toggle="tooltip" data-placement="bottom" title="←点击可伸缩菜单→"> -->
                <div class="sidebar-collapse" id="sidebar-collapse">
                    <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right">
                    </i>
                </div>
                <!--  </a>  -->

                <!-- 提示框 -->
                <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/bootstrap.min.js"></script>
                <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery.min.js"></script>
                <script>
                    $(function(){
                        $('.tooltip-toggle').tooltip('toggle');
                        $('.exit').tooltip('toggle');
                    });
                </script>

                <script type="text/javascript">
                    try {
                        ace.settings.check('sidebar', 'collapsed')
                    } catch (e) {
                    }
                </script>
            </div>

            <!--主体框架-->
            <div class="main-content" style="height: 100%;">
                <!-- iframe -->
                <iframe src="<%=request.getContextPath()%>/summary" id="mainframe" style="width: 100%; height:870px;margin: 0px;padding: 0px;" name="right"  frameborder="0" scrolling="no">
                </iframe>
            </div>
        </div>
    </div>


    <!-- 底部   class="fixed" -->
    <div id="footer">
        <h6 style="margin-left:35px;" class="center"><!-- 底部 -->
            <%-- <span style="position: relative;top:-3px;left:-790px;"><img alt="武汉攀达时空科技有限公司" src="<%=request.getContextPath()%>/login/images/pan.jpg" title="武汉攀达时空科技有限公司" id="img"></span>   --%>
            <span style="margin-left:20px;font-weight: bold;position: relative;top:-6px;font-size:12px;"> 武汉攀达时空科技有限公司&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址:融科▪珞瑜95号T1写字楼1406&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮编:430079</span>
        </h6>
    </div>
</div>


<!-- 一种优化响应的策略 -->
<script type="text/javascript">
    window.jQuery
    || document
        .write("<script src='assets/js/jquery-2.0.3.min.js'>"
            + "<"+"script>");
</script>

<script type="text/javascript">
    if ("ontouchend" in document)
        document
            .write("<script src='assets/js/jquery.mobile.custom.min.js'>"
                + "<"+"script>");
</script>
<script src="<%=request.getContextPath()%>/static/assets/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/assets/js/typeahead-bs2.min.js"></script>
<script src="<%=request.getContextPath()%>/static/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="<%=request.getContextPath()%>/static/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="<%=request.getContextPath()%>/static/assets/js/jquery.slimscroll.min.js"></script>
<script src="<%=request.getContextPath()%>/static/assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="<%=request.getContextPath()%>/static/assets/js/jquery.sparkline.min.js"></script>
<script src="<%=request.getContextPath()%>/static/assets/js/flot/jquery.flot.min.js"></script>
<script src="<%=request.getContextPath()%>/static/assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="<%=request.getContextPath()%>/static/assets/js/flot/jquery.flot.resize.min.js"></script>
<script src="<%=request.getContextPath()%>/static/assets/js/ace-elements.min.js"></script>
<script src="<%=request.getContextPath()%>/static/assets/js/ace.min.js"></script>
<!-- inline scripts related to this page -->

<script type="text/javascript">
    jQuery(function($) {
        $('.easy-pie-chart.percentage')
            .each(
                function() {
                    var $box = $(this).closest('.infobox');
                    var barColor = $(this).data('color')
                        || (!$box.hasClass('infobox-dark') ? $box
                            .css('color')
                            : 'rgba(255,255,255,0.95)');
                    var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)'
                        : '#E2E2E2';
                    var size = parseInt($(this).data('size')) || 50;
                    $(this)
                        .easyPieChart(
                            {
                                barColor : barColor,
                                trackColor : trackColor,
                                scaleColor : false,
                                lineCap : 'butt',
                                lineWidth : parseInt(size / 10),
                                animate : /msie\s*(8|7|6)/
                                    .test(navigator.userAgent
                                        .toLowerCase()) ? false
                                    : 1000,
                                size : size
                            });
                })

        $('.sparkline').each(
            function() {
                var $box = $(this).closest('.infobox');
                var barColor = !$box.hasClass('infobox-dark') ? $box
                    .css('color') : '#FFF';
                $(this).sparkline('html', {
                    tagValuesAttribute : 'data-values',
                    type : 'bar',
                    barColor : barColor,
                    chartRangeMin : $(this).data('min') || 0
                });
            });

        var placeholder = $('#piechart-placeholder').css({
            'width' : '90%',
            'min-height' : '150px'
        });
        var data = [ {
            label : "social networks",
            data : 38.7,
            color : "#68BC31"
        }, {
            label : "search engines",
            data : 24.5,
            color : "#2091CF"
        }, {
            label : "ad campaigns",
            data : 8.2,
            color : "#AF4E96"
        }, {
            label : "direct traffic",
            data : 18.6,
            color : "#DA5430"
        }, {
            label : "other",
            data : 10,
            color : "#FEE074"
        } ]
        function drawPieChart(placeholder, data, position) {
            $.plot(placeholder, data, {
                series : {
                    pie : {
                        show : true,
                        tilt : 0.8,
                        highlight : {
                            opacity : 0.25
                        },
                        stroke : {
                            color : '#fff',
                            width : 2
                        },
                        startAngle : 2
                    }
                },
                legend : {
                    show : true,
                    position : position || "ne",
                    labelBoxBorderColor : null,
                    margin : [ -30, 15 ]
                },
                grid : {
                    hoverable : true,
                    clickable : true
                }
            })
        }
        drawPieChart(placeholder, data);

        /**
         we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
         so that's not needed actually.
         */
        placeholder.data('chart', data);
        placeholder.data('draw', drawPieChart);

        var $tooltip = $(
            "<div class='tooltip top in'><div class='tooltip-inner'></div></div>")
            .hide().appendTo('body');
        var previousPoint = null;

        placeholder.on('plothover', function(event, pos, item) {
            if (item) {
                if (previousPoint != item.seriesIndex) {
                    previousPoint = item.seriesIndex;
                    var tip = item.series['label'] + " : "
                        + item.series['percent'] + '%';
                    $tooltip.show().children(0).text(tip);
                }
                $tooltip.css({
                    top : pos.pageY + 10,
                    left : pos.pageX + 10
                });
            } else {
                $tooltip.hide();
                previousPoint = null;
            }

        });

        var d1 = [];
        for (var i = 0; i < Math.PI * 2; i += 0.5) {
            d1.push([ i, Math.sin(i) ]);
        }

        var d2 = [];
        for (var i = 0; i < Math.PI * 2; i += 0.5) {
            d2.push([ i, Math.cos(i) ]);
        }

        var d3 = [];
        for (var i = 0; i < Math.PI * 2; i += 0.2) {
            d3.push([ i, Math.tan(i) ]);
        }

        var sales_charts = $('#sales-charts').css({
            'width' : '100%',
            'height' : '220px'
        });
        $.plot("#sales-charts", [ {
            label : "Domains",
            data : d1
        }, {
            label : "Hosting",
            data : d2
        }, {
            label : "Services",
            data : d3
        } ], {
            hoverable : true,
            shadowSize : 0,
            series : {
                lines : {
                    show : true
                },
                points : {
                    show : true
                }
            },
            xaxis : {
                tickLength : 0
            },
            yaxis : {
                ticks : 10,
                min : -2,
                max : 2,
                tickDecimals : 3
            },
            grid : {
                backgroundColor : {
                    colors : [ "#fff", "#fff" ]
                },
                borderWidth : 1,
                borderColor : '#555'
            }
        });

        $('#recent-box [data-rel="tooltip"]').tooltip({
            placement : tooltip_placement
        });
        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('.tab-content')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if (parseInt(off2.left) < parseInt(off1.left)
                + parseInt(w1 / 2))
                return 'right';
            return 'left';
        }

        $('.dialogs,.comments').slimScroll({
            height : '300px'
        });

        //Android's default browser somehow is confused when tapping on label which will lead to dragging the task
        //so disable dragging when clicking on label
        var agent = navigator.userAgent.toLowerCase();
        if ("ontouchstart" in document && /applewebkit/.test(agent)
            && /android/.test(agent))
            $('#tasks').on('touchstart', function(e) {
                var li = $(e.target).closest('#tasks li');
                if (li.length == 0)
                    return;
                var label = li.find('label.inline').get(0);
                if (label == e.target || $.contains(label, e.target))
                    e.stopImmediatePropagation();
            });

        $('#tasks').sortable({
            opacity : 0.8,
            revert : true,
            forceHelperSize : true,
            placeholder : 'draggable-placeholder',
            forcePlaceholderSize : true,
            tolerance : 'pointer',
            stop : function(event, ui) {//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
                $(ui.item).css('z-index', 'auto');
            }
        });
        $('#tasks').disableSelection();
        $('#tasks input:checkbox').removeAttr('checked').on('click',
            function() {
                if (this.checked)
                    $(this).closest('li').addClass('selected');
                else
                    $(this).closest('li').removeClass('selected');
            });

    })
</script>

</body>
</html>


