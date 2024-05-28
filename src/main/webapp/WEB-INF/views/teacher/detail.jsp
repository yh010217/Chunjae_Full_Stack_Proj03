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
    <div class="tea_top top${item.tsubject == '국어' ? 1 : item.tsubject == '영어' ? 2 : item.tsubject == '수학' ? 3 : 4}" style="background-image: url('/getImg/${item.tprofile}')">
        <div class="t_intro">
            <p class="tea_name"> <span>${item.tsubject} ${item.name}</span> 선생님 </p><br>
            <p class="tea_intro">${item.tintro}</p>
            <p class="tea_intro"><span>개설 강좌</span>: ${total}개</p>
        </div>
        <div class="t_lec">
            <div class="border_bottom">
                <h2>강의 보기</h2>
                <c:if test="${sessionScope.id == 'admin'}"> <%-- 관리자만 추가 가능 --%>
                    <a href="/index/lecInsert/${item.tid}">추가하기</a>
                </c:if>
            </div>

            <%-- 강의 리스트 --%>
            <div class="tea_lecList">
                <ul>
                    <c:forEach var="lecItem" items="${lecList}">
                        <li>
                            <c:choose>
                                <c:when test="${lecItem.lgrade >= 1 && lecItem.lgrade <= 3}">
                                    <p class="lecList_li1 one">${lecItem.lgrade}학년</p>
                                </c:when>
                                <c:otherwise>
                                    <p class="lecList_li1 fiv">학년없음</p>
                                </c:otherwise>
                            </c:choose>
                            <div class="lecList_li2">
                                <a href="/index/lecdetail/${lecItem.lid}"><p>${lecItem.ltitle}</p></a>
                                <p class="book">[교재]${lecItem.lbook}</p>
                            </div>
                            <p class="lecList_li3">${lecItem.lprice}원</p>
                        </li>
                    </c:forEach>
                </ul>

                <%-- 페이징 처리하기 --%>
                <div class="page">
                    <c:if test="${startblock>1}">
                        <a class="page_text" href="/index/teacher/${item.tid}?page=${startblock-1}">이전</a>
                    </c:if>
                    <c:forEach var="index" begin="${startblock}" end="${endblock}">
                        <c:choose>
                            <c:when test="${currpage == index}">
                                <span class="page_text now"> ${index} </span>
                            </c:when>
                            <c:otherwise>
                                <a class="page_text other" class="font" href="/index/teacher/${item.tid}?page=${index}">${index}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${endblock<totalpage}">
                        <a class="page_text" href="/index/teacher/${item.tid}?page=${endblock+1}">다음</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</article>
</body>
</html>
