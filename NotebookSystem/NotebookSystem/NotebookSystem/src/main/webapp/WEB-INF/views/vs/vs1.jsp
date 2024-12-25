<%--
  Created by IntelliJ IDEA.
  User: 86182
  Date: 2024/12/22
  Time: 下午3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>可视化功能</title>
    <script src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
</head>
<body>
    <div id="registrationChart" style="width: 600px; height: 400px;"></div>
    <div id="ageDistributionChart" style="width: 600px; height: 400px;"></div>

    <script>
        $(function() {
            // 初始化注册人数柱状图
            var registrationChart = echarts.init(document.getElementById('registrationChart'));
            var registrationOption = {
                title: {
                    text: '近五天注册人数'
                },
                tooltip: {},
                xAxis: {
                    data: [] // 将通过 AJAX 动态加载
                },
                yAxis: {},
                series: [{
                    name: '注册人数',
                    type: 'bar',
                    data: [] // 将通过 AJAX 动态加载
                }]
            };
            registrationChart.setOption(registrationOption);

            // 初始化用户年龄分布饼图
            var ageDistributionChart = echarts.init(document.getElementById('ageDistributionChart'));
            var ageDistributionOption = {
                title: {
                    text: '用户年龄分布'
                },
                tooltip: {},
                series: [{
                    name: '年龄分布',
                    type: 'pie',
                    data: [] // 将通过 AJAX 动态加载
                }]
            };
            ageDistributionChart.setOption(ageDistributionOption);

            // 获取注册人数数据
            $.ajax({
                url: '/api/registrationData', // 替换为实际的 API 路径
                method: 'GET',
                success: function(data) {
                    registrationChart.setOption({
                        xAxis: {
                            data: data.dates
                        },
                        series: [{
                            data: data.registrationCounts
                        }]
                    });
                }
            });

            // 获取年龄分布数据
            $.ajax({
                url: '/api/ageDistributionData', // 替换为实际的 API 路径
                method: 'GET',
                success: function(data) {
                    ageDistributionChart.setOption({
                        series: [{
                            data: data.ageDistribution
                        }]
                    });
                }
            });
        });
    </script>
</body>
</html>
