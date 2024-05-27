<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객지원관리</title>
    <link rel="stylesheet" href="/resources/css/admin/template.css">
    <script defer src="/resources/js/admin/adminins.js"></script>
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
        <h1>공지사항</h1>
        <a href="/index/onelist">일대일문의</a>
        <div class="table">
            <button type="button" id="append">글쓰기</button>
            <div class="tr">
                <div class="th">글번호</div>
                <div class="th">제목</div>
                <div class="th">글내용</div>
                <div class="th">등록날짜</div>
            </div>
            <div class="tr">
                <c:forEach var="item" items="${noticelist}">
                    <div class="td">
                        <a href="/admin/noticelist/detail/${item.nno}"><c:out value="${item.nno}"/></a>
                        <c:out value="${item.ntitle}"/>
                        <c:out value="${item.ncontent}"/>
                        <c:out value="${item.ndate}"/>
                    </div>
                </c:forEach>
            </div>
        </div>
        <form method="get" action="/admin/noticelist">
            <select name="search">
                <option value="nno">글번호</option>
                <option value="ntitle">제목</option>
                <option value="ncontent">내용</option>
            </select>
            <input type="text" name="searchtxt">
            <button type="submit">검색</button>
        </form>
        <c:if test="${startblock>1}">
            <a href="/admin/noticelist/${startblock-1}?search=${search}&searchtxt=${searchtxt}">이전</a>
        </c:if>
        <c:forEach var="index" begin="${startblock}" end="${endblock}">
            <c:choose>
                <c:when test="${currpage==index}">
                    ${index}
                </c:when>
                <c:otherwise>
                    <a href="/admin/noticelist/${index}?serach">${index}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${endblock<totalpage}">
            <a href="/admin/noticelist/${endblock+1}?serach=&${search}&searchtxt=${searchtxt}">다음</a>
        </c:if>



    </div>
</div>
</body>
</html>
