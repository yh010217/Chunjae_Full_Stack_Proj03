<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
</head>
<body>
<div class="usertable">
    <div class="tr">
        <div class="th">회원번호</div>
        <div class="th">이름</div>
        <div class="th">닉네임</div>
        <div class="th">아이디</div>
        <div class="th">이메일</div>
        <div class="th">회원계정삭제</div>
    </div>
    <div class="tr">
        <c:forEach var="item" items="${userDTOList}">
            <div class="td"><a href="/detail/${item.uid}"><c:out value="${item.uid}"/></a></div>
            <div class="td">${item.name}</div>
            <div class="td">${item.nickname}</div>
            <div class="td">${item.id}</div>
            <div class="td">${item.email}</div>
        </c:forEach>
    </div>
</div> <!--회원리스트끝 -->
<form method="get" action="/admin/user">
    <select name="search">
        <option value="uid">회원번호</option>
        <option value="name">이름</option>
        <option value="id">아이디</option>
    </select>
    <input type="text" name="searchtxt">
    <button type="submit">검색</button>
</form>
<c:if test="${startblock>1}">
    <a href="/admin/user/${startblock-1}?search=${search}&searchtxt=${searchtxt}">이전</a>
</c:if>
<c:forEach var="index" begin="${startblock}" end="${endblock}">
    <c:choose>
        <c:when test="${currpage==index}">
            ${index}
        </c:when>
        <c:otherwise>
            <a href="/admin/user/${index}?serach">${index}</a>
        </c:otherwise>
    </c:choose>
</c:forEach>
<c:if test="${endblock<totalpage}">
    <a href="/admin/user/${endblock+1}?serach=&${search}&searchtxt=${searchtxt}">다음</a>
</c:if>


</body>
</html>
    