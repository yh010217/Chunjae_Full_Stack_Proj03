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
    <style>
        a:hover{
            color: gray;
        }
    </style>
</head>
<body>
<a href="/index/lectureinsert">추가하기</a>

<c:forEach var="item" items="${list}">
    <ul>
        <li>
            ${item.lid}
                ${item.lgrade}학년
                <a href="/index/lecdetail/${item.lid}"> <${item.ltitle}> </a>
                ${item.lprice}
        </li>
    </ul>
</c:forEach>


</body>
</html>
