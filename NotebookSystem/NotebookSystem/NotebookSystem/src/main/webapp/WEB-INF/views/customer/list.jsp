<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8" http-equiv="Content-Type" content="text/html">
    <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
    <title>客户管理</title>
    <!-- jquery -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-3.6.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-ext.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/popper.js"></script>
    <!-- common -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/common.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/common.js"></script>
    <!-- layer -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layer/theme/default/layer.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
    <!-- bootstrap-datepicker -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-datepicker/css/bootstrap-datepicker.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
    <!-- bootstrap-table -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-table/bootstrap-table.css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-table/bootstrap-table.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
    <!-- bootstrap-select -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-select/css/bootstrap-select.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-select/js/bootstrap-select.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-select/js/bootstrap-select-ext.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-select/js/i18n/defaults-zh_CN.js"></script>
    <!-- bootstrap-toggle -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-toggle/css/bootstrap-toggle.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-toggle/js/bootstrap-toggle.js"></script>
</head>
<style>

    .ha_1{
        color: #8b4513 !important;
    }

    .ha_2{
        background-color: #f5f5dc !important;
    }

    .modal-header {
        background-color: #f5f5dc; /* 米色背景 */
        border-bottom: 1px solid #ddd;
        padding: 15px;
    }

    .modal-title {
        color: #333;
        font-weight: bold;
    }

    .modal-body {
        padding: 20px;
    }

    .form-horizontal .form-group {
        margin-bottom: 15px;
    }

    .form-item-label {
        text-align: right;
        font-weight: bold;
        color: #555;
    }

    .form-control {
        border-radius: 5px;
        border: 1px solid #ccc;
        box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        transition: border-color 0.3s, box-shadow 0.3s;
    }

    .form-control:focus {
        border-color: #8b4513; /* 深棕色 */
        box-shadow: 0 0 5px rgba(139, 69, 19, 0.5);
    }

    .selectpicker {
        width: 100%;
        border-radius: 5px;
    }

    .modal-footer {
        padding: 15px;
        text-align: right;
        border-top: 1px solid #ddd;
    }

    .btn {
        border-radius: 5px;
        transition: background 0.3s, transform 0.3s;
    }

    .btn-warning {
        background-color: #f0ad4e;
        border: none;
        color: #fff;
    }

    .btn-warning:hover {
        background-color: #ec971f;
        transform: translateY(-2px);
    }

    .btn-primary {
        background-color: #337ab7;
        border: none;
        color: #fff;
    }

    .btn-primary:hover {
        background-color: #286090;
        transform: translateY(-2px);
    }
</style>

