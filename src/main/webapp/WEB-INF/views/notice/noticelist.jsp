<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="/resources/css/notice/notice.css">
</head>
<body>
<div id="wrap">

    <h1>공지사항</h1>
    <!-- 검색 -->
    <form method="get" action="/index/noticelist" class="searchform">
        <select name="search">
            <option value="nno">글번호</option>
            <option value="ntitle">제목</option>
            <option value="ncontent">내용</option>
        </select>
        <input type="text" name="searchtxt" class="searchtxt">
        <button type="submit" class="search-btn">검색</button>
    </form>

<div class="table">

    <div class="tr tr1">
        <div class="td">글번호</div>
        <div class="td">제목</div>
        <div class="td">등록날짜</div>

    </div>

        <c:forEach var="item" items="${noticelist}">
          <div class="tr">
            <div class="td"><a href="/index/notdetail/${item.nno}"><c:out value="${item.nno}"/></a></div>
            <div class="td"><c:out value="${item.ntitle}"/></div>
            <div class="td"> <c:out value="${item.ndate}"/></div>
           </div>
        </c:forEach>

</div>


    <c:if test="${startblock>1}">
        <a href="/index/noticelist/${startblock-1}?search=${search}&searchtxt=${searchtxt}">이전</a>
    </c:if>
    <c:forEach var="index" begin="${startblock}" end="${endblock}">
        <c:choose>
            <c:when test="${currpage==index}">
                ${index}
            </c:when>
            <c:otherwise>
                <a href="/index/noticelist/${index}?serach">${index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${endblock<totalpage}">
        <a href="/index/noticelist/${endblock+1}?serach=&${search}&searchtxt=${searchtxt}">다음</a>
    </c:if>




</div>
</body>
</html>
    