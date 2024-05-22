<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/admin/template.css">
    <link rel="stylesheet" href="/resources/css/admin/main.css">
</head>
<body>

<div id="container">
    <aside id="side_bar">
        <div id="side_bar_header">
            <img class="header_img" src="/resources/image/HB-logo.png">
            <a href="#" class="header_title">해법학원</a>
        </div>
        <div id="side_bar_menus">
            <a href="#" class="side_bar_menu">
                <img class="side_bar_menu_image" src="/resources/image/user-gray.png" alt="회원 관리">
                <span class="side_bar_menu_name">회원 관리</span>
            </a>
            <a href="#" class="side_bar_menu">
                <img class="side_bar_menu_image" src="/resources/image/teacher-gray.png" alt="강서 관리">
                <span class="side_bar_menu_name">강사 관리</span>
            </a>
            <a href="#" class="side_bar_menu">
                <img class="side_bar_menu_image" src="/resources/image/board-gray.png" alt="고객 지원 관리">
                <span class="side_bar_menu_name">고객 지원 관리</span>
            </a>
        </div>
    </aside>
    <div id="content_container">
        <div class="content_row status_chart_row">
            <div class="site_status">

            </div>
            <div class="site_chart">
                <div class="button_div">
                    <button>일단</button
                    ><button>아무거나</button
                    ><button id="user_chart">유저</button>
                </div>
                <div id="myChartContainer">
                    <canvas id="myChart"></canvas>
                </div>
            </div>
        </div>

        <div class="content_row table_row">

        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="/resources/js/admin/test_chart.js"></script>
<%--<script src="/resources/js/admin/test_chart.js"></script>--%>

</body>
</html>
