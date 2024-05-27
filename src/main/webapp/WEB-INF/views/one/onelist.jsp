<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: UENA
  Date: 2024-05-26
  Time: 오후 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>일대일게시판</title>
</head>
<body>
<div class="table">
    <div class="tr">
        <div class="th">글번호</div>
        <div class="th">제목</div>
        <div class="th">글내용</div>
        <div class="th">등록날짜</div>
        <div class="th">답변자</div>
    </div>
    <div class="tr">
        <c:forEach var="item" items="${list}">
            <div class="td">
                <a href="/index/onedetail/${item.ono}"><c:out value="${item.ono}"/></a>
                <c:out value="${item.otitle}"/>
                <c:out value="${item.ocontent}"/>
                <c:out value="${item.oregdate}"/>
                <c:out value="${item.owriter}"/>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
