<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>DEMX QFD Suit</title>
    <link href="${pageContext.request.contextPath}/static/images/favicon.ico" rel="SHORTCUT ICON"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css" media="all"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.6.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#dolog").click(function() {
                $.post("${pageContext.request.contextPath}/j_spring_security_check", {j_username:$("#j_username").val(),j_password:$("#j_password").val()}, function(data) {
                    location.href = "${pageContext.request.contextPath}/mgr/rd"
                });
            });
        });
    </script>
</head>
<body>
<div class="lp">
    <div class="logpt">
        <div class="logimg">
        </div>
        <div id="logon">
            <table cellspacing="0" cellpadding="4">
                <tr>
                    <td colspan="2"  class="fnt_shaow boldsize">DEMX QFD Suit Dashboard用户登录</td>
                </tr>
                <tr>
                    <td class="rfont">用户名</td>
                    <td><input id="j_username" type="text" size="10" class="loinput" value=""></td>
                </tr>
                <tr>
                    <td class="rfont">密码</td>
                    <td><input id="j_password" type="password" size="10" class="loinput"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input id="dolog" type="button" class="btnl" value="登  录" onMouseOver="this.style.backgroundPosition='left -30px'"
                               onMouseOut="this.style.backgroundPosition='left top'"/></td>
                </tr>
            </table>
        </div>
        <div style="width:560px;padding:0 0px 0 0px;margin:0px;float:right">
            <table width="100%" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <span class="lfont" style="font-weight:bold">DEMX QFD Suit is One of DEMX Products</span>
                        &copy; copyright 2006-2011 License by DEMX</p>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<div class="shadow">
</div>
</body>
</html>