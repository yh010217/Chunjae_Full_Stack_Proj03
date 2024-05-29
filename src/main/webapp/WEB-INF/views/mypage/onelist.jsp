<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객센터</title>
<%--    <link rel="stylesheet" href="/resources/css/mypage/mypage_template.css">--%>
    <link rel="stylesheet" href="/resources/css/mypage/mypage_template2.css">
    <link rel="stylesheet" href="/resources/css/mypage/onelist.css">
</head>
<body>
<div id="wrap">
    <%-- 왼쪽 사이드바  --%>
    <div id="sidebar_margin"></div>
    <div id="sidebar_container">
        <div id="sidebar">
            <ul>
                <li class="side_title">안녕하세요!<br><c:out value="${nickname}"/> 님</li>
            </ul>
            <ul class="menu">
                <li class="menu_title"><a href="/index/mypage">내 강의 보기</a></li>
                <li class="menu_title"><a href="/index/mypage/paid">거래 내역</a></li>
                <li class="menu_title"><a href="/index/mypage/cart">장바구니</a></li>
                <li class="menu_title"><a href="/index/mypage/modify">회원 정보 수정</a></li>
                <li class="menu_title"><a href="/index/mypage/onelist">고객센터</a></li>
                <li class="menu_title"><a href="/logout">로그아웃</a></li>
            </ul>
        </div>
    </div>
    <%-- content 영역  --%>
    <div id="content">
        <h1>일대일 문의</h1>
        <div id="line"></div>
        <div class="oneform">
            <c:forEach var="item" items="${oneList}">
                <div class="oneone">
                    <div class="td">
                        <h3>문의 내용</h3>

                        <ul>
                            <li>제목: <c:out value="${item.otitle}"/></li>
                            <li>내용: <c:out value="${item.ocontent}"/></li>
                            <li>등록일: <c:out value="${item.oregdate}"/></li>
                        </ul>
                    </div>
                    <div id="line1"></div>
                    <div class="ans">
                        <h3>답변</h3>
                        <ul>
                            <li>답변 내용: <c:out value="${item.oans}"/></li>
                            <li>작성자: <c:out value="${item.owriter}"/></li>
                        </ul>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
    