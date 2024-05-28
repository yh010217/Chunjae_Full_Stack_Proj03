<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/admin/template.css">
    <link rel="stylesheet" href="/resources/css/admin/notice_modify.css">

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
        <div id="form">
            <form method="post" action="/noticemodify_result">
                <ul>
                    <li>
                        <label for="nno">글번호</label>
                        <input type="text" name="nno" id="nno" value="${dto.nno}"/>
                    </li>
                    <li><label for="ntitle">제목</label>
                        <input type="text" name="ntitle"  value="${dto.ntitle}" id="ntitle"/>
                    </li>
                    <li>
                        <label for="ncontent">내용</label>
                        <textarea rows="30" cols="100" name = "ncontent" id="ncontent">${dto.ncontent}</textarea>

                    </li>
                    <li><label for="ndate">작성일</label>
                        <input type="date" name="ndate"  value="${dto.ndate}" id="ndate"/>
                    </li>
                    <li>
                        <button type="submit" id="append">수정 완료</button>
                    </li>
                </ul>
            </form>
        </div>



    </div><!--content_container-->



</div>
</body>
</html>
    