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
</head>
<body>
<div class="table">
    <div class="tr">
        <div class="th">제목 :${detailNot.ntitle}</div>
        <div class="th">내용 :${detailNot.ncontent}</div>
        <div class="th">등록날짜: ${detailNot.ndate}</div>
    </div>
</div>
</body>
</html>
