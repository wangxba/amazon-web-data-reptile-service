<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/webpage/context/baseTags.jsp" %>
<html>
<head>
    <title>Seller Assistant</title>
    <meta charset="utf-8"/>
    <link rel="shortcut icon" type="image/x-icon" href="/webpage/plug-in/imgs/favicon.ico" media="screen"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0,user-scalable=no"/>
    <link rel="stylesheet" href="/webpage/plug-in/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/webpage/plug-in/bootstrap/css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="/webpage/plug-in/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/webpage/plug-in/bootstrap-table/dist/bootstrap-table.min.css"/>
    <link rel="stylesheet" href="/webpage/plug-in/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="/webpage/pages/manage/managePromot.css"/>
    <link rel="stylesheet" href="/webpage/pages/main/index.css"/>
    <link rel="stylesheet" href="/webpage/plug-in/toastr/toastr.css"/>
    <!--[if lte IE 9]>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <script src="https://cdn.bootcss.com/html5shiv/r29/html5.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/webpage/plug-in/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/webpage/plug-in/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/webpage/plug-in/bootstrap-table/dist/bootstrap-table.min.js"></script>
    <script type="text/javascript"
            src="/webpage/plug-in/bootstrap-table/dist/bootstrap-table-locale-all.min.js"></script>
    <script type="text/javascript" src="/webpage/plug-in/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>
    <script type="text/javascript"
            src="/webpage/plug-in/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript"
            src="/webpage/plug-in/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" src="/webpage/plug-in/knockoutjs/dist/knockout.js"></script>
    <script type="text/javascript" src="/webpage/plug-in/toastr/toastr.min.js"></script>

</head>
<body style="overflow-y:auto;">
<div class="main-container">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Seller Assistant</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand font-color" href="/mainController.do?index" target="_parent">Seller Assistant</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">客服咨询<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=710535607&site=qq&menu=yes">
                                    客服1&nbsp;<img border="0" src="http://wpa.qq.com/pa?p=2:710535607:51" alt="客服1" title="客服1"/>
                                </a>
                            </li>
                            <li>
                                <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1005814292&site=qq&menu=yes">
                                    客服2&nbsp;<img border="0" src="http://wpa.qq.com/pa?p=2:1005814292:51" alt="客服2" title="客服2"/>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="/promotOrderController.do?goNewPromotOne" target="_parent">新建推广活动</a></li>
                    <li><a href="/redirectionController.do?goManagePromot" target="_parent">推广活动管理</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">账户充值<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/redirectionController.do?goToChargeFund" target="_parent">余额充值</a></li>
                            <li><a href="/redirectionController.do?goToChargeMemberShip" target="_parent">购买会员</a></li>
                            <li><a href="/redirectionController.do?chargeFundFlow" target="_parent">充值记录</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">我的账户<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="redirectionController.do?goUserDetailInfo" target="_parent">账户详情</a></li>
                            <li><a href="redirectionController.do?goUserChangePwd" target="_parent">修改密码</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="/userController.do?doLogOff" target="_parent">
                            退出
                            <i class="fa fa-power-off" style="color: red" aria-hidden="true"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="main-content">
        <div style="height: 20px;"></div>
        <div class="container">
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h3 class="panel-title">推广活动管理</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-xs-3 control-label amazon-label" for="amazon_asin">ASIN</label>
                                <div class="col-xs-8">
                                    <input class="form-control" id="amazon_asin" type="text"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="col-xs-3 control-label amazon-label" for="amazon_state">
                                    <nobr>状态</nobr>
                                </label>
                                <div class="col-xs-8">
                                    <select id="amazon_state" class="form-control">
                                        <option value="">--选择--</option>
                                        <option value="1">开启</option>
                                        <option value="2">关闭</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-xs-2 control-label amazon-label" for="amazon_state">
                                    <nobr>创建时间</nobr>
                                </label>
                                <div class="col-xs-5">
                                    <div class="input-group date form_date" id="addDate_begin"
                                         data-date-format="yyyy-mm-dd"
                                         data-link-field="addDate_begin_input" data-link-format="yyyy-mm-dd">
                                        <input class="form-control" name="addDate_begin" id="addDate_begin_value"
                                               size="16" type="text" value="" readonly placeholder="开始时间">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-calendar"></span></span>
                                    </div>
                                    <input type="hidden" id="addDate_begin_input" value=""/>
                                </div>
                                <div class="col-xs-5">
                                    <div class="input-group date form_date" id="addDate_end"
                                         data-date-format="yyyy-mm-dd"
                                         data-link-field="addDate_end_input" data-link-format="yyyy-mm-dd">
                                        <input class="form-control" name="addDate_end" id="addDate_end_value" size="16"
                                               type="text" value="" readonly placeholder="结束时间">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-calendar"></span></span>
                                    </div>
                                    <input type="hidden" id="addDate_end_input" value=""/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-sm-4 col-sm-offset-8">
                            <div class="btn-group" role="group">
                                <a  onclick="downPromotOrderExcel();" class="btn btn-default" style="width: 104px;">导出
                                </a>
                                <button type="button" onclick="doPromotSearch();" class="btn btn-default"
                                        style="width: 104px;">查询
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <table id="promotListTable" class="table table-hover">
            </table>
        </div>
        <div style="height: 100px;"></div>
    </div>
