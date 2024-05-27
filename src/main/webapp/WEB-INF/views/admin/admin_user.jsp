<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원관리</title>
    <link rel="stylesheet" href="/resources/css/admin/template.css">
    <link rel="stylesheet" href="/resources/css/admin/user.css">
</head>
<body>

<div id="container">

    <aside id="side_bar">
        <div id="side_bar_header">
            <img class="header_img" src="/resources/image/admin/main/HB-logo.png">
            <a href="#" class="header_title">해법학원</a>
        </div>
        <div id="side_bar_menus">
            <a href="/admin/user" class="side_bar_menu">
                <img class="side_bar_menu_image" src="/resources/image/admin/main/user-gray.png" alt="회원 관리">
                <span class="side_bar_menu_name">회원 관리</span>
            </a>
            <a href="#" class="side_bar_menu">
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
        <div class="usertable">
            <div class="tr">
                <div class="th">회원번호</div>
                <div class="th">이름</div>
                <div class="th">닉네임</div>
                <div class="th">아이디</div>
                <div class="th">이메일</div>
                <div class="th">회원계정삭제</div>
            </div>
            <div class="tr">
                <c:forEach var="item" items="${userDTOList}">
                    <div class="td">
                        <a href="/admin/user/modify/${item.uid}"><c:out value="${item.uid}"/></a>
                        <c:out value="${item.name}"/>
                        <c:out value="${item.nickname}"/>
                        <c:out value="${item.id}"/>
                        <c:out value="${item.email}"/>
                        <a href="/admin/user/delete/${item.uid}">삭제하기</a>
                    </div>
                </c:forEach>
            </div>
        </div> <!--회원리스트끝 -->
        <form method="get" action="/admin/user">
            <select name="search">
                <option value="uid">회원번호</option>
                <option value="name">이름</option>
                <option value="id">아이디</option>
            </select>
            <input type="text" name="searchtxt">
            <button type="submit">검색</button>
        </form>
        <c:if test="${startblock>1}">
            <a href="/admin/user/${startblock-1}?search=${search}&searchtxt=${searchtxt}">이전</a>
        </c:if>
        <c:forEach var="index" begin="${startblock}" end="${endblock}">
            <c:choose>
                <c:when test="${currpage==index}">
                    ${index}
                </c:when>
                <c:otherwise>
                    <a href="/admin/user/${index}?serach">${index}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${endblock<totalpage}">
            <a href="/admin/user/${endblock+1}?serach=&${search}&searchtxt=${searchtxt}">다음</a>
        </c:if>


    </div><!--content_container-->


</div><!--container-->



</body>
</html>
    