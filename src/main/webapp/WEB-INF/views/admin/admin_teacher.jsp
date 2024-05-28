<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/admin/template.css">
    <link rel="stylesheet" href="/resources/css/admin/teacher.css">
    <link rel="icon" href="/resources/image/icon_love.png">
    <title>해법학원 | 강사관리</title></head>
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
            <a href="/admin/register">강사 등록</a>
        <div class="teacher">
            <h3>강사 관리</h3>
            <ul class="teacher_title">
                <li>프로필 사진</li>
                <li>번호</li>
                <li>과목</li>
                <li>이름</li>
                <li>삭제 버튼</li>
            </ul>
            <ul class="teacher_list">
                <c:forEach var="item" items="${list}">
                    <li class="teacher_block">
                        <img class="teacher_img" src="/getImg/${item.tprofile}" alt="${item.tprofile}">
                        <p class="t_1"><c:out value="${item.tid}"/> </p>
                        <p class="t_2"><c:out value="${item.tsubject}"/></p>
                        <p class="t_3"><c:out value="${item.name}"/></p>
                        <button class="delete_btn" onclick="deleteTeacher('${item.tid}')">삭제</button>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

</body>
<script>

        function deleteTeacher(tid) {
        if(confirm('정말 삭제하시겠습니까?')) {
        fetch('/admin/deleteTeacher/' + tid, {
        method: 'DELETE'
    })
        .then(response => response.json())
        .then(data => {
        if(data.success) {
        alert('삭제되었습니다.');
        window.location.reload(); // 페이지 새로고침으로 목록 갱신
    } else {
        alert('삭제 실패. 다시 시도해주세요.');
    }
    })
        .catch(error => console.error('Error:', error));
    }
    }

</script>
</html>
