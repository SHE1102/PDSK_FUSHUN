<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>404 Not Found</title>
    <style type="text/css">
        body {
            background-color: #0402a4;
            font-size: 18px;
            font-family: Courier, Consolas;
            color: #FFFFFF;
        }
        #error{
            color: red;
            font-size: 20px;
            font-weight:bold;
        }
    </style>
</head>

<body>
    <p>A problem has been detected and Browser has been shut down to prevent damage to your computer. </p>
    <p>HTTP Status-500</p>
    <p>If this is the first time you've seen this stop error screen, refresh your browser. If this screen appears again, follow these steps: </p>
    <p>Check to be sure you have adequate disk space, if a driver is identified in the stop message, disable the driver or check with the manufacturer for driver updates. Try changing video adapters. </p>
    <p>Check with your hardware vendor for any BIOS updates. Disable BIOS memory options such as caching or shadowing. If you need to use safe Mode to try again, restart your browser, press Ctrl+Shift+Delete to access Clear recent History, and then beside
    Time range to clear, click Everything, and then select clear now. </p>
    <p>Technical information:</p>
    <p id="error">常见错误提示:<br>数据库禁止建立连接,${message}请稍后重试.<br>${ex}
    <!-- (2)缓冲池较小无法满足数据的存取等.<br>
    (3)运行的用户数过多,对服务器造成的压力过大,服务器无法响应,请增大数据库的连接数.  -->
    </p>
    <p>*** STOP:0×00000001( 0×00000000,0×00000001, 0×00000002,0×00000003 )</p>
    <p>Beginning dump of physical memory</p>
    <p>physical memory dump complete</p>
    <p>Contact your system administrator or technical support group for further assistance. </p>
</body>
</html>