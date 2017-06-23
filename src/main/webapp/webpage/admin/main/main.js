/**
 * Created by User on 2017/6/22.
 */
$(function () {
    $('#addDate_begin').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        endDate: new Date(),
        forceParse: 0
    }).on('changeDate', function (ev) {
        var startTime = $("#addDate_begin_value").val();
        $("#addDate_end").datetimepicker('setStartDate', startTime);
        $('#addDate_begin').datetimepicker('hide');
    });

    $('#addDate_end').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        endDate: new Date(),
        forceParse: 0
    }).on('changeDate', function (ev) {
        var endTime = $("#addDate_end_value").val();
        $("#addDate_begin").datetimepicker('setEndDate', endTime);
        $('#addDate_end').datetimepicker('hide');
    });

    $('#promotListTable').bootstrapTable({
        url: "/promotOrderController.do?dataGrid",
        sidePagination: "server",
        dataType: "json",
        search: false,
        pageNumber: 1,
        pageSize: 20,
        pageList: [10, 20, 30, 50, 100],
        pagination: true,
        height: tableHeight(),
        clickToSelect: true,//是否启用点击选中行
        uniqueId: "id",
        locale: "zh-CN",
        showColumns: false,
        singleSelect: true,
        columns: [[
            {
                title: '订单编号',
                field: "id",
                sortable: true,
                width: "10%",//宽度
                align: "center",//水平
                valign: "middle"//垂直
            },
            {
                title: 'ASIN',
                field: "asinId",
                sortable: true,
                width: "10%",//宽度
                align: "center",//水平
                valign: "middle",//垂直
                formatter: function (value, row, index) {
                    return "<a href='" + row.productUrl + "' target='_blank'>" + value + "</a>";
                }
            },
            {
                title: '店铺名称',
                field: "brand",
                sortable: true,
                width: "10%",//宽度
                align: "center",//水平
                valign: "middle"//垂直
            },
            {
                title: '状态',
                field: "state",
                sortable: true,
                width: "10%",//宽度
                align: "center",//水平
                valign: "middle",//垂直
                formatter: function (value, row, index) {
                    if (value == 1) {
                        return "<span class='label label-success'>开启</span>"
                    } else if (value == 2) {
                        return "<span class='label label-default'>关闭</span>"
                    }
                    return "";
                }
            },
            {
                title: '联系买家',
                field: "buyerNum",
                width: "10%",//宽度
                align: "center",//水平
                valign: "middle"//垂直
            },
            {
                title: '获得评论',
                field: "evaluateNum",
                width: "10%",//宽度
                align: "center",//水平
                valign: "middle"//垂直
            },
            {
                title: '费用(美元)',
                field: "consumption",
                width: "10%",//宽度
                align: "center",//水平
                valign: "middle"//垂直
            },
            {
                title: '创建时间',
                field: "addDate",
                sortable: true,
                width: "10%",//宽度
                align: "center",//水平
                valign: "middle"//垂直
            },
            {
                title: '结束日期',
                field: "finishDate",
                sortable: true,
                width: "10%",//宽度
                align: "center",//水平
                valign: "middle"//垂直
            },
            {
                title: '操作',
                field: "id",
                width: "10%",//宽度
                formatter: function (value, row, index) {
                    if (row.state === 1) {//开启状态
                        return "<a onclick='loadPromotOrder(" + value + ")' title='查看详情' data-target='#orderDetailModal' data-toggle='modal'><i class='fa fa-search'></i></a>&nbsp;&nbsp;<a onclick='clickDeleteModel("+value+");' title='关闭推广' data-target='#deleteOrderModel' data-toggle='modal'><i class='fa fa-window-close'></i></a>"
                    } else if (row.state === 2) { //关闭状态
                        return "<a onclick='loadPromotOrder(" + value + ")'title='查看详情' data-target='#orderDetailModal' data-toggle='modal'><i class='fa fa-search'></i></a>"
                    } else {
                        return "";
                    }
                }
            }
        ]],
        queryParams: function (params) {
            params.asinId = $("#amazon_asin").val().trim();
            params.state = $("#amazon_state").val().trim();
            params.addDate_begin = $("#addDate_begin_value").val().trim();
            params.addDate_end = $("#addDate_end_value").val().trim();
            return params;
        }
    });



});