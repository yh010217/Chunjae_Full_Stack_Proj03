<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/admin/template.css">
    <link rel="stylesheet" href="/resources/css/admin/teacher_register.css">
    <link rel="icon" href="/resources/image/icon_love.png">
    <title>해법학원 | 강사 등록</title></head>
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
                <img class="side_bar_menu_image" src="/resources/image/admin/main/teacher-gray.png" alt="강서 관리">
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
        <div class="teacher_form">
            <h2>강사 등록</h2>
            <form method="post" action="/admin/registerResult" enctype="multipart/form-data">
                <ul class="teacher_ul">
                    <li class="teacher_profile">
                        <div class="show" id="show"><img id="teacherImg"
                                                         onerror="this.src='https://cdn-icons-png.flaticon.com/128/4238/4238700.png'"
                                                         src="" alt=""></div>
                    </li>
                    <li class="input_tprofile">
                        <label>프로필 등록</label><br>
                        <input type="file" id="file" name="file">
                    </li>
                    <li>
                        <label for="id" class="label_id">ID</label>
                        <input type="text" name="id" id="id" class="input_box" placeholder="ID를 입력하세요."/>
                        <button class="idCheck" name="idCheck" id="idCheck" type="button">확 인</button><br>

                        <%--           <span class="id_input_re_1">존재하는 아이디입니다.</span>
                                   <span class="id_input_re_2">아이디가 존재하지 않습니다. </span>
                        --%>         </li>
                    <span id="id_check_result"></span>
                    <li>
                        <label for="tsubject" class="label_tsubject">과목</label>
                        <input type="text" name="tsubject" id="tsubject" class="input_box" placeholder="과목을 입력하세요.">
                    </li>
                    <li>
                        <label for="tintro" class="label_tintro">소개</label>
                        <input type="text" name="tintro" id="tintro" class="input_box" placeholder="선생님 소개를 입력하세요."/>
                    </li>
                    <li>
                        <input type="submit" class="btn submit_btn" value="등 록">
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>

</body>
<script>

</script>
<script src="/resources/js/admin/teacher.js"></script>
</html>
