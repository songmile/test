<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8" http-equiv="Content-Type" content="text/html">
    <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
    <title>用户登录 - 云休记事本系统</title>
    <!-- 引入Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/static/jquery-3.6.1.js"></script> <!-- 确保路径正确 -->
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.bundle.min.js"></script>
    <style>

        .ha_1{
            color: #8b4513;
        }

        .ha_2{
            background-color: #f5f5dc;
        }

        body {
            background-image: url('${pageContext.request.contextPath}/static/images/background1.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 80vh;
        }
        .logo {
            width: 400px; /* 调整Logo大小 */
            position: absolute;
            top: 0px;
            right: 20px;
        }
        .welcome {
            text-align: center;
            color: #ffffff;
            margin-top: 100px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        .welcome h1 {
            font-size: 3em;
            margin-bottom: 10px;
        }
        .welcome p {
            font-size: 1.2em;
        }
        .loginForm {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: rgba(255, 255, 255, 0.9); /* 半透明背景 */
        }
        .loginHeader {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 20px;
        }
        .loginHeader h5 {
            margin: 0;
            color: #007bff;
        }
        .form-control {
            border-radius: 5px;
        }
        .btn-primary, .btn-warning {
            width: 100%;
            border-radius: 5px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <img src="${pageContext.request.contextPath}/static/images/Logo-tm.png" alt="Logo" class="logo">
    <div class="welcome">
        <h1>欢迎来到云休记事本系统</h1>
        <p>随时随地记录您的灵感和想法</p>
    </div>
    <div class="loginForm ha_2">
        <div class="loginHeader">
            <h5 class="ha_1" >用户登录</h5>
        </div>
        <form id="form">
            <div class="form-group">
                <label for="account">登录账号</label>
                <input type="text" class="form-control" id="account" name="account" required="required" autocomplete="off" autofocus="">
            </div>
            <div class="form-group">
                <label for="password">登录密码</label>
                <input type="password" class="form-control" id="password" name="password" required="required">
            </div>
            <button type="button" class="btn btn-primary" id="btnLogin">登录</button>
<%--            <small class="text-info d-block text-center mt-2">您还没有账号？</small>--%>
            <button type="button" class="btn btn-warning" id="btnReg">注册</button>
        </form>
    </div>
</div>
<script>
    // 限制本页面不在iframe中显示
    if(window.top !== window){
        window.top.location = window.location;
    }
    $(function () {
        $('#btnLogin').click(function () {
            $.ajax({
                url: "${pageContext.request.contextPath}/user/login",
                dataType: "json",
                type: "post",
                contentType: "application/json;charset=UTF-8",
                data: JSON.stringify({
                    account: $('#account').val(),
                    password: $('#password').val()
                }),
                success: function (res) {
                    if (res.code === 200) {
                        window.location = "${pageContext.request.contextPath}/home/index";
                    } else {
                        alert(res.msg);
                    }
                },
                error: function () {
                    alert('系统错误,请联系管理员!');
                }
            });
        });
        $('#btnReg').click(function () {
            window.location = "${pageContext.request.contextPath}/customer/reg";
        });
    });
</script>
</body>
</html>