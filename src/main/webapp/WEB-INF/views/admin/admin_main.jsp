<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2024-05-20
  Time: 오후 5:34
  To change this template use File | Settings | File Templates.
--%>
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
            <img class="header_img" src="/resources/image/admin/main/HB-logo.png">
            <a href="#" class="header_title">해법학원</a>
        </div>
        <div id="side_bar_menus">
            <a href="#" class="side_bar_menu">
                <img class="side_bar_menu_image" src="/resources/image/admin/main/user-gray.png" alt="회원 관리">
                <span class="side_bar_menu_name">회원 관리</span>
            </a>
            <a href="#" class="side_bar_menu">
                <img class="side_bar_menu_image" src="/resources/image/admin/main/teacher-gray.png" alt="강사 관리">
                <span class="side_bar_menu_name">강사 관리</span>
            </a>
            <a href="#" class="side_bar_menu">
                <img class="side_bar_menu_image" src="/resources/image/admin/main/board-gray.png" alt="고객 지원 관리">
                <span class="side_bar_menu_name">고객 지원 관리</span>
            </a>
        </div>
    </aside>
    <div id="content_container">
        <div class="content_row status_chart_row">

            <div class="site_status">
                <div class="div_title">Status</div>

                <div id="status_container">
                    <div class="status_item">
                        <div class="status_item_center">
                            <img src="/resources/image/admin/main/student.png" alt="학생">
                            <span class="status_item_title">학생</span>
                            <span class="status_item_content">nnn명</span>
                        </div>
                    </div>
                    <div class="status_item">

                        <div class="status_item_center">
                            <img src="/resources/image/admin/main/teacher.png" alt="선생님">
                            <span class="status_item_title">선생님</span>
                            <span class="status_item_content">nnn명</span>
                        </div>
                    </div>
                    <div class="status_item">

                        <div class="status_item_center">
                            <img src="/resources/image/admin/main/money.png" alt="월간 수익">
                            <span class="status_item_title">월간 수익</span>
                            <span class="status_item_content">nnn만</span>
                        </div>
                    </div>
                    <div class="status_item">
                        <div class="status_item_center">
                            <img src="/resources/image/admin/main/lecture.png" alt="강의 수">
                            <span class="status_item_title">강의</span>
                            <span class="status_item_content">nnn개</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="site_chart">
                <span class="div_title">History</span>
                <div class="button_div">
                    <button id="user_chart">유저
                    </button
                    ><button id="pur_week_chart">주간 결제
                    </button
                    ><button>아무거나</button>
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
<script src="/resources/js/admin/chart_change.js"></script>
</body>
</html>
