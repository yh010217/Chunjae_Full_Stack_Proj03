<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-20
  Time: 오후 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main/mainlist.css">
</head>
<body>
    <article id="article_1">
        <div class="main_01">
            <label>
                <input class="main_search" id="main_search" name="main_search" type="text" placeholder="검색어를 입력하세요.">
            </label>
            <img src="/resources/image/main/search.png" alt="search">
        </div>

        <%-- 이벤트 배너 --%>

        <div class="main_02">
            <img src="/resources/image/main/event.png" alt="이벤트 배너"/>

            <div class="main_self">
                <div class="main_self_div1">
                    <p>환영합니다</p>
                    <a href="/login" class="login_mess">로그인이 필요해요.</a>
                </div>
                <div class="main_self_div2">
                    <div class="board_1">
                        <a href="#" class="main_self_box">찜확인</a>
                        <a href="#" class="main_self_mon">고객센터</a>
                    </div>
                    <a href="/index/mypage" class="main_self_mypage">마이페이지 바로 가기</a>
                    <a href="#" class="main_self_myclass">내 강의 확인하기</a>
                </div>
            </div>
        </div>
    </article>

    <article id="main_03">
        <h1>대표강사진</h1>
        <span>더보기</span>
    </article>

    <article id="main_04">
        <div>
            <h1>BEST 강의</h1>
            <a href="/index/lecturelist">더 많은 강의 보러 가기</a>
        </div>
        <div>
            <h1>신규 강의</h1>
            <a href="index/lecturelist">더 많은 강의 보러 가기</a>
        </div>
    </article>

    <article id="main_05">
        <div class="main_05_1">
            <ul>
                <li><img src="/resources/image/main/call.png" alt="전화"></li>
                <li><h3>고객센터</h3></li>
                <li><h4>1566-1566</h4></li>
                <li><p>평일 09:00 ~ 20:00 (주말, 공휴일 x)</p></li>
            </ul>
        </div>

        <div class="main_05_2">
            <ul>
                <li><h4>공식 SNS</h4></li>
                <li><img src="/resources/image/main/instagram.png" alt="인스타"></li>
                <li><img src="/resources/image/main/facebook.png" alt="페북"></li>
                <li><img src="/resources/image/main/kakao.png" alt="카톡" width="45px"></li>
                <li><img src="/resources/image/main/youtube.png" alt="유튜브"></li>
            </ul>
        </div>
    </article>
</body>
</html>
