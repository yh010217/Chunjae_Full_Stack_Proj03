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
    <%--<script src="/resources/js/video/video.js"></script>--%>
</head>
<body>
    <article id="videoarticle">
        <div class="videolist">
            <a href="/index/video/${title.lid}" id="title"> ${title.ltitle} </a> <%-- 타이틀 제목 --%>
            <ul>
                <%-- 동영상 리스트 출력 --%>
                    <c:forEach var="i" begin="1" end="${title.lcount}" >
                        <c:set var="currentVideo" value="${list[i - 1]}" />
                        <li class="video${i}"> <a href="#" onclick="loadVideo(${currentVideo.lid})"> ${currentVideo.vtitle} </a> </li>
                    </c:forEach>
            </ul>
        </div>
        <div class="videoresult">
            <%-- 동영상 출력 --%>
            <video controls width="100%" id="streaming">
                <%--<source src="/resources/image/main/aaaa.mp4" type="video/webm">--%>
            </video>
        </div>
    </article>

    <script>
        function loadVideo(videoId) {
            fetch('/video/' + videoId, {
                method: 'GET',
                headers: {
                    'Accept': 'application/text'
                }
            }).then(response => {
                if (!response.ok) {
                    throw new Error('로드 실패');
                } else {
                    return response.text();
                }
            }).then(data => {
                console.log(data);

                if (data) {
                    let source = document.createElement('source');
                    source.src = "/resources/image/main/aaaa.mp4"; // 동영상 업로드 경로로 바꿔야 함, 거의다 햇ㄷ r... 아마도
                    source.type = "video/webm";
                    document.getElementById('streaming').innerHTML = ''; // 기존 동영상 삭제
                    document.getElementById('streaming').appendChild(source);
                    console.log(source);
                } else {
                    console.log('no 작동');
                }
                console.log("작동이 되는 건가");
            }).catch(error => console.log(error))
                .finally(() => console.log('finally'));
        }

    </script>

</body>
</html>
