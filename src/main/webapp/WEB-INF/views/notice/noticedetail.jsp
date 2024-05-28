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
            <div class="content">내용 :${detailNot.ncontent}</div>
        </div>
    </div>
</body>
</html>
