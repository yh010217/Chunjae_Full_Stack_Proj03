<%--
  Created by IntelliJ IDEA.
  User: FULL8-008
  Date: 2024-05-21
  Time: 오전 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script defer src="/resources/js/lecture/insert.js"></script>
</head>
<body>
    <form method="post" action="/insertresult" enctype="multipart/form-data">
        <ul>
            <li>
                <div class="thumbnail" id="thumbnail"><img src="" alt=""></div>
            </li>
            <li>
                <label>썸네일(안됨)</label>
                <input type="file" id="lprofile" name="lprofile">
            </li>
            <li>
                <label for="ltitle">강의 제목</label>
                <input type="text" id="ltitle" name="ltitle">
            </li>
            <li>
                <label for="lintro">강의 소개</label>
                <textarea id="lintro" name="lintro"></textarea>
            </li>
            <li>
                <label for="lbook">강의 교재</label>
                <input type="text" id="lbook" name="lbook">
            </li>
            <li>
                <label for="lprice">가격</label>
                <input type="text" id="lprice" name="lprice">
            </li>
            <li>
                <label>학년</label>
                <label for="one">1학년</label>
                <input type="radio" id="one" name="lgrade" value="1" checked>
                <label for="two">2학년</label>
                <input type="radio" id="two" name="lgrade" value="2">
                <label for="three">3학년</label>
                <input type="radio" id="three" name="lgrade" value="3">
            </li>
            <li>
                <label for="lopendate">오픈일자</label>
                <input type="date" id="lopendate" name="lopendate">
            </li>
            <li>
                <label for="lperiod">수강기간</label>
                <input type="text" id="lperiod" name="lperiod">
            </li>
            <li>
                <label for="lcount">총 강의 수</label>
                <input type="text" id="lcount" name="lcount">
            </li>
            <li>
                <input type="submit" value="추가하기">
                <input type="reset" value="삭제하기">
            </li>
        </ul>
    </form>
</body>
</html>
