<%--
  Created by IntelliJ IDEA.
  User: UENA
  Date: 2024-05-26
  Time: 오후 8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공지사항</title>
    <link rel="stylesheet" href="/resources/css/notice/detail.css">
</head>
<body>
    <div id="wrap">
        <div id="detail">
            <div class="title"><h2>${detailNot.ntitle}</h2></div>
            <div class="date"> 등록날짜: ${detailNot.ndate}</div>
            <div id="line"></div>
            <div class="content"><pre>내용 :${detailNot.ncontent}</pre></div>
        </div>
    </div>

    <%--<script>
        // DB에서 가져온 텍스트
        let textFromDB = '${detailNot.ncontent}';
        console.log(textFromDB)

        // 줄바꿈 처리
        let textForDisplay = textFromDB.replace(/\n/g, "<br>");

        // 화면에 표시
        document.querySelector(".content").innerHTML = textForDisplay;
    </script>--%>
</body>
</html>
