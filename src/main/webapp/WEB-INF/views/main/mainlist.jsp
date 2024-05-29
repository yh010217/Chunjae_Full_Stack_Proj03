<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script defer src="/resources/js/main/mainlist.js"></script>
</head>
<body>
<div class="wrap">
    <article id="article_1">
        <div class="main_01">
            <label>
                <input class="main_search" id="main_search" name="main_search" type="text" placeholder="검색어를 입력하세요.">
            </label>
            <img src="/resources/image/main/search.png" alt="search">
            <div id="result_search"></div>
        </div>

        <%-- 이벤트 배너 --%>

        <div class="main_02">
            <picture>
                <source media="(min-width: 1800px)" srcset="/resources/image/main/event2.png">
                <img src="/resources/image/main/event.png" alt="People">
            </picture>

            <div class="main_self">
                <div class="main_self_div1">
                    <p>환영합니다</p>
                    <c:choose>
                        <c:when test="${sessionScope.id == 'admin'}">
                            <a href="/admin/main" class="login_mess">관리자님 하이</a>
                        </c:when>
                        <c:when test="${sessionScope.id == null}">
                            <a href="/login" class="login_mess">로그인이 필요해요.</a>
                        </c:when>
                        <c:when test="${sessionScope.id != null}">
                            <a href="#" class="login_mess"> 수강중인 강의 들으러 가기</a>
                        </c:when>
                        <c:otherwise>
                            <c:out value="무언가가 잘못되었어요"/>
                        </c:otherwise>
                    </c:choose>

                </div>
                <div class="main_self_div2">
                    <c:choose>
                        <c:when test="${sessionScope.id == null}">
                            <%-- session 없다는 뜻 --%>
                            <div onclick="alert('로그인하시면 이용할 수 있습니다.')">
                                <div class="board_1">
                                    <a href="/index/login" class="main_self_box">찜확인</a>
                                    <a href="/index/login" class="main_self_mon">고객센터</a>
                                </div>
                                <a href="/index/login" class="main_self_mypage">마이페이지 바로 가기</a>
                                <a href="/index/login" class="main_self_myclass">내 강의 확인하기</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <%-- session 있다는 뜻 --%>
                            <div class="board_1">
                                <a href="#" class="main_self_box">찜확인</a>
                                <a href="#" class="main_self_mon">고객센터</a>
                            </div>
                            <a href="/index/mypage" class="main_self_mypage">마이페이지 바로 가기</a>
                            <a href="#" class="main_self_myclass">내 강의 확인하기</a>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
    </article>


        <article id="main_03">
            <div class="lec_title">
                <h1>대표강사진</h1>
                <a class="morelec" href="/index/teacher">더보기</a>
            </div>
            <div class="tea_title">
                <c:forEach var="item" items="${popTea}">
                    <ul>
                        <li class="tea_li1"><img src="/getImg/${item.tprofile}" alt="${item.tprofile}"></li>
                        <li class="tea_li2">${item.tsubject}</li>
                        <li class="tea_li3">${item.name}선생님</li>
                        <li class="tea_li4">${item.tintro}</li>
                    </ul>
                </c:forEach>
            </div>
        </article>

        <article id="main_04">
            <div class="bestLecture">
                <div class="lec_title">
                    <h1>BEST 강의</h1>
                    <a class="morelec" href="/index/lecturelist">더보기</a>
                </div>
                <div class="lecture_list more">
                    <c:forEach var="item" items="${popList}">
                        <ul>
                            <li class="li_1"><img class="lecList_img" src="/getImage/${item.lprofile}" alt="${item.lprofile}"></li>
                            <li class="li_2">${item.lgrade}학년</li>
                            <li class="li_3">${item.ltitle}</li>
                            <li class="li_4">${item.lprice}</li>
                        </ul>
                    </c:forEach>
                </div>
            </div>
            <div class="newLecture">
                <div class="lec_title">
                    <h1>신규 강의</h1>
                    <a class="morelec" href="/index/comingsoon">더보기</a>
                </div>
                <div class="lecture_list">
                    <c:forEach var="item" items="${newList}">
                        <ul>
                            <li class="li_1"><img class="lecList_img" src="/getImage/${item.lprofile}" alt="${item.lprofile}"></li>
                            <li class="li_2">${item.lgrade}학년</li>
                            <li class="li_3">${item.ltitle}</li>
                            <li class="li_4">${item.lprice}</li>
                        </ul>
                    </c:forEach>
                </div>
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
    </div>
</body>
</html>
