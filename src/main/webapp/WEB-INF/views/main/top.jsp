<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-20
  Time: 오후 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <li><a href="/index/teacher">선생님</a></li>
                <li><a href="/index/comingsoon">오픈예정</a></li>
                <li><a href="/index/noticelist">공지사항</a></li>
            </ul>
        </nav>


        <c:choose>
            <c:when test="${sessionScope.id == 'admin'}">
                <!-- 관리자페이지 로그아웃-->
                <ul class="top_ul_02">
                    <li><a href="/admin/main">관리자페이지</a></li>
                    <li><a href="/logout">로그아웃</a></li>
                </ul>
            </c:when>
            <c:when test="${sessionScope.id == null}">
                <!-- 회원가입, 로그인 -->
                <ul class="top_ul_02">
                    <li><a href="/index/signup">회원가입</a></li>
                    <li><a href="/index/login">로그인</a> </li>
                </ul>
            </c:when>
            <c:when test="${sessionScope.id != null || !sessionScope.id == 'admin'}">
                <!-- 로그아웃 마이페이지 -->
                <ul class="top_ul_02">
                    <li><a href="/index/mypage">마이페이지</a></li>
                    <li><a href="/logout">로그아웃</a></li>
                </ul>
            </c:when>
            <c:otherwise>
                <c:out value="어레레 이런 게 있ㄴ ㅏㅏㅏㅏㅏ"/>
            </c:otherwise>
        </c:choose>

    </header>
</body>
</html>