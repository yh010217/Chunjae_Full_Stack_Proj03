<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>마이페이지</title>
    <link rel="stylesheet" href="/resources/css/mypage/mypage_template.css">
    <link rel="stylesheet" href="/resources/css/mypage/modify.css">
    <script src="/resources/js/mypage/modify.js"></script>
</head>
<body>
<div id="wrap">
    <%-- 왼쪽 사이드바  --%>
    <div id="sidebar">
        <ul>
            <li class="side_title">안녕하세요!<br> <c:out value="${nickname}"/> 님</li>
        </ul>
        <ul class="menu">
            <li class="menu_title"><a href="/index/mypage">내 강의 보기</a></li>
            <li class="menu_title"><a href="/index/mypage/paid">거래 내역</a></li>
            <li class="menu_title"><a href="/index/mypage/cart">장바구니</a></li>
            <li class="menu_title"><a href="/index/mypage/modify">회원 정보 수정</a></li>
            <li class="menu_title"><a href="#">고객센터</a></li>
            <li class="menu_title"><a href="/logout">로그아웃</a></li>
        </ul>
    </div>
    <%-- content 영역  --%>
    <div id="content">
        <div id="form">
            <h3>회원 정보 수정.</h3>
            <div id="line"></div>
            <form method="post" action="/modifyresult">
                <input type="hidden" id="uid" name="uid" value="${dto.uid}">
                <ul>
                    <li>
                        <label for="id">아이디</label>
                        <input type="text" id="id" name="id" value="${dto.id}" readonly>
                    </li>
                    <li>
                        <label for="name">이름</label>
                        <input type="text" id="name" name="name" value="${dto.name}" readonly>
                    </li>
                    <li>
                        <label for="nickname">닉네임</label>
                        <input type="text" id="nickname" value="${dto.nickname}" name="nickname">
                        <button class="nicknameCk" name="nicknameCk" id="nicknameCk" type="button">중복 체크</button><br>
                        <span id="nickname_check_result"></span>
                    </li>
                    <li>
                        <label for="email">이메일</label>
                        <input type="text" id="email" value="${dto.email}" name="email">
                        <button class="emailCk" name="emailCk" id="emailCk" type="button">중복 체크</button><br>
                        <span id="email_check_result"></span>

                    </li>
                    <li>
                        <label for="tel">전화번호</label>
                        <input type="text" id="tel" value="${dto.tel}" name="tel">
                    </li>
                    <li>
                        <button type="submit">수정 완료</button>
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>
</body>
</html>
