<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset='utf-8'/>
    <style>
        /* 이벤트 목록을 담을 컨테이너 스타일 */
        #eventList {
            list-style-type: none; /* 기본 리스트 스타일 제거 */
            padding: 0; /* 기본 패딩 제거 */
            margin: 0; /* 기본 마진 제거 */
        }

        /* 각 이벤트 항목 스타일 */
        #eventList li {
            display: flex;
            justify-content: flex-start;
            align-items: baseline;
            /* padding: 10px; */
            /* border-bottom: 1px solid #ddd; */
            margin-bottom: 5px;
            margin-top: 8px;
            background-color: #f9f9f9;
            border-radius: 4px;
        }

        /* 링크 스타일 */
        #eventList li #title {
            text-decoration: none; /* 링크 밑줄 제거 */
            color: #007bff; /* 링크 색상 설정 */
        }

        #eventList li #teacher {
            text-decoration: none; /* 링크 밑줄 제거 */
            font-weight: bolder /* 링크 색상 설정 */
        }

        /* 링크 호버 스타일 */
        #eventList li a:hover {
            text-decoration: underline; /* 호버 시 밑줄 추가 */
        }

        /* 날짜 텍스트 스타일 */
        #eventList li .date {
            font-weight: bold; /* 폰트 굵게 설정 */
            color: #333; /* 텍스트 색상 설정 */
        }

        /* 선생님 이름과 과목 텍스트 스타일 */
        #eventList li .teacher, #eventList li .subject {
            margin-left: 10px; /* 왼쪽 여백 추가 */
            color: #666; /* 텍스트 색상 설정 */
        }

    </style>
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
