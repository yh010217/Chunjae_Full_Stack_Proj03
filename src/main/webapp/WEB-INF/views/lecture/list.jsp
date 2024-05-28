<%--
  Created by IntelliJ IDEA.
  User: FULL8-008
  Date: 2024-05-21
  Time: 오전 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/lecture/list.css">
</head>
<body>
<article id="lecList">
    <%--<a href="/index/lectureinsert">추가하기</a>--%>
    <div class="lecList_top">
        <%-- 상단부 왼쪽--%>
        <div class="lecList_search">
            <h1>해영의 강의를 만나보세요.</h1>
            <div class="search">
                <label>
                    <input class="insert_search" id="insert_search" name="insert_search" type="text" placeholder="검색어를 입력하세요.">
                </label>
                <img src="/resources/image/main/search.png" alt="search">
            </div>
        </div>

        <%-- 상단부 오른쪽 --%>
        <div class="lecList_free">
            <h2>무료 강의</h2>
            <ul>
            <c:forEach var="freelist" items="${free}">
                <div class="freeList_li">
                    <li class="gradeli">${freelist.lgrade}학년</li>
                    <li><a href="/index/lecdetail/${freelist.lid}"> ${freelist.ltitle} </a></li>
                </div>
            </c:forEach>
            </ul>
        </div>
    </div>
    <%-- 전체 강의 리스트--%>
    <div class="all_lecture">
        <h2>전체 강의</h2>
        <ul>
        <c:forEach var="item" items="${list}">
            <li>
                <img class="lecList_img" src="/getImage/${item.lprofile}" alt="${item.lprofile}">
                <p class="li_2"> ${item.lgrade}학년 </p>
                <a class="li_3" href="/index/lecdetail/${item.lid}"> ${item.ltitle} </a>
                <p class="li_4"> ${item.lprice}원</p>
            </li>
        </c:forEach>
        </ul>
    </div>

</article>


</body>
</html>
