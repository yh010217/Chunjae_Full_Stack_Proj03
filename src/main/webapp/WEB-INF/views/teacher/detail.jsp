<%--
  Created by IntelliJ IDEA.
  User: FULL8-008
  Date: 2024-05-27
  Time: 오후 2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/teacher/detail.css">
</head>
<body>
    <c:set var="item" value="${list}"/>

    <article id="tea_detail">

        <c:choose>
            <c:when test="${item.tsubject == '국어'}">
                <div class="tea_top top1">
                    <div class="t_intro">
                        <p class="tea_name"> <span> ${item.tsubject} ${item.name} </span> 선생님 </p><br>
                        <p class="tea_intro"> ${item.tintro} </p>
                        <p class="tea_intro"> <span> 개설 강좌 </span> : ${total}개</p>
                    </div>
                    <img src="/getImg/${item.tprofile}" alt="${item.tprofile}">
                </div>
            </c:when>
            <c:when test="${item.tsubject == '영어'}">
                <div class="tea_top top2">
                    <div class="t_intro">
                        <p class="tea_name"> <span> ${item.tsubject} ${item.name} </span> 선생님 </p><br>
                        <p class="tea_intro"> ${item.tintro} </p>
                        <p class="tea_intro"> <span> 개설 강좌 </span> : ${total}개</p>
                    </div>

                    영어는 나를 따르라ㅏㅏㅏ
                    하... 사진을 뭐 정해야 css를 하든 말든 어쩌고
                    ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
                    <img src="/getImg/${item.tprofile}" alt="${item.tprofile}">
                </div>
            </c:when>
            <c:when test="${item.tsubject == '수학'}">
                <div class="tea_top top3">
                    <div class="t_intro">
                        <p class="tea_name"> <span> ${item.tsubject} ${item.name} </span> 선생님 </p><br>
                        <p class="tea_intro"> ${item.tintro} </p>
                        <p class="tea_intro"> <span> 개설 강좌 </span> : ${total}개</p>
                    </div>
                    <img src="/getImg/${item.tprofile}" alt="${item.tprofile}">
                </div>
            </c:when>
            <c:when test="${item.tsubject == '기타'}">
                <div class="tea_top top4">
                    <div class="t_intro">
                        <p class="tea_name"> <span> ${item.tsubject} ${item.name} </span> 선생님 </p><br>
                        <p class="tea_intro"> ${item.tintro} </p>
                        <p class="tea_intro"> <span> 개설 강좌 </span> : ${total}개</p>
                    </div>
                    <img src="/getImg/${item.tprofile}" alt="${item.tprofile}">
                </div>
            </c:when>
        </c:choose>



        <div class="border_bottom">
            <h2 > 강좌 보기 </h2>
            <a href="/index/lecInsert/${item.tid}">추가하기</a>
            <%--<c:if test="${sessionScope.id == 'admin' || sessionScope.id == tid}">
                <a href="/index/lecInsert/${item.tid}">추가하기</a>
            </c:if>--%>
        </div>
        <div class="tea_lecList">
            <ul>
                <c:forEach var="item" items="${lec}">
                    <li>
                        <c:choose>
                            <c:when test="${item.lgrade == 1}">
                                <p class="lecList_li1 one"> 중${item.lgrade}</p>
                            </c:when>
                            <c:when test="${item.lgrade == 2}">
                                <p class="lecList_li1 two"> 중${item.lgrade}</p>
                            </c:when>
                            <c:when test="${item.lgrade == 3}">
                                <p class="lecList_li1 three"> 중${item.lgrade}</p>
                            </c:when>
                            <c:otherwise>
                                <p class="lecList_li1 fiv"> 학년없음</p>
                            </c:otherwise>
                        </c:choose>
                        <div class="lecList_li2">
                            <a href="/index/lecdetail/${item.lid}"> <p>${item.ltitle}</p> </a>
                            <p class="book">[교재]${item.lbook}</p>
                        </div>
                        <p class="lecList_li3">${item.lprice}원</p>
                    </li>
                </c:forEach>
            </ul>
        </div>

    </article>



</body>
</html>
