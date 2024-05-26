<%--
  Created by IntelliJ IDEA.
  User: UENA
  Date: 2024-05-27
  Time: 오전 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="table">
    <div class="tr">
        <div class="th">제목 :${oneDetail.otitle}</div>
        <div class="th">내용 :${oneDetail.ocontent}</div>
        <div class="th">등록날짜: ${oneDetail.oregdate}</div>
    </div>
    <div class="btnset">
        <c:if test="${sessionScope.id == 'admin'}">
            <a href="/index/reply/${oneDetail.uid}">답변등록하기</a>
        </c:if>

    </div>
</div>
</body>
</html>
