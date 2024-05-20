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
    <style>

        #article_1 {
        }

        .main_01 {
            width: 60%;
            position: relative;
            margin: 20px auto;
        }
        .main_search {
            width: 100%;
            border: 1px solid #bbb;
            border-radius: 10px;
            padding: 17px 40px;
            font-size: 15px;
            background-color: #f5f5f5;
            color: #000;
        }

        .main_01 > img {
            position: absolute;
            top: 13px;
            left: 11px;
        }

    </style>
</head>
<body>

    <article id="article_1">
        <div class="main_01">
            <label>
                <input class="main_search" id="main_search" name="main_search" type="text" placeholder="검색어를 입력하세요.">
            </label>
            <img src="resources/image/main/search.png" alt="search">
        </div>

        메~ 인~ 화~ 면
        <%-- 이벤트 배너 --%>
        <%--<div class="main_img">
            <img src="resources/image/main/event.png" alt="이벤트 배너"/>
        </div>

        <div class="main_self">
            <p>환영합니다</p>
            <a>로그인이 필요해요.</a>

            <span class="main_self_box">장바구니</span>
            <span class="main_self_mon">고객센터</span>
            <span class="main_self_mypage">마이페이지 바로 가기</span>
            <span class="main_self_myclass">내 강의 확인하기</span>--%>
        </div>
    </article>
    <%--<article>
        <div>
            <img src="resources/image/main/call.png" alt="전화">
            <h3>고객센터</h3>
            <h4>1566-1566</h4>
            <p>평일 09:00 ~ 20:00 (주말, 공휴일 x)</p>
        </div>

        <div>
            <h3>공식 SNS</h3>
            <img src="resources/image/main/instagram.png" alt="인스타">
            <img src="resources/image/main/facebook.png" alt="페북">
            <img src="resources/image/main/kakao.png" alt="카톡">
            <img src="resources/image/main/youtube.png" alt="유튜브">
        </div>
    </article>--%>
</body>
</html>
