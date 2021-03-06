/**
 * Created by User on 2017/6/29.
 */
$(function () {
    $('#evaluateDetailListTable').bootstrapTable({
        url: "/promotOrderEvaluateFlowController.do?dataGrid",
        sidePagination: "server",
        dataType: "json",
        search: false,
        sortName: "updateTime",
        sortOrder: 'desc',
        pageNumber: 1,
        pageSize: 10,
        pageList: [10, 20, 30, 50, 100],
        pagination: true,
        onLoadError: function () {
            toastr.warning("请重新登录！");
            setTimeout("window.location='/loginController.do?login'", 1000);
        },
        onLoadSuccess: function () {
            $('.rating').rating('create');
        },
        height: 700,
        clickToSelect: true,//是否启用点击选中行
        uniqueId: "id",
        locale: "zh-CN",
        showColumns: false,
        singleSelect: true,
        columns: [[
            {
                title: '评论编号',
                field: "id",
                width: "5%",//宽度
                align: "center",//水平
                valign: "middle"//垂直
            },
            {
                title: 'ASIN',
                field: "asinId",
                width: "10%",//宽度
                align: "center",//水平
                valign: "middle",//垂直
            },
            {
                title: '状态',
                field: "state",
                width: "5%",//宽度
                align: "center",//水平
                valign: "middle",//垂直
                formatter: function (value, row, index) {
                    if (value == 1) {
                        return "<span class='label label-warning'>pending</span>"
                    } else if (value == 2) {
                        return "<span class='label label-success'>review</span>"
                    }
                    return "";
                }
            },
            {
                title: '亚马逊订单号',
                field: "amzOrderId",
                width: "15%",//宽度
                align: "center",//水平
                valign: "middle",//垂直
            },
            {
                title: '评价内容',
                field: "reviewContent",
                width: "20%",//宽度
                align: "center",//水平
                valign: "middle",//垂直
                formatter: function (value, row, index) {
                    if (value === undefined) {
                        return "-"
                    }
                    return "<a href='" + row.reviewUrl + "' target='_blank'>" + value + "</a>";
                }
            },
            {
                title: '评价星级',
                field: "reviewStar",
                sortable: true,
                width: "10%",//宽度
                align: "center",//水平
                valign: "middle",//垂直
                formatter: function (value, row, index) {
                    if (value === undefined) {
                        return "-"
                    }
                    return "<input value='" + value + "' type='text' class='rating' data-min=0 data-max=5 data-step=0.1 data-size='xs' title='评价星级'>";
                }
            },
            {
                title: '评价日期',
                field: "reviewDate",
                width: "10%",//宽度
                align: "center",//水平
                valign: "middle"//垂直
            },
            {
                title: '投诉',
                field: "id",
                width: "5%",//宽度
                align: "center",//水平
                valign: "middle",//垂直
                formatter: function (value, row, index) {
                    return "<a onclick='loadEvaluateDetailInfo(" + value + ")'title='投诉' data-target='#complaintId' data-toggle='modal'><i class='fa fa-pencil-square'></i></a>";
                }
            }
        ]],
        queryParams: function (params) {
            params.promotId = getQueryString("promotId").trim();
            return params;
        }
    });
    loadData();
    ko.applyBindings(viewModel);
});

var viewModel = {
    promotId: ko.observable(),
    asinId: ko.observable(),
    id: ko.observable(),
    remark: ko.observable()
}

function loadData() {
    var promotId = getQueryString("promotId").trim();
    $.ajax({
        url: "/promotOrderController.do?doGet",
        type: 'post',
        data: {id: promotId},
        success: function (data) {
            if (data.success === "success") {
                viewModel.promotId(data.content.id);
                viewModel.asinId(data.content.asinId);
            } else if (data.success === "fail") {
                toastr.warning(data.msg);
            } else {
                window.location = '/loginController.do?login';
            }
        },
        error: function (jqxhr, textStatus, errorThrow) {
            toastr.warning("服务器异常,请联系管理员！");
        }
    });

}

function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}


function loadEvaluateDetailInfo(id) {
    viewModel.id(id);
    viewModel.remark("");
}

function submitComplaint() {
    var form = $('#formobj');
    $.post(form.attr('action'), form.serialize(), function (result) {
        if (result.success == "success") {
            toastr.success(result.msg);
            setTimeout("window.location='/redirectionController.do?goManagePromot'", 500);
        } else if (result.success == "fail") {
            toastr.warning(result.msg);
            form.bootstrapValidator('disableSubmitButtons', false);
        } else {
            window.location = '/loginController.do?login';
        }
    }, 'json');
}