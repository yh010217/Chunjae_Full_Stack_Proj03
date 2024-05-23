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
    <link rel="stylesheet" href="/resources/css/lecture/insert.css">
</head>
<body>
    <article id="lecInsert">
        <div class="lecInsert_form">
            <h1>강의 등록하기</h1>
            <form method="post" action="/index/insertresult" enctype="multipart/form-data">
                <ul>
                    <li>
                        <div class="thumbnail" id="thumbnail"><img src="" alt=""></div>
                    </li>
                    <li class="input_th">
                        <label>썸네일 등록</label> <br>
                        <input type="file" id="file" name="file">
                    </li>
                    <li>
                        <label for="ltitle">강의 제목</label> <br>
                        <input type="text" id="ltitle" name="ltitle" placeholder="오타 주의">
                    </li>
                    <li>
                        <label for="lintro">강의 소개</label> <br>
                        <input type="text" id="lintro" name="lintro" placeholder="15자 이내로 적어주세요.">
                    </li>
                    <li>
                        <label for="lbook">강의 교재</label> <br>
                        <input type="text" id="lbook" name="lbook" placeholder="교재 이름만...? 링크도 받아야?">
                    </li>
                    <li>
                        <label for="lprice">가격</label><br>
                        <input type="text" id="lprice" name="lprice" placeholder="무료 강의일 경우, 0을 적어주세요.">
                    </li>
                    <div class="test">
                        <li>
                            <label>학년</label> <br>
                            <input type="radio" id="one" name="lgrade" value="1" checked>
                            <label for="one">1학년</label>
                            <input type="radio" id="two" name="lgrade" value="2">
                            <label for="two">2학년</label>
                            <input type="radio" id="three" name="lgrade" value="3">
                            <label for="three">3학년</label>

                        </li>
                        <li>
                            <label for="lopendate">오픈일자</label> <br>
                            <input type="date" id="lopendate" name="lopendate" >
                        </li>
                    </div>
                    <li>
                        <label for="lperiod">수강기간</label> <br>
                        <input type="text" id="lperiod" name="lperiod" placeholder="숫자로만 적어주세요.">
                    </li>
                    <li>
                        <label for="lcount">총 강의 수</label> <br>
                        <input type="text" id="lcount" name="lcount" placeholder="숫자로만 적어주세요.">
                    </li>
                    <li>
                        <input type="submit" value="추가하기">
                        <input type="reset" value="삭제하기">
                    </li>
                </ul>
            </form>
        </div>
    </article>
</body>
</html>