</div>
<div class="modal fade bs-example-modal-sm" id="deleteOrderModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="deleteOrderByIdLabel">
                    关闭订单
                </h4>
            </div>
            <div class="modal-body">
                  <input type="hidden" id="deleteId" data-bind="value:id">
                  确认关闭订单 <span data-bind="text:id"></span>吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="deleteOrderByIdBtn" onclick="deleteOrderById();">确定</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="orderDetailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    推广活动详情
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon" style="width: 80px;" id="id">订单编号</span>
                                <input type="text" class="form-control" data-bind="value:id" placeholder="订单编号" readonly
                                       aria-describedby="salePrice">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon" style="width: 80px;" id="asinId">ASIN</span>
                                <input type="text" class="form-control" data-bind="value:asinId" placeholder="ASIN"
                                       readonly aria-describedby="asin">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon" style="width: 80px;" id="salePrice">商品价格</span>
                                <input type="text" class="form-control" data-bind="value:salePrice"
                                       placeholder="salePrice" readonly aria-describedby="productTitle">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon" style="width: 80px;" id="brand">商品店家</span>
                                <input type="text" class="form-control" data-bind="value:brand" placeholder="" readonly
                                       aria-describedby="brand">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <img src="" data-bind="attr:{src:landingImage}" alt="产品主图" style="height:180px; "
                             class="img-responsive center-block">
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon" style="width: 80px;" id="productTitle">商品标题</span>
                                <input type="text" class="form-control" data-bind="value:productTitle"
                                       placeholder="商品标题" readonly aria-describedby="productTitle">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon" style="width: 80px;" id="addDate">下单日期</span>
                                <input type="text" class="form-control" data-bind="value:addDate" placeholder="下单日期"
                                       readonly aria-describedby="addDate">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon" style="width: 80px;" id="finishDate">结束日期</span>
                                <input type="text" class="form-control" data-bind="value:finishDate" placeholder="结束日期"
                                       readonly aria-describedby="finishDate">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon" style="width: 80px;" id="guaranteeFund">保证金(美元)</span>
                                <input type="text" class="form-control" data-bind="value:guaranteeFund"
                                       placeholder="保证金(美元)" readonly aria-describedby="guaranteeFund">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon" style="width: 80px;" id="evaluateNum">获取评论数</span>
                                <input type="text" class="form-control" data-bind="value:evaluateNum"
                                       placeholder="获取评论数" readonly aria-describedby="evaluateNum">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon" style="width: 160px;" id="consumption">已花费(美元)</span>
                                <input type="text" class="form-control" data-bind="value:consumption" placeholder="已花费"
                                       readonly aria-describedby="consumption">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon" style="width: 160px;" id="needReviewNum">总目标好评数</span>
                                <input type="text" class="form-control" data-bind="value:needReviewNum"
                                       placeholder="目标好评数"
                                       readonly aria-describedby="needReviewNum">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon" style="width: 160px;" id="dayReviewNum">每日目标评论</span>
                                <input type="text" class="form-control" data-bind="value:dayReviewNum"
                                       placeholder="每天目标好评数"
                                       readonly aria-describedby="dayReviewNum">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon" style="width: 160px;" id="buyerNum">联系买家</span>
                                <input type="text" class="form-control" data-bind="value:buyerNum"
                                       placeholder="已联系到的买家数"
                                       readonly aria-describedby="buyerNum">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon" style="width: 160px;" id="reviewPrice">评论费用(美元)</span>
                                <input type="text" class="form-control" data-bind="value:reviewPrice"
                                       placeholder="每个评论费用"
                                       readonly aria-describedby="reviewPrice">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div>
    </div>
</div>
<nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-sm-offset-2">
                <div style="text-align:center;line-height: 28px;">
                    Copyright&copy;武汉市维斯卡尔技术服务有限公司 &reg;鄂ICP备17013383号
                </div>
            </div>
        </div>
    </div>
</nav>
</body>
<script src="/webpage/pages/manage/managePromot.js"></script>
</html>