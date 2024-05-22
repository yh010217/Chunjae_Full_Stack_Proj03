<%--
  Created by IntelliJ IDEA.
  User: FULL8-008
  Date: 2024-05-21
  Time: 오후 1:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/lecture/detail.css">
</head>
<body>
    <article id="lecDetail">
        <c:set var="item" value="${dto}"/>
        <ul class="lec_title">
            <li>
                <div class="lecDetail_img">
                    <img class="lecList_img" src="/getImage/${item.lprofile}" alt="${item.lprofile}">
                </div>
            </li>
            <li class="lecDetail_title">${item.ltitle}</li> <%--과목 이름--%>
            <li class="lecDetail_teacher">
                <span>${item.tsubject} ${item.name}선생님
            </li>
            <li>강의 소개 : ${item.lintro}</li>
            <li>
                학년 : ${item.lgrade}학년
                총 ${item.lcount}강
                ${item.lperiod}일
            </li>
            <li>가격 : ${item.lprice}원</li>
            <li>
                <a href="/">장바구니</a>
                <a href="/">결제하기</a>
            </li>
        </ul>

    </article>


</body>
</html>
