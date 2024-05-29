<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: UENA
  Date: 2024-05-26
  Time: 오후 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/resources/css/one/onelist.css">
<html>
<head>
    <title>일대일게시판</title>
</head>
<body>
<div id="wrap">

    <div class="test">
        <h1>일대일 답변 게시판</h1>
    <div class="table">

        <div class="tr tr1">
            <div class="td">글번호</div>
            <div class="td">제목</div>
            <div class="td">글내용</div>
            <div class="td">등록날짜</div>
            <div class="td">답변인</div>
        </div>

        <c:forEach var="item" items="${list}">
            <div class="tr">
                <div class="td"><a href="/index/onedetail/${item.ono}?lid=${lid}"><c:out value="${item.ono}"/></a></div>
                <div class="td"><a href="/index/onedetail/${item.ono}?lid=${lid}"><c:out value="${item.otitle}"/></a></div>
                <div class="td"><c:out value="${item.ocontent}"/></div>
                <div class="td"><c:out value="${item.oregdate}"/></div>
                <div class="td"><c:out value="${item.owriter}"/></div>
            </div>
        </c:forEach>
       </div>
    </div>
</div>

</body>
</html>
