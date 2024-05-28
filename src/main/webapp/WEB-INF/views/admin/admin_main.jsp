<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="icon" href="/resources/image/icon_love.png">
    <title>해법학원 | 관리자</title>
    <link rel="stylesheet" href="/resources/css/admin/template.css">
    <link rel="stylesheet" href="/resources/css/admin/main.css">
</head>
<body>

<div id="container">
    <aside id="side_bar">
        <div id="side_bar_header">
            <img class="header_img" src="/resources/image/admin/main/HB-logo.png">
            <a href="/admin/main" class="header_title">해법학원</a>
        </div>
        <div id="side_bar_menus">
            <a href="/admin/user" class="side_bar_menu">
                <img class="side_bar_menu_image" src="/resources/image/admin/main/user-gray.png" alt="회원 관리">
                <span class="side_bar_menu_name">회원 관리</span>
            </a>
            <a href="/admin/teacher" class="side_bar_menu">
                <img class="side_bar_menu_image" src="/resources/image/admin/main/teacher-gray.png" alt="강사 관리">
                <span class="side_bar_menu_name">강사 관리</span>
            </a>
            <a href="/admin/noticelist" class="side_bar_menu">
                <img class="side_bar_menu_image" src="/resources/image/admin/main/board-gray.png" alt="고객 지원 관리">
                <span class="side_bar_menu_name">고객 지원 관리</span>
            </a>
            <a href="/index" class="go_index">
                홈페이지로
            </a>
        </div>
    </aside>
    <div id="content_container">
        <div class="content_row status_chart_row">

            <div class="site_status">
                <div class="status_title">Status</div>

                <div id="status_container">
                    <div class="status_item">
                        <div class="status_item_center">
                            <img src="/resources/image/admin/main/student.png" alt="학생">
                            <span class="status_item_title">학생</span>
                            <span class="status_item_content">${hm.student}명</span>
                        </div>
                    </div>
                    <div class="status_item">

                        <div class="status_item_center">
                            <img src="/resources/image/admin/main/teacher.png" alt="선생님">
                            <span class="status_item_title">선생님</span>
                            <span class="status_item_content">${hm.teacher}명</span>
                        </div>
                    </div>
                    <div class="status_item">

                        <div class="status_item_center">
                            <img src="/resources/image/admin/main/money.png" alt="월간 수익">
                            <span class="status_item_title">주간 수익</span>
                            <span class="status_item_content">
                                <fmt:formatNumber type="number" maxFractionDigits="0"
                                                  value="${hm.pay_per_week div 10000}"/>만
                            </span>
                        </div>
                    </div>
                    <div class="status_item">
                        <div class="status_item_center">
                            <img src="/resources/image/admin/main/lecture.png" alt="강의 수">
                            <span class="status_item_title">강의</span>
                            <span class="status_item_content">${hm.lecture}개</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="site_chart">
                <span class="history_title">History</span>
                <div class="button_div">
                    <button id="user_chart">유저
                    </button
                    ><button id="per_week_chart">주간 결제
                    </button>
                </div>
                <div id="myChartContainer">
                    <canvas id="myChart"></canvas>
                </div>
            </div>
        </div>

        <div class="recent_row">
            <div id="table_top">
                <span class="recent_title">Recent</span>
                <div class="button_div recent_button">
                    <button id="user_recent">신규 유저
                    </button
                    ><button id="pay_recent">최근 결제</button>
                </div>
            </div>
            <table id="recent_table">
                <thead>
                </thead>
                <tbody>
                </tbody>
            </table>
            <div class="table_paging">
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="/resources/js/admin/chart_change.js"></script>
<script src="/resources/js/admin/recent_change.js"></script>
</body>
</html>
