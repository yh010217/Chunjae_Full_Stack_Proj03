<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>마이페이지</title>
    <link rel="stylesheet" href="/resources/css/mypage/mypage_template.css">
    <link rel="stylesheet" href="/resources/css/mypage/lecturelist.css">
</head>
<body>
<div id="wrap">
    <%-- 왼쪽 사이드바  --%>
    <div id="sidebar">
        <ul>
            <li class="side_title">안녕하세요!<br> 님</li>
        </ul>
        <ul class="menu">
            <li class="menu_title"><a href="/index/mypage">내 강의 보기</a></li>
            <li class="menu_title"><a href="#">거래 내역</a></li>
            <li class="menu_title"><a href="#">장바구니</a></li>
            <li class="menu_title"><a href="#">회원 정보 수정</a></li>
            <li class="menu_title"><a href="#">고객센터</a></li>
            <li class="menu_title"><a href="#">로그아웃</a></li>
        </ul>
    </div>
    <%-- content 영역  --%>
    <div id="content">
        <h3>내 강의 보기.</h3>
        <div id="line"></div>
        <ul>
            <li class="lecture_btn">전체 목록</li>
            <li class="lecture_btn">수강중</li>
            <li class="lecture_btn">수강 완료</li>
        </ul>
        <c:forEach var="item" items="${list}">
            <ul>
                <li>
                    <c:out value="${item.ltitle}"/>
                    <c:out value="${item.startDate}"/>
                    <c:out value="${item.endDate}"/>
                    <c:out value="${item.tsubject}"/>
                    <c:out value="${item.name}"/>
                </li>
            </ul>
        </c:forEach>
    </div>
</div>
</body>
</html>
