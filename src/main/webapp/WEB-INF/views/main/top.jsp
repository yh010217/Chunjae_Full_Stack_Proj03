<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-20
  Time: 오후 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main/top.css">
</head>
<body>
    <header>
        <div>
            <a href="/index"> <img src="/resources/image/main/logo.png" alt="로고"> </a>
        </div>
        <nav>
            <ul class="top_ul_01">
                <li><a href="/index/lecturelist">강의</a></li>
                <li><a href="#">선생님</a></li>
                <li><a href="/index/comingsoon">오픈예정</a></li>
                <li><a href="#">공지사항</a></li>
            </ul>
        </nav>

        <c:if test="${sessionScope.id == null}">
            <!-- 회원가입, 로그인 -->
            <ul class="top_ul_02">
                <li><a href="/signup">회원가입</a></li>
                <li><a href="/login">로그인</a> </li>
            </ul>
        </c:if>
        <c:if test="${sessionScope.id != null}">
            <!-- 로그아웃 마이페이지 -->
            <ul class="top_ul_02">
                <li><a href="/mypage">마이페이지</a></li>
                <li><a href="/logout">로그아웃</a></li>
            </ul>
        </c:if>
<%--        <c:if test="#{sessionScope.id == admin}">--%>
<%--            <!-- 관리자페이지 로그아웃-->--%>
<%--            <ul class="top_ul_02">--%>
<%--                <li><input type="button" value="관리자페이지"onclick="location.href='/admin'"></li>--%>
<%--                <li><input type="button" value="로그아웃" onclick="location.href='/logout'"></li>--%>
<%--            </ul>--%>
<%--        </c:if>--%>

    </header>
</body>
</html>
