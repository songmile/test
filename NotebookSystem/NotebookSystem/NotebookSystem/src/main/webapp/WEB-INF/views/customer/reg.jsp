<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8" http-equiv="Content-Type" content="text/html">
    <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
    <title>客户注册</title>
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
    <!-- 引入bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
    <!-- bootstrap-datepicker -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-datepicker/css/bootstrap-datepicker.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
    <style>

        body {
            background-image: url('${pageContext.request.contextPath}/static/images/background1.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 90vh;
        }

        .logo {
            width: 400px; /* 调整Logo大小 */
            position: absolute;
            top: 0px;
            right: 20px;
        }

        .regForm {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        .regForm h5 {
            margin-bottom: 20px;
            text-align: center;
            color: #007bff;
        }
        .form-control {
            border-radius: 5px;
        }
        .btn-primary {
            width: 100%;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <img src="${pageContext.request.contextPath}/static/images/Logo-tm.png" alt="Logo" class="logo">
    <div class="regForm">
        <h5>客户注册</h5>
        <form id="form">
            <div class="form-group">
                <label for="name">姓名</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名">
            </div>
            <div class="form-group">
                <label for="account">登录账号</label>
                <input type="text" class="form-control" id="account" name="account" placeholder="请输入登录账号">
            </div>
            <div class="form-group">
                <label for="password">登录密码</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="请输入登录密码">
            </div>
            <div class="form-group">
                <label for="confirmPassword">确认密码</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="请再次输入密码">
            </div>
            <div class="form-group">
                <label for="birthday">出生日期</label>
                <input type="date" class="form-control" id="birthday" name="birthday">
            </div>
            <div class="form-group">
                <label for="mobile">手机号</label>
                <input type="text" class="form-control" id="mobile" name="mobile" placeholder="请输入手机号">
            </div>
            <div class="form-group">
                <label for="email">邮箱</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="请输入邮箱">
            </div>
            <button type="button" class="btn btn-primary" id="btnReg">注册</button>
        </form>
    </div>
</div>
<script>
    // 限制本页面不在iframe中显示
    if(window.top !== window){
        window.top.location = window.location;
    }
    if(window.top !== window){
        window.top.location = window.location;
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
        $("#birthday").datepicker(ops);
        // 提交注册信息按钮事件
        $('#btnReg').click(function () {
            //数据验证
            if($("#name").val().length==0){
                layer.msg("姓名不能为空");
                return;
            }
            if($("#account").val().length==0){
                layer.msg("登录账号不能为空");
                return;
            }
            if($("#password").val().length==0){
                layer.msg("登录密码不能为空");
                return;
            }
            if($("#confirmPassword").val().length==0){
                layer.msg("确认密码不能为空");
                return;
            }
            if($("#confirmPassword").val()!=$("#password").val()){
                layer.msg("确认密码与登录密码不一致");
                return;
            }
            //提交注册信息
            $.ajax({
                url: "${pageContext.request.contextPath}/customer/save",
                dataType: "json",
                type: "post",
                contentType: "application/json;charset=UTF-8",
                data:JSON.stringify( $("#form").serializeObject()),
                success:function(res){
                    if(res.code==200){
                        layer.msg('注册成功!');
                        window.location="${pageContext.request.contextPath}/user/login";
                    }else{
                        layer.msg(res.msg);
                    }
                },
                error:function(){
                    layer.msg('系统错误,请联系管理员!');
                },
            });
        });
        <%--$('#btnLogin').click(function () {--%>
        <%--    window.location="${pageContext.request.contextPath}/user/login";--%>
        <%--});--%>
    })
</script>
</body>
</html>
