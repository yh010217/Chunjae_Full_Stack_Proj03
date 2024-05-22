<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="/resources/image/icon_love.png">
    <title>해법학원</title>
    <style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-size: 1.2rem;
            font-weight: 400;
            font-style: normal;
        }
        * {
            font-family: 'Pretendard-Regular', 'sans-serif';
            color: black;
            text-decoration: none;
            list-style: none;
        }
    </style>
</head>
<body>
<c:set var="page" value="${page}"/>
<jsp:include page="main/top.jsp"/>

<section>
    <c:choose>
        <c:when test="${page ==null || empty page || page == ''}">
            <jsp:include page="main/mainlist.jsp"/>
        </c:when>
        <c:otherwise>
            <jsp:include page="/${page}/${lid}"/>
        </c:otherwise>
    </c:choose>
</section>
<jsp:include page="main/footer.jsp"/>
</body>
</html>