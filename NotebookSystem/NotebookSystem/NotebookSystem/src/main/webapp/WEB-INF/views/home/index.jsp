<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8" http-equiv="Content-Type" content="text/html">
    <meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
    <title>欢迎来到云休记事本</title>
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
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/bootstrap-datepicker/css/bootstrap-datepicker.css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>
    <!-- bootstrap-table -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-table/bootstrap-table.css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-table/bootstrap-table.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
    <!-- bootstrap-select -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-select/css/bootstrap-select.css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-select/js/bootstrap-select.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-select/js/bootstrap-select-ext.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-select/js/i18n/defaults-zh_CN.js"></script>
    <!-- bootstrap-toggle -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-toggle/css/bootstrap-toggle.css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-toggle/js/bootstrap-toggle.js"></script>
</head>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        color: #333;
        background-color: #f5f5dc; /* 米色背景 */
    }

    #divHeader {
        background-color: #d2b48c; /* 浅棕色背景 */
        /*padding: 15px 20px;*/
        display: flex;
        align-items: center;
        justify-content: space-between;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    #divHeader h2 {
        background: #d2b48c; /* 浅棕色背景 */
        color: #333;
        margin: 0;
        font-weight: bold;
        font-size: 1.5rem;
        text-align: center;
    }

    .navbar {
        margin-bottom: 20px;
        background: #d2b48c; /* 浅棕色背景 */
    }

    .navbar-brand, .nav-link {
        color: #333 !important;
    }

    .nav-link:hover {
        color: #8b4513 !important; /* 深棕色 */
    }

    .btn-info {
        background: #d2b48c; /* 浅棕色背景 */
        border: none;
        color: #333;
    }

    .btn-info:hover {
        background: #8b4513; /* 深棕色 */
        transform: translateY(-2px);
    }

    #divFooter {
        background-color: #d2b48c; /* 浅棕色背景 */
        color: #333;
        padding: 10px 0;
        position: fixed;
        bottom: 0;
        width: 100%;
        font-size: 9pt;
    }

    #divContentPage {
        margin-bottom: 50px; /* 留出空间给固定的页脚 */
    }

    .input-group-btn {
        display: flex;
        align-items: center;
    }

    .btn {
        margin-left: 10px;
        border-radius: 20px;
        transition: background 0.3s, transform 0.3s;
    }

    .btn-sm {
        padding: 5px 10px;
        font-size: 0.875rem;
    }

    .bg-transparent {
        color: #333;
    }
</style>
<body>
<div id="divHeader" class="row center-block">
    <div class="col-sm-2">
        <%--                <img style="height: 40px" src="${pageContext.request.contextPath}/static/images/Logo-tm.png">--%>
    </div>
    <div class="col-sm-7">
        <h2>云休记事本系统</h2>
    </div>
    <div class="col-sm-3 text-right">
        <div class="input-group-btn">
            <button class="btn btn-sm mt-1" style="cursor: default">当前用户:<span class="bg-transparent">${loginUser.name}</span></button>
            <button class="btn btn-info btn-sm mt-1" id="btnLogout"><span class="glyphicon glyphicon-user"></span>退出登录</button>
        </div>
    </div>

    <nav class="navbar navbar-expand-lg navbar-light" id="navbar">
        <a class="navbar-brand" href="#">系统功能</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto" id="mainTab">
            </ul>
        </div>
    </nav>
</div>
<div id="divContentPage">
    <iframe id="frameContent" name="frameContent" title="content"
            style="width:100%; height:100%;background-color: white"
            src="${pageContext.request.contextPath}/home/about">
    </iframe>
</div>
<div id="divFooter" class="text-center">
    云休记事本系统   如有技术问题，可致电：xxx-xxxxxx
