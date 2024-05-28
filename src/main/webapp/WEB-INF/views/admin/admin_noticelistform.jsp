<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항쓰기</title>
    <link rel="stylesheet" href="/resources/css/admin/template.css">

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
        <h2>공지사항 작성</h2>
        <form action="noticelist_result" method="post" style="text-align:center;" onsubmit="return writeCheck();">
            제목 : <input type="text" name="ntitle"><br>
            내용 : <br> <textarea rows="30" cols="100" name = "ncontent"></textarea> <br>
            <input type = "submit" value = "공지사항 작성" />
        </form>
    </div>
</div>
<script type="text/javascript">
    function writeCheck(){
        return confirm("작성하시겠습니까?");
    }
</script>

</body>
</html>
    