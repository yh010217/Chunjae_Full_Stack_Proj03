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
</head>
<body>
    <c:set var="item" value="${list}"/>
    ${item.name}
    ${item.tintro}
    ${item.tsubject}


    <a href="/index/lecInsert/${item.tid}">추가하기</a>


</body>
</html>
