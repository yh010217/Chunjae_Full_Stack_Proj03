<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/admin/template.css">
    <link rel="stylesheet" href="/resources/css/admin/teacher_register.css">
    <link rel="icon" href="/resources/image/icon_love.png">
    <title>해법학원 | 강사 등록</title></head>
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
        <div class="teacher_form">
            <h3>강사 등록</h3>
            <form method="post" action="/admin/registerResult" enctype="multipart/form-data">
                <ul class="teacher_ul">
                    <li class="teacher_profile">
                        <div class="show" id="show"><img id="teacherImg" onerror="this.src='https://cdn-icons-png.flaticon.com/128/4238/4238700.png'" src="" alt="" ></div>
                    </li>
                    <li class="input_tprofile">
                        <label>프로필 등록</label><br>
                        <input type="file" id="file" name="file">
                    </li>
                    <li>
                        <label for="id" class="label_id">ID</label>
                        <input type="text" name="id" id="id" class="input_box" placeholder="ID를 입력하세요."/>
                    </li>
                    <li>
                        <label for="tsubject" class="label_tsubject">과목</label>
                        <input type="text" name="tsubject" id="tsubject" class="input_box" placeholder="과목을 입력하세요.">
                    </li>
                    <li>
                        <label for="tintro" class="label_tintro">소개</label>
                        <input type="text" name="tintro" id="tintro" class="input_box"placeholder="선생님 소개를 입력하세요."/>
                    </li>
                    <li>
                        <input type="submit" class="btn submit_btn" value="등 록">
                        <input type="reset" class="btn reset_btn" value="취 소">
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>

</body>
</html>