<body class="h-100 ha_2 ha_1">
<div class="container-fluid h-100 ha_2 ha_1">
    <h5 class="text-center ha_2 ha_1" >客户信息列表</h5>
    <div id="toolbar">
        <div class="input-group col-xs-12 ha_2 ha_1">
            <input class="form-control ha_2 ha_1" placeholder="姓名模糊查询" id="qryName"/>
            <input class="form-control ha_2 ha_1" placeholder="电话" id="qryMobile"/>
            <input type="number" min="0" max="140" class="form-control ha_2 ha_1" placeholder="年龄" id="qryAge"/>
            <input class="form-control ha_2 ha_1" placeholder="注册时间起始" id="qryRegTimeStart"/>
            <input class="form-control ha_2 ha_1" placeholder="注册时间截至" id="qryRegTimeEnd"/>
            <span class="input-group-btn ha_2 ha_1">
                <button class="btn btn-info" id="btnQuery"><span class="glyphicon glyphicon-refresh "></span>查询</button>
                <button class="btn btn-info" id="btnReset"><span class="glyphicon glyphicon-trash "></span>重置条件</button>
                <button class="btn btn-info" id="btnAdd"><span class="glyphicon glyphicon-plus-sign"></span>新增</button>
            </span>
        </div>
    </div>
    <table id="gridTable"></table>
    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="myModal">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title ha_1 ha_2" id="myModalLabel">编辑客户信息</h4>
                </div>
                <div class="modal-body">
                    <form id="editForm" role="form" class="form-horizontal">
                        <input type="hidden" class="form-control" disabled="disabled" id="id">
                        <div class="form-group form-item-custom mt-2">
                            <label class="col-sm-2 control-label form-item-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="name"/>
                            </div>
                        </div>
                        <div class="form-group form-item-custom" id="divAccount">
                            <label class="col-sm-2 control-label form-item-label">登录账号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="account"/>
                            </div>
                        </div>
                        <div class="form-group form-item-custom" id="divPassword">
                            <label class="col-sm-2 control-label form-item-label">登录密码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="password"/>
                            </div>
                        </div>
                        <div class="form-group form-item-custom" id="divConfirmPassword">
                            <label class="col-sm-2 control-label form-item-label">确认密码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="confirmPassword"/>
                            </div>
                        </div>
                        <div class="form-group form-item-custom">
                            <label class="col-sm-2 control-label form-item-label">出生日期</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="birthday"/>
                            </div>
                        </div>
                        <div class="form-group form-item-custom">
                            <label class="col-sm-2 control-label form-item-label">手机号</label>
                            <div class="col-sm-10">
                                <input type="tel" class="form-control" id="mobile"/>
                            </div>
                        </div>
                        <div class="form-group form-item-custom">
                            <label class="col-sm-2 control-label form-item-label">电子邮箱</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="email"/>
                            </div>
                        </div>
                        <div class="form-group form-item-custom" id="divRegTime">
                            <label class="col-sm-2 control-label form-item-label">注册时间</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="regTime" readonly="readonly"/>
                            </div>
                        </div>
                        <div class="form-group form-item-custom" id="divUserId">
                            <label class="col-sm-2 control-label form-item-label">绑定用户</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="userId" readonly="readonly"/>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="btnSava">保存</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    // 限制本页面只能在iframe中显示
    if(window.top === window){
        window.top.location = "${pageContext.request.contextPath}/user/login";
    }
    $(function (){
        //初始化日期控件
        let ops = {
            language: 'zh-CN', //语言
            autoclose: true, //选择后自动关闭
            clearBtn: true,//清除按钮
            format: "yyyy-mm-dd",//日期格式
            todayHighlight: true,
        };
        $("#qryRegTimeStart").datepicker(ops);
        $("#qryRegTimeEnd").datepicker(ops);
        $("#birthday").datepicker(ops);
        // 设置dataGrid
        initDataGrid();
        // 绑定查询按钮点击事件
        $('#btnQuery').on('click',function (){
            $('#gridTable').bootstrapTable('selectPage', 1);//默认显示第一页
        })
        // 绑定重置按钮点击事件
        $('#btnReset').on('click',function (){
            $('#qryName').val('');
            $('#qryMobile').val('');
            $('#qryAge').val('');
            $('#qryRegTimeStart').val('');
            $('#qryRegTimeEnd').val('');
            $('#btnQuery').trigger('click');
        })

        // 绑定新增按钮的点击事件
        $('#btnAdd').click(function () {
            fillData({
                id: null,
                name: '',
                account: '',
                password: '',
                confirmPassword:'',
                birthday:'',
                mobile: '',
                email:'',
                regTime:'',
                userId: null,
            },'add');
        });
        // 绑定模态框中保存按钮的单击事件(关闭按钮的单击事件通过设置data-dismiss属性实现)
        $("#btnSava").click(function(){
            if(formCheck()==false) return;
            //准备需提交的数据
            //(1)新增与修改的公共表单项
            let postData={
                "id": $("#id").val(),
                "name": $("#name").val(),
                "birthday": $("#birthday").val(),
                "mobile": $("#mobile").val(),
                "email": $("#email").val(),
            };
            if($('#myModalLabel').html()==='新增客户'){
                //(2)新增时的独有的表单项
                postData.account=$("#account").val();
                postData.password=$("#password").val();
            }else {
                //(3)修改时独有的表单项
                postData.regTime=$("#regTime").val();
                postData.userId=$("#userId").val();
            }
            //执行异步提交
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/customer/save",
                data:JSON.stringify(postData),
                dataType: "json",
                contentType: "application/json;charset=UTF-8",
                success: function (rdata) {
                    if (rdata.code==200) {
                        $("#myModal").modal('hide');
                        $('#btnQuery').trigger('click');
                    } else {
                        layer.msg(rdata.msg);
                    }
                }
            });
        });
        // 首次页面加载，触发查询操作加载数据
        $('#btnQuery').trigger('click');
    })

    // 返回选中行数据
    function getSelectedRowsData(selector) {
        return $.map(selector.bootstrapTable("getSelections"),
            function(row) {
                return row; // 返回选中行数据
            });
    }

    // 填充数据到模态框
    function fillData(rowData,operate) {

        $("#id").val(rowData.id);
        $("#name").val(rowData.name);
        $("#birthday").val(rowData.birthday);
        $("#mobile").val(rowData.mobile);
        $("#email").val(rowData.email);
        $("#regTime").val(rowData.regTime);
        $("#userId").val(rowData.userId);
        if(operate==='add'){
            $('#myModalLabel').html('新增客户');
            $('#myModalLabel').addClass('ha_1 ha_2');
            $("#divAccount").show();
            $("#divPassword").show();
            $("#divConfirmPassword").show();
            $("#divRegTime").hide();
            $("#divUserId").hide();
            $("#account").val(rowData.account);
            $("#password").val(rowData.password);
            $("#confirmPassword").val(rowData.password);
        }else{
            $('#myModalLabel').html('修改客户信息');
            $("#divAccount").hide();
            $("#divPassword").hide();
            $("#divConfirmPassword").hide();
            $("#divRegTime").show();
            $("#divUserId").show();
        }
        $("#myModal").modal();
    }
    // 获取表格数据的异步请求
    function ajaxRequest(params) {
        $.ajax({
            url: '${pageContext.request.contextPath}/customer/paged',
            type: "post",
            dataType: "json",
            contentType: "application/json;charset=UTF-8",
            data: JSON.stringify(params.data),
            success: function (res) {
                if (res.code == 200) {
                    params.success({ //注意，必须返回参数 params
                        total: res.data.total,
                        rows: res.data.list
                    });
                } else {
                    layer.msg(res.msg);
                }
            },
            error: function (error) {
                console.log(error)
                layer.msg('系统错误,请联系管理员!');
            }
        });
    }
    // 初始化表格数据
    function initDataGrid(){
        $('#gridTable').bootstrapTable({
            ajax: 'ajaxRequest',
            toolbar:'#toolbar',
            queryParams: function(params){//发送请求的参数
                return {
                    // 查询条件
                    filters: {
                        name:$.trim($('#qryName').val()),
                        mobile:$.trim($('#qryMobile').val()),
                        age:$('#qryAge').val(),
                        regTimeStart:$.trim($('#qryRegTimeStart').val()),
                        regTimeEnd:$.trim($('#qryRegTimeEnd').val()),
                    },
                    //分页参数
                    pageIndex:params.offset / params.limit + 1,//页码
                    pageSize:params.limit, //页面大小
                };
            },
            idField: 'id',
            sidePagination:'server',//分页方式
            pageSize: 10,
            pageList: [10, 100, 1000,10000],
            pagination: true,//是否显示分页
            paginationLoop: true, //分页条无限循环
            cache: false,//是否使用缓存
            maintainSelected :true,
            showColumns: true,
            columns: [
                {checkbox: true, visible: true},
                {title: 'id', field: 'id', visible: false},
                {title: '姓名', field: 'name'},
                {title: '登录账号', field: 'account'},
                {title: '登录密码', field: 'password',visible: false},
                {title: '出生日期', field: 'birthday'},
                {title: '手机号', field: 'mobile'},
                {title: '电子邮箱', field: 'email'},
                {title: '注册时间', field: 'regTime'},
                {title: '绑定用户', field: 'userId',formatter: function (value, row, index) {
                        if(row.user){
                            return row.user.account;
                        }else{
                            return '(未绑定)';
                        }
                    }},
                {
                    title: '操作', field: "operates",
                    formatter: function (value, row, index) {
                        let btnHtml = '';
                        if (row.id) {
                            btnHtml += '<button class="btn btn-info btn-xs mr-1" id="rowDelete"><span class="glyphicon glyphicon-remove-circle"></span>删除</button>';
                            btnHtml += '<button class="btn btn-info btn-xs mr-1" id="rowEdit"><span class="glyphicon glyphicon-edit"></span>编辑</button>';
                        }
                        return btnHtml;
                    },
                    events: {
                        'click #rowDelete': function (e, value, row, index) {//行删除按钮的单击事件
                            layer.confirm('您确定要删除吗？', {
                                btn: ['确定', '取消']
                            }, function (index) {//点确定
                                layer.close(index);
                                //根据主键删除
                                $.ajax({
                                    type: "DELETE",
                                    url: "${pageContext.request.contextPath}/customer/delete/" + row.id,
                                    dataType: "json",
                                    cache: false,
                                    async: false,
                                    success: function (rdata) {
                                        if (rdata.code == 200) {
                                            $('#btnQuery').trigger('click');
                                        } else {
                                            layer.msg(data);
                                        }
                                    },
                                });
                            });
                        },
                        'click #rowEdit': function (e, value, row, index) {//行编辑按钮的单击事件
                            fillData(row,'edit');
                        }
                    }
                },
            ]
        });
        initTableHeight();
    }
    // 模态框保存数据前进行数据验证
    function formCheck() {
        //数据验证
        if($("#name").val().length==0){
            layer.msg("姓名不能为空");
            return false;
        }
        if($('#myModalLabel').html()==='新增客户'){
            if($("#account").val().length==0){
                layer.msg("登录账号不能为空");
                return false;
            }
            if($("#password").val().length==0){
                layer.msg("登录密码不能为空");
                return false;
            }
            if($("#confirmPassword").val().length==0){
                layer.msg("确认密码不能为空");
                return false;
            }
            if($("#confirmPassword").val()!=$("#password").val()){
                layer.msg("确认密码与登录密码不一致");
                return false;
            }
        }
        return true;
    }
    //表格高度自适应
    function initTableHeight(){
        //父窗口iframe高度
        let parentFrameHeight = $("#frameContent", parent.document).height();
        //工具栏高度
        let toolbarHeight = $("#toolbar").height();
        //h5标题高度
        let titleHeight=24;
        //分页控件高度
        let pageCtlHeight=91;
        //计算表格container的高度
        let height = parentFrameHeight - toolbarHeight -titleHeight- pageCtlHeight - 20;
        $(".fixed-table-container").css({"height": height});
    }
</script>

</html>
