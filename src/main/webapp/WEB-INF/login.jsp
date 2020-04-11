<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="EN">
<head>
    <title>北斗/GNSS全天候变形监测系统用户登录</title>
    <meta charset="utf-8"/>

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/login/css/login2.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/web/css/login.css" />

    <script type="text/javascript" src="<%=request.getContextPath()%>/static/login/js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/login/images/login.js"></script>

</head>

<body>

    <div id="tit">
        <img alt="武汉攀达时空科技有限公司" src="<%=request.getContextPath()%>/static/login/images/panda.png"
             title="武汉攀达时空科技有限公司" id="img">
        <span style="position: relative;bottom: 45px;">武汉攀达时空科技有限公司</span>
    </div>

    <h2 style="position: relative;top:-15px;">北斗/GNSS全天候变形监测系统  </h2>
    <div class="login" style="position: relative;top:-55px;">

        <div class="header">
            <div class="switch" id="switch">
                <a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">用户登录</a>
                <a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">用户注册</a>
                <div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>
            </div>
        </div>

        <div class="web_qr_login" id="web_qr_login" style="display: block;">
            <!--登录-->
            <div class="web_login" id="web_login">
                <div class="login-box">
                    <div class="login_form">
                        <form action="<%=request.getContextPath()%>/login.do" method="post" name="loginform"
                              accept-charset="utf-8" id="login_form" class="loginForm">
                            <input type="hidden" name="did" value="0"/>
                            <input type="hidden" name="to" value="log"/>
                            <div class="uinArea" id="uinArea">
                                <label class="input-tips" for="u">账号：</label>
                                <div class="inputOuter" id="uArea">
                                    <input type="text" id="u" name="username" class="inputstyle"/>
                                </div>
                            </div>
                            <div class="pwdArea" id="pwdArea">
                                <label class="input-tips" for="p">密码：</label>
                                <div class="inputOuter" id="pArea">
                                    <input type="password" id="p" name="password" class="inputstyle"/>
                                </div>
                            </div>

                            <div style="margin-top:30px;">
                                <input type="submit" value="登 录" style="width:90px;float:left;margin-left:10px;margin-bottom: 10px;" class="button_blue"/>
                                <input type="reset" value="重 置" style="width:90px;float:right;margin-right:20px;margin-bottom: 10px;" class="button_blue"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--注册-->
        <div class="qlogin" id="qlogin" style="display: none;margin-left: -20px;">
            <div class="web_login">
                <form name="form2" id="regUser" accept-charset="utf-8" action="register" method="post">
                    <input type="hidden" name="to" value="reg"/>
                    <input type="hidden" name="did" value="0"/>
                    <ul class="reg_form" id="reg-ul">
                        <br><br>
                        <li>
                            <label class="input-tips2">账号：</label>
                            <div class="inputOuter2">
                                <input type="text" id="username" name="name" class="inputstyle2" required/>
                            </div>
                        </li>

                        <li>
                            <label class="input-tips2">密码：</label>
                            <div class="inputOuter2">
                                <input type="password" id="passwd" class="inputstyle2" name="password" pattern="^[a-zA-Z0-9]{3,18}$" required
                                       oninvalid="setCustomValidity('请输入3-18位的字母或者数字');" oninput="setCustomValidity('');"
                                       onBlur="checkPass()"/>
                            </div>
                        </li>

                        <li>
                            <label class="input-tips2">姓名：</label>
                            <div class="inputOuter2">
                                <input type="text" id="name" name="realname" class="inputstyle2" required/>
                            </div>

                        </li>
                        <li>
                            <label class="input-tips2">电话：</label>
                            <div class="inputOuter2">
                                <input type="text" id="phone" name="phone" class="inputstyle2"
                                       pattern="^1[3|5|7|8][0-9]{9}$" required oninvalid="setCustomValidity('请输入11位的手机号码');"
                                       oninput="setCustomValidity('');"/>
                            </div>
                        </li>

                        <li>
                            <label class="input-tips2">邮箱：</label>
                            <div class="inputOuter2">
                                <input type="email" id="email" name="mail" class="inputstyle2" required/>
                            </div>
                        </li>

                        <li>
                            <div class="inputArea">
                                <input type="submit" id="reg" style="margin-top:15px;width: 100px;margin-left:35px;float:left;" class="button_blue" value="注   册"/>
                                <input type="reset" id="reg" style="margin-top:15px;float: right;width: 100px;" class="button_blue" value="重   置"/>
                            </div>
                        </li>
                        <div class="cl"></div>
                    </ul>
                </form>
            </div>
        </div>
        <!--注册end-->

    </div>

    <!-- 登录 -->
    <div id="light" class="whiteContent">
        <h3 style="font-size: 18px;color: #428BCA;font-weight: bold;">信息提示</h3><br>
        <p style="font-size: 15px;">${loginMsg}</p>
        <button class="button_blue" style="margin-left:110px;margin-top: 15px;width: 75px;">
            <a href="javascript:void(0)" onclick="hideMsg()" style="text-decoration: none;color: white">关闭</a>
        </button>
    </div>
    <div id="fade" class="blackMask"></div>

    <!-- 注册 -->
    <div id="light1" class="whiteContent">
        <h3 style="font-size: 18px;color: #428BCA;font-weight: bold;">信息提示</h3><br>
        <p style="font-size: 15px;">${registerMsg}</p>
        <button class="button_blue" style="margin-left:110px;margin-top: 15px;width: 75px;">
            <a href="javascript:void(0)" onclick="hideMsg()" style="text-decoration: none;color: white">关闭</a>
        </button>
    </div>
    <div id="fade1" class="blackMask"></div>

</body>

<script type="text/javascript">

    function hideMsg() {
        $(".whiteContent").css("display","none");
        $(".blackMask").css("display","none");
    }

    $(function () {

        if ('${loginMsg}' != null && '${loginMsg}' != "") {
            $('#light').show();
            $("#light").css("display","block");
            $("#fade").css("display","block");
            <%
                String val = (String)session.getAttribute("loginMsg");
                if(val != null || val != ""){
                    session.removeAttribute("loginMsg");
                }
            %>
            return false;
        }

        if ('${registerMsg}' != null && '${registerMsg}' != "") {
            $('#light1').show();
            $("#light1").css("display","block");
            $("#fade1").css("display","block");
            <%
              String valtwo = (String)session.getAttribute("registerMsg");
              if(valtwo != null || valtwo != ""){
                  session.removeAttribute("registerMsg");
              }
            %>
            return false;
        }
    });

</script>

</html>