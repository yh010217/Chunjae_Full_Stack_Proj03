<%--
  Created by IntelliJ IDEA.
  User: FULL8-008
  Date: 2024-05-23
  Time: 오후 5:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/teacher/list.css">
</head>
<body>
<article id="teaList">
    <div id="container"><h1 class="style-3">해영 대표 강사진</h1></div>
    <div class="tea_list">
        <ul>
            <c:forEach var="item" items="${list}">
                <li class="li1" style="background-image: url('/getImg/${item.tprofile}')">
                    <p class="teaList_p1">${item.tsubject}</p>
                    <a class="teaList_a" href="/index/teacher/${item.tid}"> ${item.name} 선생님 </a> <br>
                    <span class="teaList_span">${item.tintro}</span>
                </li>
            </c:forEach>
            <%-- 필요한 것 : 사진, 과목, 선생 이름, 소개--%>

        </ul>
    </div>
</article>

</body>
</html>
