<%--
  Created by IntelliJ IDEA.
  User: FULL8-008
  Date: 2024-05-23
  Time: 오전 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/video/video.css">
    <script src="/resources/js/video/video.js"></script>
</head>
<body>
    <article id="videoarticle">
        <div class="videolist">
            <a href="/index/video/${title.lid}" id="title"> ${title.ltitle} </a> <%-- 타이틀 제목 --%>
            <ul>
                <%-- 동영상 리스트 출력 --%>
                    <c:forEach var="i" begin="1" end="${title.lcount}" >
                        <c:set var="currentVideo" value="${list[i - 1]}" />
                        <li class="video"> <a href="#" onclick="loadVideo(${currentVideo.lid}, '${currentVideo.vlink}')"> ${currentVideo.vtitle} </a></li>

                    </c:forEach>
            </ul>
        </div>
        <div class="videoresult">
            <%-- 동영상 출력 --%>
            <video controls width="100%" id="streaming">

            </video>
        </div>
    </article>

</body>
</html>
