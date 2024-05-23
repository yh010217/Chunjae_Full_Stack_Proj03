<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
</head>
<body>
<div class="table">
    <div class="tr">
        <div class="th">글번호</div>
        <div class="th">제목</div>
        <div class="th">글내용</div>
        <div class="th">등록날짜</div>
    </div>
    <div class="tr">
        <c:forEach var="item" items="${noticelist}">
            <div class="td"><a href="/detail/${item.nno}"><c:out value="${item.nno}"/></a></div>
            <div class="td">${item.ntitle}</div>
            <div class="td">${item.ncontent}</div>
            <div class="td">${item.ndate}</div>
        </c:forEach>
    </div>


</div>


</body>
</html>
    