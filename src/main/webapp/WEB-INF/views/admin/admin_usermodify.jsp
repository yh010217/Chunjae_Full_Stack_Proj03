<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/admin/template.css">
    <script defer src="/resources/js/admin/usercheck.js"></script>
</head>
<body>
<div id="container">

    <aside id="side_bar">
        <div id="side_bar_header">
            <img class="header_img" src="/resources/image/admin/main/HB-logo.png">
            <a href="/admin/main" class="header_title">해법학원</a>
        </div>
        <div id="side_bar_menus">
            <a href="/admin/user" class="side_bar_menu">
                <img class="side_bar_menu_image" src="/resources/image/admin/main/user-gray.png" alt="회원 관리">
                <span class="side_bar_menu_name">회원 관리</span>
            </a>
            <a href="/admin/teacher" class="side_bar_menu">
                <img class="side_bar_menu_image" src="/resources/image/admin/main/teacher-gray.png" alt="강사 관리">
                <span class="side_bar_menu_name">강사 관리</span>
            </a>
            <a href="/admin/noticelist" class="side_bar_menu">
                <img class="side_bar_menu_image" src="/resources/image/admin/main/board-gray.png" alt="고객 지원 관리">
                <span class="side_bar_menu_name">고객 지원 관리</span>
            </a>
        </div>
    </aside>


    <div id="content_container">
        <form method="post" action="/modify_result">
            <ul>
                <input type="hidden" name="uid" value="${dto.uid}"/>
                <li>아이디 : ${dto.id}</li>
                <li>
                    <label for="nickname">닉네임</label>
                    <input type="text" id="nickname" value="${dto.nickname}" name="nickname">
                    <button type="button" name="nickname_check" id="nickname_check">중복 체크</button>
                    <span id="nickname_check_result"></span>
                </li>
                <li>이메일: ${dto.email}</li>
                <li>전화번호: ${dto.tel}</li>
                <li>
                    <button type="submit">수정 완료</button>
                </li>
            </ul>
        </form>


    </div><!--content_container-->



</div>
</body>
</html>
    