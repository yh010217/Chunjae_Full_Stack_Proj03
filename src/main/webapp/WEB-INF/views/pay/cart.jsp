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
</head>
<body>


<div id="wrap">
    <%-- 왼쪽 사이드바  --%>
    <div id="sidebar_container">
        <div id="sidebar">
            <ul>
                <li class="side_title">안녕하세요!<br> 님</li>
            </ul>
            <ul class="menu">
                <li class="menu_title"><a href="/index/mypage">내 강의 보기</a></li>
                <li class="menu_title"><a href="/index/mypage/paid">거래 내역</a></li>
                <li class="menu_title"><a href="/index/mypage/cart">장바구니</a></li>
                <li class="menu_title"><a href="#">회원 정보 수정</a></li>
                <li class="menu_title"><a href="#">고객센터</a></li>
                <li class="menu_title"><a href="#">로그아웃</a></li>
            </ul>
        </div>
    </div>
    <%-- content 영역  --%>
    <div id="content">
        <span id="totalIs">총 가격 : </span>
        <div id="total_price"></div>

        <form method="post" action="/cart_buy">
            <button type="button" id="multi_button">선택 항목 결제</button>
            <c:forEach items="${hmlist}" var="item" varStatus="status">
                <div class="item_box">
                    <input type="checkbox" id="${item.lid}"
                           value="${item.lid}_${item.lprice}"
                           name="lid" onclick="total_change('${item.lid}')">
                    <c:out value="${item.lid}"/><br>
                    <c:out value="${item.lprice}"/><br>
                    <c:out value="${item.name}"/><br>
                    <c:out value="${status.index}"/><br><br><br>
                </div>
            </c:forEach>

        </form>
    </div>

</div>

<script>
    let str_list_size = '${hmlist.size()}';
    let list_size = parseInt(str_list_size);
    let total_change = function (lid) {
        document.getElementById(lid).classList.toggle('cart_checked');

        let cart_arr = document.querySelectorAll('.cart_checked');
        let sum = 0;
        for(let i = 0 ; i < cart_arr.length ; i++){
            sum += parseInt(cart_arr[i].value.split('_')[1]);
        }
        document.getElementById('total_price').innerHTML = sum;
    }
</script>

<script src="/resources/js/pay/cart.js"></script>
</body>
</html>
