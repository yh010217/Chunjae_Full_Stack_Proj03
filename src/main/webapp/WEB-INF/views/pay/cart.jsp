<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: db400tea
  Date: 2024-05-23
  Time: 오후 3:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/pay/cart.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage_template2.css">
</head>
<body>


<div id="wrap">
    <%-- 왼쪽 사이드바  --%>

    <div id="sidebar_margin"></div>
    <div id="sidebar_container">
        <div id="sidebar">
            <ul>
                <li class="side_title">안녕하세요!<br> 님</li>
            </ul>
            <ul class="menu">
                <li class="menu_title"><a href="/index/mypage">내 강의 보기</a></li>
                <li class="menu_title"><a href="/index/mypage/paid">거래 내역</a></li>
                <li class="menu_title"><a href="/index/mypage/cart">장바구니</a></li>
                <li class="menu_title"><a href="/index/mypage/modify">회원 정보 수정</a></li>
                <li class="menu_title"><a href="/index/mypage/onelist">고객센터</a></li>
                <li class="menu_title"><a href="/logout">로그아웃</a></li>
            </ul>
        </div>
    </div>


    <%-- content 영역  --%>
    <div id="content">
        <h3 id="content_title">장바구니</h3>

        <div id="top_div">
            <div id="total_div">
                <span id="totalIs">총 가격 : </span><span id="total_price">0 원</span>
            </div>
            <div id="top_button">
                <button type="button" id="selectAll">전체 선택</button>
                <button type="button" id="multi_button">선택 항목 결제</button>
            </div>
        </div>
        <div id="all_box">
            <c:forEach items="${hmlist}" var="item" varStatus="status">

                <div class="full_box">
                    <div class="check_area">
                        <input type="checkbox" id="${item.lid}"
                               value="${item.lid}_${item.lprice}"
                               name="lid" onclick="total_change('${item.lid}')">
                        <label for="${item.lid}">선택하기</label>
                    </div>
                    <div class="item_box">
                        <div class="teacher_title">
                            <c:out value="[${item.tsubject}] ${item.name} 선생님"/><br>
                            <a href="/index/lecdetail/${item.lid}">
                                <c:out value="${item.ltitle}"/>
                            </a>
                        </div>
                        <div class="period">
                            <c:out value="수강 기간 : ${item.lperiod} 일"/>
                        </div>
                        <div class="price">
                            <c:out value="가격 : ${item.lprice} 원"/><br>
                        </div>
                        <div class="item_right">
                            <a href="/pay/purchase_one?lid=${item.lid}" class="purchase_one">즉시 구매하기</a>
                            <br><br>
                            <a href="/pay/delete_fav/${item.lid}" class="delete">삭제하기</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</div>

<script src="/resources/js/pay/cart.js"></script>
</body>
</html>
