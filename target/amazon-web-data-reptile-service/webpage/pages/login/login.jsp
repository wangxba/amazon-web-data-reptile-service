<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/webpage/context/baseTags.jsp" %>
<html>
<head>
    <title>Review Tracker</title>
    <meta charset="utf-8"/>
    <link rel="shortcut icon" type="image/x-icon" href="/webpage/plug-in/imgs/favicon.ico" media="screen"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="X-UA-Compatible" content="IE=9"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0,user-scalable=no"/>
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="/webpage/plug-in/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/webpage/plug-in/bootstrap/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="/webpage/plug-in/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/webpage/plug-in/bootstrapvalidator/dist/css/bootstrapValidator.min.css"/>
    <link rel="stylesheet" href="/webpage/plug-in/toastr/toastr.css"/>
    <link rel="stylesheet" href="/webpage/plug-in/common/css/main.css"/>
    <%--<link rel="stylesheet" href="/webpage/plug-in/validform/css/metro/style.css"/>--%>
    <link rel="stylesheet" href="/webpage/pages/login/login.css"/>
    <!--[if lte IE 9]>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <script src="https://cdn.bootcss.com/html5shiv/r29/html5.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/webpage/plug-in/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/webpage/plug-in/toastr/toastr.min.js"></script>
    <script type="text/javascript" src="/webpage/plug-in/bootstrapvalidator/dist/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="/webpage/plug-in/bootstrapvalidator/dist/js/language/zh_CN.js"></script>
    <script type="text/javascript" src="/webpage/pages/login/login.js"></script>
</head>
<body class="container-fluid">
<div class="row">
    <div style="margin-top: 100px;margin-bottom: 100px;">
        <div class="col-lg-10 col-lg-offset-1">
            <div class="row">
                <div class="col-md-4 col-md-offset-1">
                    <h2>欢迎使用 AM Review Tracker</h2>
                    <p>&nbsp;</p>
                    <p class="sign-left">这是一个精心设计的亚马逊产品测评平台，为您提供专业、高效的测评服务。</p>
                    <p class="sign-left">现在就开始行动，加入我们打造您的亚马逊爆款吧！</p>
                </div>
                <div class="col-md-4 col-md-offset-1">
                    <div class="thumbnail">
                        <div class="page-header text-center text-primary">
                            <h3>欢迎登录AM Review Tracker</h3>
                        </div>
                        <p>&nbsp;</p>
                        <form id="formobj" class="form-horizontal" action="/userController.do?doLogin"
                              onsubmit="return false;">
                            <div class="form-group" style="height: 54px;">
                                <label for="email" class="col-sm-3 control-label">电子邮箱:</label>
                                <div class="col-sm-7">
                                    <input type="email" name="account" id="email" class="form-control"
                                           onkeydown="if(event.keyCode==13){event.keyCode=0;event.returnValue=false;}"
                                           placeholder="请输入邮箱账号!">
                                </div>
                            </div>
                            <div class="form-group" style="height: 54px;">
                                <label for="password" class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
                                <div class="col-sm-7">
                                    <input type="password" name="pwd" id="password" class="form-control"
                                           onkeydown="if(event.keyCode==13){event.keyCode=0;event.returnValue=false;}"
                                           placeholder="请输入密码！">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-7  col-sm-offset-3">
                                    <input type="submit" id="login_submit" onclick="loginSubmit()" ; value="登录"
                                           class="btn btn-primary btn-block">
                                </div>
                            </div>
                        </form>
                        <p>&nbsp;</p>
                        <div class="row" style="border-top: 1px solid #e4e5e6">
                            <%--<div class="col-sm-5 col-sm-offset-1">
                                <a href="/loginController.do?register" style="text-decoration: none;color:#03a9f4">没有账号？注册</a>
                            </div>--%>
                            <div class="col-sm-5 col-sm-offset-1">
                                <span style="color: green">暂停注册</span>
                            </div>
                            <div class="col-sm-4 col-sm-offset-2">
                                <a href="/loginController.do?lookForPwd" style="text-decoration: none;color:#78808a">忘记密码？</a>
                            </div>
                            <p>&nbsp;</p>
                        </div>
                    </div>
                </div>
            </div>
            <div style="height: 100px;"></div>
        </div>
    </div>
    <nav class="navbar navbar-default navbar-fixed-bottom">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">
                    <div style="text-align:center;line-height: 28px;">
                        Copyright&copy;Viscal Technology Services Ltd All Rights Reserved&reg;ICP备17013383号
                    </div>
                </div>
            </div>
        </div>
    </nav>
</div>
</body>
</html>
