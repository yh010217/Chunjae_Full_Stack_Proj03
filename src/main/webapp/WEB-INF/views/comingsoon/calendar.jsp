<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset='utf-8'/>
    <link rel="stylesheet" href="/resources/css/comingsoon/calendar.css">
    <%-- FullCalendar CDN  --%>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.11/index.global.min.js'></script>
    <script src="/resources/js/comingsoon/calendar.js"></script>
</head>
<body>
<div id="wrap">
    <h4><span>오픈예정</span> 월별로 개강되는 강좌를 한눈에 확인하세요.</h4>
    <div id="cal_wrap">
        <div id='calendar'></div>
    </div>
    <div id="cal_list">
        <div id="eventList"></div>
    </div>
</div>
</body>

</html>
