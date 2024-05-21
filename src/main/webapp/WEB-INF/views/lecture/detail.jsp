<%--
  Created by IntelliJ IDEA.
  User: FULL8-008
  Date: 2024-05-21
  Time: 오후 1:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:set var="item" value="${dto}"/>
    <ul>
        <li>이름 : ${item.ltitle}</li>
        <li>책 : ${item.lbook}</li>
        <li>학년 : ${item.lgrade}</li>
        <li>강의 소개 : ${item.lintro}</li>
        <li>몇강 예정? : ${item.lcount}</li>
        <li>얼마나 들을 수 있음? : ${item.lperiod}</li>
        <li>가격 : ${item.lprice}원</li>
    </ul>


</body>
</html>
