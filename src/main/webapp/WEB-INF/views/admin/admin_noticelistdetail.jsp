<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="/resources/css/admin/template.css">
    <link rel="stylesheet" href="/resources/css/admin/detail.css">
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

            <a href="/index" class="go_index">
                홈페이지로
            </a>
        </div>
    </aside>

    <div id="content_container">
        <div id="wrap">
            <div class="detail">
                <div class="title"><h2>${detailNot.ntitle}</h2></div>
                <div class="date"> 등록날짜: ${detailNot.ndate}</div>
                <div id="line"></div>
                <div class="content">내용 :${detailNot.ncontent}</div>
                <div class="modify"><a href="/admin/noticelist/modify/${detailNot.nno}">수정하기</a></div>
                <div class="del"><a href="/admin/noticelist/delete/${detailNot.nno}">삭제하기</a></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
    