</div>
</body>
<script>
    $(function () {
        // 退出登录按钮单击事件
        $("#btnLogout").on('click', function () {
            window.location = "${pageContext.request.contextPath}/user/login";
        })
        // 动态生成导航菜单
        generateMenu();
        // 调整内容显示区大小
        setDivSize();
        // 屏幕大小改变时,调整内容显示区大小
        window.onresize = setDivSize;
    })

    // 获取json子元素数量
    function JSONLength(obj) {
        var size = 0, key;
        for (key in obj) {
            if (obj.hasOwnProperty(key)) size++;
        }
        return size;
    };

    // 动态生成菜单
    function generateMenu() {
        $.ajax({
            url: "${pageContext.request.contextPath}/user/listMenuAuth",
            dataType: "json",
            type: "get",
            contentType: "application/json;charset=UTF-8",
            success: function (res) {
                console.log(res);
                if (res.code === 200) {
                    $("#mainTab").find("li").remove();
                    //筛选一级菜单
                    let firstMenus = res.data.filter((item) => {
                        return item.parentId == null;
                    });
                    if (JSONLength(firstMenus) === 0) {
                        layer.msg('抱歉，您没有一级菜单权限');
                    }
                    $(firstMenus).each(function (index, firstMenu) {
                        let liTag = document.createElement("li");
                        //筛选当前一级菜单的二级子菜单
                        let subMenus = res.data.filter((item) => {
                            return item.parentId === firstMenu.id;
                        });
                        if (JSONLength(subMenus) > 0) {
                            liTag.setAttribute("class", "nav-item dropdown");
                            let aTag = document.createElement("a");
                            aTag.setAttribute("class", "nav-link dropdown-toggle");
                            aTag.setAttribute("href", "#");
                            aTag.setAttribute("id", "navbarDropdown-" + firstMenu.id);
                            aTag.setAttribute("role", "button");
                            aTag.setAttribute("data-toggle", "dropdown");
                            aTag.setAttribute("aria-expanded", "false");
                            aTag.innerHTML = firstMenu.name;
                            liTag.appendChild(aTag);
                            let divTag = document.createElement("div");
                            divTag.setAttribute("class", "dropdown-menu");
                            divTag.setAttribute("aria-labelledby", "navbarDropdown-" + firstMenu.id);
                            liTag.appendChild(divTag);
                            //添加子菜单
                            $(subMenus).each(function (index2, subMenu) {
                                let smaTag = document.createElement("a");
                                smaTag.setAttribute("class", "dropdown-item");
                                smaTag.setAttribute("href", '${pageContext.request.contextPath}/' + subMenu.url);
                                smaTag.setAttribute("target", "frameContent");
                                smaTag.innerHTML = subMenu.name;
                                divTag.appendChild(smaTag);
                            })
                        } else {
                            liTag.setAttribute("class", "nav-item");
                            let aTag = document.createElement("a");
                            aTag.setAttribute("class","nav-link");
                            aTag.setAttribute("href",'${pageContext.request.contextPath}/'+firstMenu.url);
                            aTag.setAttribute("target", "frameContent");
                            aTag.innerHTML=firstMenu.name;
                            liTag.appendChild(aTag);
                        }
                        $("#mainTab").append($(liTag));
                    })
                } else {
                    layer.msg(res.msg);
                }
            },
            error: function (error) {
                console.log(error);
            },
        });

    }

    // 调整内容显示区大小
    function setDivSize() {
        //高度
        let screenHeight = getTotalHeight();
        console.log("screenHeight:"+screenHeight)
        let divHeaderHeight = $("#divHeader").height();
        console.log("divHeaderHeight:"+divHeaderHeight)
        let divFooterHeight = $("#divFooter").height();
        console.log("divFooterHeight:"+divFooterHeight)
        let devHeight = 100;//IE9漏洞偏移值
        //宽度
        let screenWidth = getTotalWidth();
        let devWidth = -15;//IE9漏洞偏移值
        //计算iFrame宽度
        $("#divContentPage")
            .css("height", screenHeight - divHeaderHeight - divFooterHeight - 50)
            .css("width", screenWidth - devWidth);
        $("#divHeader").css("width", screenWidth - devWidth + 15);
        $("#divFooter").css("width", screenWidth - devWidth);
    }

    // 获取浏览器页面可视高度
    function getTotalHeight() {
        //IE
        if (!$.support.leadingWhitespace) {
            return document.compatMode === "CSS1Compat" ?
                document.documentElement.clientHeight :
                document.body.clientHeight;
        } //not IE
        return self.innerHeight;
    }

    // 获取浏览器页面可视宽度
    function getTotalWidth() {
        //IE
        if (!$.support.leadingWhitespace) {
            return document.compatMode === "CSS1Compat" ?
                document.documentElement.clientWidth :
                document.body.clientWidth;
        } //not IE
        return self.innerWidth;
    }
</script>
</html>
