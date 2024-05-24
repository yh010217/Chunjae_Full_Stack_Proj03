<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>마이페이지</title>
    <link rel="stylesheet" href="/resources/css/mypage/mypage_template.css">
    <link rel="stylesheet" href="/resources/css/mypage/paid.css">
</head>
<body>
<div id="wrap">
    <%-- 왼쪽 사이드바  --%>
    <div id="sidebar">
        <ul>
            <li class="side_title">안녕하세요!<br><c:out value="${nickname}"/> 님</li>
        </ul>
        <ul class="menu">
            <li class="menu_title"><a href="/index/mypage">내 강의 보기</a></li>
            <li class="menu_title"><a href="/index/mypage/paid">거래 내역</a></li>
            <li class="menu_title"><a href="/index/mypage/cart">장바구니</a></li>
            <li class="menu_title"><a href="/index/mypage/modify">회원 정보 수정</a></li>
            <li class="menu_title"><a href="#">고객센터</a></li>
            <li class="menu_title"><a href="/logout">로그아웃</a></li>
        </ul>
    </div>
    <%-- content 영역  --%>
    <div id="content">
        <div id="bill_box">
            <section id="bill_title">
                <h3><a href="/index/mypage/paid">결제내역</a></h3>
                <h3><a href="/index/mypage/refund">환불 내역</a></h3>
            </section>
            <section id="bill_content">
                <c:forEach var="item" items="${paidList}">

                    <c:if test="${item.pistatus eq 'refund'}">

                        <ul>
                            <li>환불 완료</li>
                            <li><c:out value="${item.ptime}"/></li>
                            <li>[<c:out value="${item.tsubject}"/>]<c:out value="${item.name}"/> 선생님</li>
                            <li>수강 기간 : <c:out value="${item.startDate}"/> ~ <c:out value="${item.endDate}"/></li>
                            <li>결제 금액 : <c:out value="${item.lprice}"/></li>
                            <li><a href="#">환불 완료</a></li>
                        </ul>
                    </c:if>
                </c:forEach>
            </section>

        </div>
    </div>
</div>
</body>
</html>
