<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>黑马旅游网</title>
    <!--导入bootstrap框架-->
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
    <style>
        * {
            padding: 0px;
            margin: 0px;
        }

        a:link {
            color: black;
            text-decoration: none;
        }

        a:hover {
            color: orange;
            text-decoration: none;
        }

        .padd-top {
            padding-top: 10px;
        }

        .search_input {
            /* 宽400，高36，左浮动，边框2，颜色#ffc900，左内边距10，外轮廓outline设置为0*/
            width: 400px;
            height: 36px;
            float: left;
            border: 2px solid #ffc900;
            padding-left: 10px;
            outline: 0px;
        }

        .search_button {
            /*点击按钮，是一个链接：左浮动，宽90，高36，背景色#ffc900，行高36，文本居中*/
            float: left;
            width: 90px;
            height: 36px;
            background-color: #ffc900;
            text-align: center;
            line-height: 36px;
        }

        .jx_top {
            /*外上边距15px, 底部边框2px 实线 #ffc900做为下面的线，
            宽度100%，高度35px，行高35px，外下边距5px。图标文件：icon_5.jpg*/
            margin-top: 15px;
            border-bottom: 2px solid #ffc900;
            width: 100%;
            height: 35px;
            line-height: 35px;
            margin-bottom: 5px;
        }

        .company {
            /*字体大小12，背景色#ffc900，文字居中对齐，高度与行高为40px*/
            font-size: 12px;
            background-color: #ffc900;
            text-align: center;
            height: 40px;
            line-height: 40px;
        }
    </style>
</head>
<body>
<header class="container-fluid">
    <!--第一行-->
    <div class="row">
        <img src="img/top_banner.jpg" class="img-responsive">
    </div>
    <!--第二行-->
    <div class="row padd-top">
        <div class="col-md-4">
            <img src="img/logo.jpg" class="text-center">
        </div>
        <div class="col-md-5 padd-top">
            <input class="search_input" type="text" placeholder="请输入线路名称">
            <a class="search_button" href="#">搜索</a>
        </div>
        <div class="col-md-3">
            <img src="img/hotel_tel.png">
        </div>
    </div>
    <!--第三行-->
    <div class="row">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- 指定商标和开关的样式，让它在手机上更好的显示-->
                <div class="navbar-header">
                    <!--开关按钮-->
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="glyphicon glyphicon-th-list" style="color: white"></span>
                    </button>
                    <a class="navbar-brand" href="#">传智播客</a>
                </div>

                <!-- 下拉菜单，表单等-->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">JavaEE <span class="sr-only">(current)</span></a></li>
                        <li><a href="#">Android</a></li>
                        <li><a href="#">Android</a></li>
                        <li><a href="#">Android</a></li>
                        <li><a href="#">Android</a></li>
                        <li><a href="#">Android</a></li>
                        <li><a href="#">Android</a></li>
                        <li><a href="#">Android</a></li>
                        <li><a href="#">Android</a></li>
                        <li><a href="#">Android</a></li>
                        <li><a href="#">Android</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>

    <!--第四行：轮播图-->
    <div class="row">
        <div id="carousel-example-generic" data-interval="2000" class="carousel slide" data-ride="carousel">
            <!-- 中间的小圆点 -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- 包含图片 -->
            <div class="carousel-inner" role="listbox">
                <!--每个div是一张图片-->
                <div class="item active">
                    <img src="img/banner_1.jpg">
                    <div class="carousel-caption">
                        弓箭手
                    </div>
                </div>
                <div class="item">
                    <img src="img/banner_2.jpg" alt="...">
                    <div class="carousel-caption">
                        我是歌手
                    </div>
                </div>
                <div class="item">
                    <img src="img/banner_3.jpg" alt="...">
                    <div class="carousel-caption">
                        花木兰
                    </div>
                </div>
            </div>

            <!-- 控制按钮 -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</header>
<div class="container">
    <!--黑马精选-->
    <div class="row">
        <div class="jx_top">
            <img src="img/icon_5.jpg">
            黑马精选
        </div>
    </div>

    <div class="row">
        <div class="col-md-3">
            <div class="thumbnail">
                <img src="img/jiangxuan_1.jpg" alt="...">
                <div class="caption">
                    <p>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</p>
                    <span style="color: red">&yen;888</span>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="thumbnail">
                <img src="img/jiangxuan_1.jpg" alt="...">
                <div class="caption">
                    <p>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</p>
                    <span style="color: red">&yen;888</span>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="thumbnail">
                <img src="img/jiangxuan_1.jpg" alt="...">
                <div class="caption">
                    <p>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</p>
                    <span style="color: red">&yen;888</span>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="thumbnail">
                <img src="img/jiangxuan_1.jpg" alt="...">
                <div class="caption">
                    <p>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</p>
                    <span style="color: red">&yen;888</span>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="jx_top">
            <img src="img/icon_6.jpg">
            国内游
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <img src="img/guonei_1.jpg" class="img-responsive">
        </div>
        <div class="col-md-8">
            <div class="col-md-4">
                <div class="thumbnail">
                    <img src="img/jiangxuan_1.jpg" alt="...">
                    <div class="caption">
                        <p>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</p>
                        <span style="color: red">&yen;888</span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail">
                    <img src="img/jiangxuan_1.jpg" alt="...">
                    <div class="caption">
                        <p>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</p>
                        <span style="color: red">&yen;888</span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail">
                    <img src="img/jiangxuan_1.jpg" alt="...">
                    <div class="caption">
                        <p>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</p>
                        <span style="color: red">&yen;888</span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail">
                    <img src="img/jiangxuan_1.jpg" alt="...">
                    <div class="caption">
                        <p>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</p>
                        <span style="color: red">&yen;888</span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail">
                    <img src="img/jiangxuan_1.jpg" alt="...">
                    <div class="caption">
                        <p>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</p>
                        <span style="color: red">&yen;888</span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail">
                    <img src="img/jiangxuan_1.jpg" alt="...">
                    <div class="caption">
                        <p>上海直飞三亚5天4晚自由行(春节预售+亲子/蜜月/休闲游首选+豪华酒店任选+接送机)</p>
                        <span style="color: red">&yen;888</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="container-fluid">
    <div class="row">
        <img src="img/footer_service.png" class="img-responsive">
    </div>
    <div class="row company">
        江苏传智播客教育科技股份有限公司 版权所有Copyright 2006-2018, All Rights Reserved 苏ICP备16007882
    </div>
</footer>
</body>
</html>
