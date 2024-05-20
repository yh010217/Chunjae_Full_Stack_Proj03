<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-20
  Time: 오후 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
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
    <c:set var="contentpage" value="${param.page}"/>
    <jsp:include page="top.jsp"/>

    <section>
        <c:choose>
            <c:when test="${empty contentpage || contentpage == ''}">
                <jsp:include page="mainlist.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${contentpage}"/>
            </c:otherwise>
        </c:choose>
    </section>
    <jsp:include page="footer.jsp"/>
</body>
</html>
