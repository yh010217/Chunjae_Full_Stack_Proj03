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
      <h2>강사 등록 go ,,</h2>
    <form method="post" action="/admin/registerResult" enctype="multipart/form-data">
      <ul>
        <li>
          <div class="show" id="show"><img src="" alt=""></div>
        </li>
        <li class="input_tprofile">
          <label>강사 프로필 등록</label><br>
          <input type="file" id="file" name="file">
        </li>
        <li>
          <label for="id">강사 ID</label>
          <input type="text" name="id" id="id"/>
     <%--     &lt;%&ndash; 회원 확인 후 입력하게 하기 &ndash;%&gt;
          <button type="button" id="UserCk">회원 확인</button>--%>
        </li>
        <li>
          <label for="tsubject">과목</label>
          <input type="text" name="tsubject" id="tsubject">
        </li>
        <li>
          <label for="tintro">소개</label>
          <input type="text" name="tintro" id="tintro"/>
        </li>
        <li>
          <input type="submit" value="등록하기">
          <input type="reset" value="취소하기">
        </li>
      </ul>
    </form>
  </div>
</div>

</body>
</html>
