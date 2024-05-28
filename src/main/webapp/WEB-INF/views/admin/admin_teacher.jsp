<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/admin/template.css">
    <link rel="stylesheet" href="/resources/css/admin/teacher.css">
    <link rel="icon" href="/resources/image/icon_love.png">
    <title>해법학원 | 강사관리</title></head>
    <script src="/resources/js/admin/teacher.js"></script>
<body>

<div id="container">

    <aside id="side_bar">
        <div id="side_bar_header">
            <img class="header_img" src="/resources/image/admin/main/HB-logo.png">
            <a href="/admin/main" class="header_title">해법학원</a>
        </div>
        <div id="side_bar_menus">
            <a href="#" class="side_bar_menu">
                <img class="side_bar_menu_image" src="/resources/image/admin/main/user-gray.png" alt="회원 관리">
                <span class="side_bar_menu_name">회원 관리</span>
            </a>
            <a href="/admin/teacher" class="side_bar_menu">
                <img class="side_bar_menu_image" src="/resources/image/admin/main/teacher-gray.png" alt="강서 관리">
                <span class="side_bar_menu_name">강사 관리</span>
            </a>
            <a href="#" class="side_bar_menu">
                <img class="side_bar_menu_image" src="/resources/image/admin/main/board-gray.png" alt="고객 지원 관리">
                <span class="side_bar_menu_name">고객 지원 관리</span>
            </a>
        </div>
    </aside>

    <div id="content_container">
            <a href="/admin/register">강사 등록</a>
        <div class="teacher">
            <h2>전체 강사</h2>
            <ul>
                <c:forEach var="item" items="${list}">
                    <li>
                        <p class="t_1"><c:out value="${item.tid}"/> </p>
                        <p class="t_2"><c:out value="${item.tsubject}"/></p>
                        <img class="teacher_img" src="/getImg/${item.tprofile}" alt="${item.tprofile}">
                        <p class="t_3"><c:out value="${item.name}"/></p>
                        <p class="t_4"><c:out value="${item.tintro}"/></p>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

</body>
</html>