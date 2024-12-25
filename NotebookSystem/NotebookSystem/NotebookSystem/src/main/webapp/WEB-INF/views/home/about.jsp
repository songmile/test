<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        color: #333;
        background-color: #f5f5dc; /* 柔和的米色背景 */
        display: flex;
        justify-content: center;
        align-items: center;
        height: 90vh;
        text-align: center;
    }

    .content {
        background-color: rgba(255, 255, 255, 0.8);
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    h1 {
        font-size: 2.5rem;
        margin-bottom: 20px;
        color: #2f4f4f; /* 深蓝色 */
    }

    p {
        font-size: 1.2rem;
        color: #555;
    }
</style>
</head>
<body>
<div>
    <img style="height: 600px" src="${pageContext.request.contextPath}/static/images/Logo-tm.png"  alt=""/>
</div>

<div class="content">
    <p>让您的记忆跃上云端之巅</p>
    <p>无论身在何方</p>
    <p>即刻捕捉灵感</p>
    <p>轻松穿梭于过往与未来之间</p>
</div>

</body>
<script>
    // 限制本页面只能在iframe中显示
    if(window.top === window){
        window.top.location = "${pageContext.request.contextPath}/user/login";
    }
</script>
</html>
